## Market Basket Analysis
Market Basket Analysis is One of the key techniques used by large retailers to uncover associations between items. It works by looking for combinations of items that occur together frequently in transactions. To put it another way, it allows retailers to identify relationships between the items that people buy. Apriori is an algorithm for frequent item set mining and association rule learning over transactional databases. The frequent item sets determined by Apriori can be used to determine association rules which highlight general trends in the database.

The data provided by Electonindex consist of its one-month online transactions and a file containing all the electronics that they sell. The three factors that used in this analysis were Support, Confidence and Lift. A total of 9834 transactions of 125 items were provided for analysis. Absolute item frequency plot and Relative item frequency plot were drawn to understand the items fought frequently by the customers.

### Objective

1)Prediction of customer preferences (Target brands)
2)Profitability prediction for new product type (Regression Analysis)
3)Product interdependencies (Market Basket Analysis)
4)Leverage data mining in the future at Blackwell

### General Overview of the Data

The data provided by Electonindex consist of its one-month online transactions and a file containing all the electronics that they sell. 

### Processing the Data set
The three factors that used in this analysis were Support, Confidence and Lift. A total of 9834 transactions of 125 items were provided for analysis. Absolute item frequency plot and Relative item frequency plot were drawn to understand the items fought frequently by the customers.

 Apriori algorithm is used to perform Market Basket Analysis. The Apriori algorithm is helpful when working with large datasets and is used to uncover insights pertaining to transactional datasets.

### Visualizing the Data Set
used the itemFrequencyPlot() function to visualize the item frequencies within the transactions as a bar chart. Used the image() function to visualize all of the transactions within the dataset.

### Evaluate & Improve your model
The three factors that used in this analysis were Support, Confidence and Lift.After discovering the optimal levels of Support and Confidence used the summary() function, to view an overview of rules' metrics. 
### Visualization of the results
Similar to the visualizations of the transactions performed, plotting  rules could potential help to discover more insights. 

### Summary
Analyzing the data of Electronidex, the frequency of sales as well as the frequency of customers buying 4 items, or more are high. The most bought item is the iMac and along with that probability of buying other accessories such as Logitech Keyboard, HDMI cable is pretty high. HP Laptop is the second most sold item among others. 




