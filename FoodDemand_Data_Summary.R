

## FOOD DEMAND DATA SUMMARY ##

train = read.csv('train_merge.csv')

dim(train)

colSums(is.na(train))  ## No Missing values

summary(train)

str(train)

attach(train)

## Sort is IMP for Week

train = train[order(week),]

## Remove ID and X vars

train = train[, -c(1,4)]

attach(train)

## Chcke for Outliers Using BoxPlot

boxplot(checkout_price, main = 'CheckOut Price', col = 'salmon')

boxplot(base_price, main = 'BAse Price', col = 'salmon')

boxplot(op_area, main = 'Opt Area Size', col = 'salmon')


## Ratio for Class vars

as.matrix(prop.table(table(homepage_featured)))*100

# [,1]
# 0 89.08001
# 1 10.91999

as.matrix(prop.table(table(emailer_for_promotion)))*100

# [,1]
# 0 91.884753
# 1  8.115247


## GGPLot Play

library(ggplot2)

ggplot(train, aes(as.factor(emailer_for_promotion), num_orders), color = center_type) + 
  geom_boxplot(aes(fill = as.factor(emailer_for_promotion)))

ggplot(train, aes(as.factor(homepage_featured), num_orders), color = center_type) + 
  geom_boxplot(aes(fill = as.factor(homepage_featured)))

ggplot(train, aes(center_type, num_orders), color = center_type) + 
  geom_boxplot(aes(fill = center_type))

ggplot(train, aes(cuisine, num_orders), color = cuisine) + 
  geom_boxplot(aes(fill = cuisine))

ggplot(train, aes(category, num_orders), color = category) + 
  geom_boxplot(aes(fill = category))



## NOrmalization

hist(center_id, main = 'Center ID Distribution', col = 'forestgreen')
hist(meal_id, main = 'Meal ID Distribution', col = 'forestgreen')
hist(checkout_price, main = 'CheckOut Price Distribution', col = 'forestgreen')
hist(base_price, main = 'Base Price Distribution', col = 'forestgreen')
hist(op_area, main = 'Ope Area Distribution', col = 'forestgreen')


## Correlation 

library(corrplot)
library(RColorBrewer)

corrplot(cor(train[, c(1,2,3,4,5,8,11,12,14)]), type = 'upper', order = 'hclust', 
         col = brewer.pal(n = 7, name = 'YlGnBu'))

# checkout_price and base price highly correlated Hence, removed base_price

train =train[, -5]

## Check the ANOVA and t-test

t.test(center_id, num_orders) #Significant
t.test(meal_id, num_orders) #Significant
t.test(week, num_orders) #Significant
t.test(checkout_price, num_orders) #Significant
t.test(city_code, num_orders) #Significant
t.test(region_code, num_orders) #Significant
t.test(op_area, num_orders) #Significant

summary(aov(num_orders~as.factor(emailer_for_promotion), data = train)) #Significant

summary(aov(num_orders~as.factor(homepage_featured), data = train)) #Significant

summary(aov(num_orders~as.factor(category), data = train)) #Significant

summary(aov(num_orders~as.factor(cuisine), data = train)) #Significant

summary(aov(num_orders~as.factor(center_type), data = train)) #Significant



write.csv(train, 'Train_clean.csv')
