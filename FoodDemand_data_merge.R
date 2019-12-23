
## *********** FOOD DELIVERY FORCAST *********** ##

train = read.csv('train.csv')

meal = read.csv('meal_info.csv')

fulfilment = read.csv('fulfilment_center_info.csv')

# COmplet Data Merger 

train1 = merge(train,meal)

train2 = merge(train1,fulfilment)

write.csv(train2, 'train_merge.csv')

