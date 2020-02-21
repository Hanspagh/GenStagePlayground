# GenStagePlayground

## Hands on with Flow
Provides a small setup for trying to run Flow on some data

Two sample data files are to be found in `priv` folder
These contains shipments of the following format
  ```
   :to, country where the the shipment sailed from  
   :from, country where the the shipment sailed to  
   :container_type, the type of the containers
   :container_size, the size of the containers
   :amount, how many containers
   :booking_id, the booking id, relates to a customer
   :ts, the timestamp from when the shipment came into our `system`
  ```

Two helper functions are provided in `GenStagePlayground` to get started playing with flow
* A flow from a from a file
* A flow from an endless stream

### Ideas for tasks

#### Basics using the flow from a file:

* Find the total number of containers in our shipments
  * What about the total number of `reef` containers?

* How many shipments are going out of denmark?
* Play around with number of stages to see how it effects the performance

#### Advanced:
* Use the `CustomerRegisterService` to find the customer for a shipment and count how many shipments each customer made
  * Try to use the `latency` param of  `get_owner` to see how it effects the flow

* Play with `Windows` to show the above results for different `Count`,`Periodic` or `Fixed` windows 
* Try to run a endless flow from an endless stream

For help with the above check out the `GenStagePlayground.Help` Module 