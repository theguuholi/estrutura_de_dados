How does Facebook, with it's billions of monthly active users, manage to service all the users across the globe with barely any downtime. Let’s have a look!

First things first, let's look at the requirements first.

Functional Requirements
Post - Text, image, video, link, etc
Like, comment, share
Add friends - non-directional relationship
See timeline
See a user’s post, profile
Activity log - about likes, comments, and shares

Non-functional Requirements
Read heavy - read to write ratio is very high
Fast rendering and posting
Lag is Ok, but latency should be low - it is ok if we get notification about someone’s post a few minutes late, but once received it should render almost instantaneously
Access pattern for posts - perform optimization such that media content is easily accessible when the post has maximum interaction
Globally available - on a variety of devices, support multiple languages, and all sorts of internet bandwidth
Scalable

Before we discuss the architecture, let's categorize the users into five categories, and we will handle each of these categories a little differently. These categories are - famous users, active users, live users, passive users, and inactive users.

Facebook currently limits the number of friends you can have, so the famous user category is not really a necessity. But in case such a requirement pops up, for example, in the case of a system like Instagram, famous users will be the users with a lot of friends or followers. Active users are the ones who have accessed the system recently, in our case, within the last three days. Live users are the ones who are using the app currently, passive users are the non-famous users who are not active, and inactive users are basically the soft-deleted accounts.

# System Architecture

image1

User onboarding, login, and user profile-related operations are handled by a user service. The user service sits on a MySQL database, Mysql, because it is a very relational data from a structure point of view. Also, user information will be more read-heavy than write, and MySQL is enough for such a query pattern. The user service is also connected to a Redis for caching all the user information. When user service receives a request, it first looks up in Redis. If Redis has the information, it is returned to the user. Otherwise, the user service checks in the MySQL DB, inserts the information into Redis for future use, and then returns back to the user. Also, whenever a new user is added or information is updated, an event is inserted into Kafka so that the other services in the system are aware of the change.

What about adding friends? How does that work?
This is where the graph service comes in. It keeps track of relationships between users, their weights, and more. Graph service sits on top of a MySQL database. MySQL is used because this data will simply be a mapping of user ids, friend ids, and other such information related to the relationship between two users, which is very structured data. The graph service maintains a cache in a Redis so that we don’t have to repeatedly query the MySQL DB every time we need to fetch a user’s friend.

Another thing we cache in Redis is the user type i.e. whether the user is active, live, or famous. Relevance tag is another thing cached in Redis, to make sure the user’s timeline is more aligned to their interests. For example, sports-related posts will be shown to friends who are more interested in sports; similarly, travel enthusiasts will see what their friends post about traveling. This is how Facebook makes the experience more engaging and interesting for users. Finally, we will also store the last time each user was seen, which could be useful in case we build chat functionality in the future.

Now let’s get started with the architecture of the system. We will again divide the system into various user flows. First, let’s have a look at how the users post content and how they retrieve their timeline.

There is a component called short URL service, which will shorten the longer URLs which will be posted on our platform, and when the user seeing this post clicks on the short link, they will be redirected to the original URL. All this is taken care of by the short URL service. We won’t be discussing how this service works, but you can go through our other video on TinyURL System Design, where we have explained this in detail. Now, another important component we have is an asset service. Remember, our posts can have links, text, images, and videos. And the photos and videos will be posted from different types of devices which also affects the image’s aspect ratio, resolution, etc. Suppose a user posts a square-ish photo from their laptop, that picture might not look good on a mobile phone. Or suppose a user on very fast network posts a very high definition and high-resolution video, which will take forever to load on a slow-speed internet. This is where our asset service comes in. Asset service will take care of converting streaming the file into multiple formats, aspect ratios, and network bandwidth. Again, we are not discussing the Asset service in detail as we have already explained it in another video on Netflix System Design, so please make sure to go through that.

Remember how we mentioned access patterns in our NFRs? That the post will get a lot of traction when it has just been posted, and over time the popularity will die down. Once the post is not accessed very often, we can remove it from CDN, and the same capacity can be used by some other asset. This is another thing that asset takes care of. It decides which content goes on CDN and what goes into S3, which we are using as a permanent asset store. Now let’s say a celebrity likes another celebrity’s old photo. Now, this photo will again get a lot of traction, so it will be pulled from S3 to CDNs in the geographical locations it is being accessed frequently.

# But How Do Our Users Post Their Content?

This is where our post ingestion service comes in. If the post has audio/video or images, the post ingestion service will talk to asset service. If the post has links, the post ingestion service will talk to the short URL service. Then the final content will be persisted in Cassandra. Now once the post is saved into Cassandra, the post information is provided to the post service. It will also expose APIs to other services to access all the posts. When a post comes in, the post ingestion service also fires an event into Kafka, which will further pass on the event to other subsystems. Now Kafka is also connected to the Analytics subsystem, which will have a bunch of streaming consumers listening to these events. These consumers will now categorize the post into various categories with the help of some ML algorithms. Once a category is tagged to the post, it will be sent to Kafka. Then comes the post processor. The post processor, which also receives this tagged post, talks to the user service and group service to fetch the friends of this user who can see this post and finds the relevance tags to determine which users might be interested in this post. It comes up with a subset of the user’s friends who will now see this post and puts all the relevant posts into the Redis cache. Now you might remember from our Twitter system design tutorial that Redis is also caching the timelines of all users. So once we find out that a post is relevant for a particular, their timeline will be updated with this new post.

