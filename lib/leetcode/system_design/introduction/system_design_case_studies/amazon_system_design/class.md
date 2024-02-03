From electronics to clothes to personal care products and medications, we are buying everything online! Even grocery shopping happens on Amazon these days! But how do you build a system that sells such a wide variety of products, provides smooth checkout options, and doesn’t crash during huge sales like The Black Friday Sale and The Great Indian Festival? Well, let’s have a look.

So as always, we will start by locking down the requirements.

Low Latency (baixa latencia): minimo de atraso

## Functional Requirements (FR)

Should provide a search functionality with delivery ETA (Estimated time of arrival).
Should provide a catalog of all products.
Should provide cart and wishlist features.
Should handle payment flow smoothly.
Should provide a view for all previous orders.

## Non Functional Requirements (NFR)

Low latency.
High availability.
High consistency.

## System Architecture

Now for a system that handles such high traffic, especially during huge sales, meeting all three non-functional requirements would be difficult. Sometimes we need to prioritize consistency over availability or vice versa. Fortunately, not everything needs to be consistently available, have low latency, and be extremely consistent.

For example, payment and inventory systems can have lower availability in order to attain higher consistency, and search needs to be highly available even if it is slightly inconsistent. Most user-facing components should have reasonably low latency.

Now that we have clear requirements, let’s start building the system. To keep things simple we will divide the system into two flows - Homepage/Search flow and Purchase/Checkout flow.

## Homepage and Search Flow

IMAGE 1

there will be two UIs that we will offer, a home screen which will have some recommendations, personalized or general depending on if it is a returning user or a new user, and a search page where users can see results based on some search text.

Now, a company operating at a scale like Amazon’s will be interacting with multiple suppliers. To manage these suppliers we will need multiple services that we are collectively calling **Inbound Services**.

These inbound services will interact with supplier systems and fetch the relevant data. When a new supplier is added or a supplier adds a new item to their inventory, it needs to flow into the system so that this information is easily available to the user. This information, again, will enter our system through the inbound service and reach the user on the homepage or through search results through various **consumers** listening to a **Kafka** which will receive events from Inbound services anytime such changes happen. Let’s look at these consumers in a little more detail.
