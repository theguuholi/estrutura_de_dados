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
