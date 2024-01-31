Log Aggregator Solution

While solving such problems, it is a good idea to first identify all the information that needs to be stored or cached and the best data structure to store it. To finalize the data structure, identify what operations you will be performing on this data and the most efficient data structures for these operations.

In our case, we can see get methods to fetch logIds, by machineId and serviceId each. While we can calculate this mapping when the respective functions are called, it would be much more efficient to pre-calculate these mappings so that the implementations of getLogsFromMachine() and getLogsOfService() can be optimized.

This means we need a mapping for machineId -> logId (which is stored in logsForMachine in the solution below) and serviceId -> logId (which is stored in logsForService in the solution below) which can be returned directly without any further pre-computation.

When we talk about mappings, hashmaps or dictionaries are our best bet due to efficient key-based lookups. Each language has a data structure providing similar functionality. For example, in Java, we can use a HashMap, in Python, we can use a dictionary, etc.

ow, we already have mappings for logs against machineId and serviceId. Similarly, we will also have a mapping for logId -> message (stored in logs variable in the solution below) to store the message strings for each logId.