IMAGE 2

## What happens when a user comes to their timeline?

When a person sees some other user’s timeline, a request is sent to the timeline service, which further queries the post service to fetch all the posts of that particular user and returns back to the user. When a person tries to see their own timeline, the request is sent to the timeline service, which fetches all the posts of all the friends from Redis. Suppose we were building something like Instagram, where our users can follow some very famous people. Now when a person tries to see their timeline, the timeline service already has posts of all the normal users. It will find the famous friends of the user from user and group service. Once it has the famous friends of our user, the timeline service talks to the post service to fetch all the new posts of all the famous users by their ids. This data can now also be persisted in Redis with a timestamp. Now the next time our timeline service gets a query, we will check if the timestamp is from a few seconds ago. If the timestamp is from a few minutes ago, we will again fetch the information from the post service to see if any new posts have come from our famous users.

Now we have successfully handled our active and famous users. But don’t you think our live users should get some special treatment?

When the post reaches the post processor, it has also queried the user service, so it knows which users are live. So along with writing into Redis, the post processor will also send an event to Kafka saying that this user is live and their timeline needs to be updated. This is where the live user service comes in. It maintains an open connection with all the App and Web users and notifies them of the new post.

Now there is something called an archival service. As we know, Redis cannot store a lot of data. So we will store only today’s data in Redis, and for the old posts, we will use the archival service. Now the thing with timelines is that new things will get added to it, but old things will remain as they are. So we can cache the whole thing in a more permanent data store like Cassandra. So sometime during the day, the archival service will fetch all the users' timelines and put them into the aggregated timeline, Cassandra, and clear the Redis cache.

## HotSpots!

Now wherever we are using Cassandra, we run the risk of creating a hotspot. That means, if we don’t partition the data carefully, we might end up with a Cassandra distributed across various machines such that only a few machines are handling most of the load. This could happen if we partition the data based on dates, rather than something more generic like a user id. Say all the posts from yesterday go to the same machine, then for as long as the posts have a lot of traction, that single Cassandra will have a lot of traffic, converting it into a hot spot.

IMAGE 3

## Like, Comment and Share!

Yeah, how does that work anyway? So we have a like/comment UI, which could be a phone or a laptop. When the user taps the like button, the request will be sent to the like service. Like service will take care of fetching likes for a post, adding a like to a post, basically anything and everything “like”. Whenever a post is liked, the information is stored in Cassandra. This information could be post id, post type like comment or post, and the user who has liked. Now this information (number of likes for a post) will also be cached in Redis against the recent posts. So when a like comes in and is added to Cassandra, Redis is also updated in the same way. Once a like is posted, it will also be communicated to Kafka so we can run further analytics on the same.

Now we have something called a Comment service to handle all the comment-related tasks. It uses Cassandra as a data store to store all comment-specific information. We don’t particularly need to cache this information because it will be a simple look-up by id, which will be fast enough. So we don’t implement caching here. And of course, whenever a comment is posted, an event is fired to Kafka to implement further analytics. Sharing a post is implemented in a way similar to a normal post. A shared post is just another post with a parent id of another post.

Now let us discuss something called an activity tracker. Remember we mentioned an activity log in our functional requirements? Well, we have been keeping track of all the user actions in Kafka anyways. Now we just need to store the information of these actions against a user id and a timestamp. It will also expose APIs to fetch information and populate on an activity UI.

Search will again be implemented in a way similar to Twitter. There will be a search consumer listening to events coming to Kafka and stores them in an elastic search. There will be a search service sitting on top of the elastic search, runs the queries, and cache the data before sending it to the user.

## What Analytics Can We Implement Here?

We can use some standard ML algorithms to classify the posts into various categories like politics, entertainment, sports, etc. We will have a spark streaming consumer running on Kafka, which will store the activity of the user in the Hadoop cluster, where we can run the previously mentioned algorithms to find out the user’s interest and do some user profiling. Once the user profile is created, we put another event in Kafka. User service reads this event and stores the user profile tag against the user id.

Now we have something called a graph weight. Graph weight keeps track of whose posts the user is more inclined towards based on whose posts we like more frequently. This again runs on a Spark cluster which queries the data within Hadoop. The last thing in our system is trends. This is again similar to trends on Twitter. It will keep track of what people are talking about on Facebook right now. This streaming job will go through all the posts and comments on Facebook, tokenize them and remove words like a, an, and the, and rank them by the count to find the most used words. Which we can use to find out what people are interested in right now. This information is very temporary and relevant for a very short time, so it is stored in a Redis cache.

Now one thing that goes without saying is that all of these services and components are horizontally scalable. We can add and remove instances as per the information we get from our alerting and monitoring system. These systems will keep track of latency, incoming requests, CPU performance, memory used, etc. As soon as we get to know something is reaching its limit, we can spin up another instance of that particular service.

That should be it for Facebook System Design!
