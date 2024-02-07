No matter what kind of a system you are building, be it an e-commerce system or a content sharing platform, you will always have a notification service through which you will notify your customers of any new development. But how will you build such a system? Let’s have a look!

As always, we will define the requirements first.

## Functional Requirements

Send Notifications
Plugable and extendable - easy enough to add to any application and easy to extend to different kinds of notification
SaaS - We might need to impose rate-limit - It could be to avoid spamming a user with promotional messages or to ensure external systems are not exerting too much load on any of the services.
Prioritization - certain messages like OTP are higher priority, whereas promotional messages are lower priority

## Non Functional Requirements

Always available
Easy enough to add more clients
Scalable: Should be linearly scalable if we want to expose this as a SaaS Notification service to variou companies of Amazon/Twitter scale.

## System Architecture

We have something called a Notification service which we will use to interact with clients. Now, clients can send two types of requests. It could have some content, and a channel over which the notification has to be sent, for example email, or the request could have a user id, and the content and the system will decide the channel over which the notification is sent. Now, if the notification service is to be used by an external system, usually the request will be of the first kind i.e. the channel will be fixed. Whereas if it is an internal system, the request will provide a user id and the channel for sending the notification will be decided by the system based on other conditions.

The notification service will now send the request to Kafka, which will pass on the request to Notification validator and prioritizer which performs basic validations like email should not be null or invalid. In addition to this, based on some identifiers, say message type, it will decide the priority of the message. For example, the OTP gets a very high priority as it is blocking the user from logging in as opposed to a promotional message. Once the priority of the message is decided, the message will be forwarded to different Kafka topics for different priority levels, and the consumers, while picking the requests, will first pick the message from a high priority topic, then medium, then low priority messages. This is because we cannot afford a lag on high-priority messages, but we are ok with a slight lag in case of lower priority messages.

Next is something called a rate limiter. Rate limiter performs two kinds of checks - if the client is allowed to send these many requests and if the user is supposed to get this many notifications. It could be based on which subscription plan a client has chosen in case some external party is using this system. It could also be based on a configuration that sets the maximum number of promotional messages a user is supposed to receive. Both types of limiting will be implemented using a certain key, which is inserted in a Redis for a certain time frame when a request comes with that key. When that rate limit is exceeded, the request is dropped.

The next thing the rate limiter does is request counting. Some clients pay on a pay-per-use model. There is no limit on the number of requests but the payable amount is based on the number of requests. For such clients, instead of restricting the requests, we will maintain a count of requests and build some reporting on top of it to bill the clients.

The next component is the notification handler and user preferences service. Now users could have unsubscribed for promotional notifications or specified a preferred channel for receiving the promotional messages. This is taken care of by the user preferences side of this service. It will interact with a Preferences DB - which stores the user preferences, and a user service - to fetch the user’s information before sending the notification. Now suppose in our user preferences, users can set a limit on promotional messages they receive from our end. In such a case, we can have the user preferences service before the rate limiter. That is something you can decide based on the discussion with your interviewer.

Once we have the contact information, contact channel, and the content, we can proceed with sending the notification to the user. At this point, we will send an event to Kafka along with all this information. Kafka will further be connected to multiple handlers that will handle requests of various message types. For example, SMS requests will go to the SMS handler, etc. There could also be different Kafka topics for each type of request. Now continuing with the SMS request example, the SMS service will be interacting with multiple SMS vendors to send SMSs in India, US, Europe, etc. Similarly, if you have multiple vendors that can send SMSs in India, then which requests go to which vendor and with what priority will also be handled by SMS handler. Similarly, the email handler will interact with an email vendor to send out the emails. We will also have an in-app handler to send out the in-app notifications; it could use Firebase or other push notification services for sending out these notifications. There will also be an IVRS handler to send out IVRS confirmation or feedback calls.

Remember the pluggability requirement? Suppose, at a later point, we need to add Whatsapp as a notification mechanism. All we need to do is add WhatsApp as a notification type or a message type and add a WhatsApp handler. Now any requests for WhatsApp notifications will be directed to the WhatsApp handler.

The next component in our system is a Notification tracker, which keeps track of notifications we send out for auditing purposes and stores all the notifications permanently in a Cassandra. You could, of course, group some components of this architecture to reduce the number of components. This can be decided during the interview as per discussion with your interviewer.

Now, what if you want to send out bulk notifications? This is where a bulk notification service comes in. We will have a bulk notification UI, which will talk to the bulk notification service, which takes a filter criterion and notification content and send out the notification to the filtered users.

We have a User transaction data service, which is an abstraction over other independent services that store transactional information into various Kafka topics. We can build search functionality on top of all these Kafka topics. A transaction data parser will listen to all these events that Kafka is receiving. The transaction data parser will parse all this information and bring it down to a format it can understand and puts it in a data store, like elasticsearch or any other data store. A query engine sits on top of this data store to filter out users based on certain criteria. Now the bulk notification service has a list of filtered users and messages that it needs to send out, and it will call the notification service with this information to send out these notifications.

The query engine will also have other consumers interacting with it like rule engines, fraud engines, or search platforms. Basically, any services that perform certain actions based on conditions can be powered by the querying engine.

That should be it for Notification Service System Design.
