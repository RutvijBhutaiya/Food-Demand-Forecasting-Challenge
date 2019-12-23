

## FOOD DEMAND DATA SUMMARY ##

train = read.csv('train_merge.csv')

dim(train)

colSums(is.na(train))  ## No Missing values

summary(train)

str(train)
