######################################################################################
# Market Basket Analysis                                                             #                                                                                    
#Author : Rekha                                                                      #
                                                                                     #
# Version 1.0                                                                        #     
# Date : 16.05.2019                                                                  #     
# We have historical sales data and new product data sets                            #
# Need to Predict sales of four different product types                              #                                                                                  
# (PC, Laptops, Netbooks and Smartphones)                                            #                                                                                                                                                                        #                                                                                   #
                                                                                     #
######################################################################################

#installing the packages
#install.packages("arules")
#install.packages("arulesViz")
#install.packages("rattle")
#install.packages('prabclus')
#install.packages('RColorBrewer')

#loading the library####
library(arules)
library(arulesViz)
library(rattle)
library(prabclus)
library(RColorBrewer)
library(MASS)
library(mclust)
library(ggplot2)
#loading the dataset####
dataset <- read.transactions("ElectronidexTransactions2017.csv", format = "basket", sep=",")
dataset <- read.transactions("ElectronidexTransactions2017.csv", format = "basket", sep=",", 
                             cols = NULL, rm.duplicates = TRUE, encoding = "utf8")

# view the transactions####
inspect (dataset)
# Number of transactions.
length (dataset) 
# Number of items per transaction
size (dataset) 
#Lists the transactions by conversion (LIST must be capitalized)
LIST(dataset) 
# Summary of the dataset
summary(dataset)

#Visualize your dataset#####
#Plot top10
itemFrequencyPlot(dataset, topN = 10)
itemFrequencyPlot(dataset, topN=10,type="relative",col=brewer.pal(8,'Pastel2'),
                  main="Relative Item Frequency Plot", srt=90, las= 2)
                  

#Plot the top 20
itemFrequencyPlot(dataset, topN = 10)
itemFrequencyPlot(dataset,topN=10,type="relative",col=brewer.pal(8,'Pastel2'),
                  main="Relative Item Frequency Plot")
itemFrequencyPlot(dataset, topN = 10, type = "absolute", col = brewer.pal(8,'Pastel2'),
                  main = "Absolute Frequency Plot", srt=90, las= 2)

image (sample(dataset,150))
image(sample(dataset,20))
image(sample(dataset, expand.grid (1:125, 1:125, col = mat, axes = FALSE)))

# To see the item labels
itemLabels(dataset)

#apply Apriori Algorithm
##finding association rules####
rules <- apriori(dataset, parameter = list(supp = 0.012, conf = 0.05, minlen = 2))
rules
summary(rules)
inspect(rules)

#Evaluate the model
#rules <- sort(rules, by = 'support', decreasing = T)
#rules
rulesBylift <- sort(rules, by = "lift")
rulesBylift
inspect(rulesBylift)
#view rules
inspect(rulesBylift[1:20])
plot(rulesBylift, method = "grouped",
    measure = "support", horiz= TRUE, shading = "lift",
    interactive = FALSE, data = NULL, control = list(col=rainbow(5)))

#find relations with imac and other items####
imac.rules<- apriori(dataset, parameter = list(supp=0.01,conf= 0.02, minlen = 2),
                     appearance =  list(lhs="iMac"))
imac.rules
View(inspect(imac.rules))

plot(imac.rules[1:5], method = "graph",
     measure = "support", horiz= TRUE, shading = "lift",
     interactive = FALSE, data = NULL, control = NULL)

plot(imac.rules[1:5], method = "graph",
     measure = "lift", horiz= TRUE, shading = "support",
     interactive = FALSE, data = NULL, control = NULL)

#find relations with HP Laptop and other items####
hplaptop.rules<- apriori(dataset, parameter = list(supp=0.01,conf= 0.02, minlen = 2),
                         appearance =  list(lhs="HP Laptop" ))
hplaptop.rules
View(inspect(hplaptop.rules))

plot(hplaptop.rules[1:5], method = "graph",
     measure = "support", horiz= TRUE, shading = "lift",
     interactive = FALSE, data = NULL, control = NULL)

plot(hplaptop.rules, method = "graph",
     measure = "lift", horiz= TRUE, shading = "support",
     interactive = FALSE, data = NULL, control = NULL)

#plot the findings####
subRules<- rulesBylift[quality(rulesBylift)$lift > 1]
subRules
inspect(subRules)
plot(subRules)

subRules1<- rules[quality(rules)$confidence > 0.02]
subRules1
plot(subRules1[1:10])

plot(subRules1, method= "graph")

plot(subRules[1:5], method = "grouped",
     measure = "support", horiz= TRUE, shading = "lift",
     interactive = FALSE, data = NULL, control = NULL)

plot(subRules, method = "grouped",
     measure = "lift", horiz= TRUE, shading = "support",
     interactive = FALSE, data = NULL, control = list(col=rainbow(5)))


plot(subRules1[1:20], method = "grouped",
     measure = "lift", horiz= TRUE, shading = "support",
     interactive = FALSE, data = NULL, control = list(col=rainbow(5)))

plotly_arules(SubRules)
plotly_arules(imac.rules)








