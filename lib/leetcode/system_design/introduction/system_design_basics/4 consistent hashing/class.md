What is hashing
Hash is basically a function that takes a value and converts it into another value of a specific format.

This is a very simple hash function. Some more realistic hash functions that are more commonly used are MD5, SHA1, SHA256, etc.

Why hashing?
Suppose you build a distributed cache, where the data is distributed over various nodes, sometimes spanning multiple data centers. When we want to store the data for a user, we need to decide which node will cache this data. And when we want to retrieve this cached value, we must query the same node. So let us use a simple hash function for this again.

Where is it Used?
Now we just saw how we could use consistent hashing while building a caching system. There are a lot of systems out there that use consistent hashing for improving their performance. For example, Cassandra, a distributed NoSQL Columnar DB that deals with huge traffic uses consistent hashing to distribute its data. Amazon’s Dynamo DB is another such example. It is a managed distributed DB which uses consistent hashing for distributing its data. Similarly, Couchbase is another NoSQL DB (a document DB) which uses consistent hashing to distribute its data across various instances.