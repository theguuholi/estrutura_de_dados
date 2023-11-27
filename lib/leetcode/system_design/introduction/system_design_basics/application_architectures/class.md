Some of the things that we'll cover here are:

What are the different architecture types
When should you prefer which architecture
What are the tradeoffs associated with each architecture

# Class

## Application Architectures

- Code maintainability
- High Code Velocity
- Scale
- Evolution and comparison

Web 1.0, 23b 2.0

## Monolithic Architecture

- Problems
-- bound by technology
-- easy to break things
-- hard to honour boundaries
-- traffic spikes
-- deployment
-- exponential issues

The solution for it is microservices



What is improved in MS 

- Tech stack freedom
- separation of concerns
- easy for engineers
- faster iterations
- independent scaling 

## Costs of microsservices
- Latency 
- Network failure
- backward compatibility

- Operational Costs
- Logging 
- Service Discovery 
- Autoscaling 



What to choose, when?

Monoliths 
- few services, small team

Microservices
Large organisations
100s / 1000s of services interviews



===

What are the Downsides?
As the team size grows, some problems start coming up with this approach as well.

One of the most common problems with monoliths is that you are bound to a single technology stack. Suppose you have a monolith built on Java with Spring framework. Now you need to add some Machine Learning logic, and you want to use Python for it. That is nearly impossible in monolithic architecture. You either need to figure out a way to do this with Java, or you need a standalone application that handles your machine learning logic, which defeats the purpose of a monolithic app.
Another problem would be that it is very easy to break things in such an architecture. That is because, when you have such a huge codebase, it is nearly impossible for everyone to know everything about how the entire system works. If you change some logic in the shared code, you might end up breaking someone else’s feature. Sure you can have test cases, but even those are not enough sometimes.
Another major issue is scalability. It is very tricky to scale a monolithic application. Let us look at the example of an e-commerce application. In case of a Black Friday sale, you might need to scale your payments and cart modules, but Warehouse and Notification modules can continue to work at the same pace. This cannot be done in a monolithic app. Since it is the same codebase, you will need to deploy the entire system again and again. This means the capacity meant for the Warehouse module might be sitting idle or that the Payment and Cart modules may choke the rest of the system.
Deployments are also a very tedious process here. Since the code is huge, it takes much longer to build, package, and deploy the code. That said, if you update the code for Warehousing, even the Payments module must be redeployed since everything is packaged together.
If there is a performance issue in one part of the system, chances are it will leak to the rest of the system as well. Even a small memory leak in the Warehousing module, if it starts choking the other modules, can cause the entire application to have issues.
So what is the solution for this?




