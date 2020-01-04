

#### MOdel Building  ####

data = read.csv('Train_clean.csv')

library(xgboost)
library(magrittr)
library(dplyr)
library(Matrix)


# Make Ratio of 30% and 70% for test and train dataset 

dim(data)
# [1] 456548     14

data = data[, -c(1)]
attach(data)

# Model Development First 1:130 Weeks 

train = data[ c(1:407243), ]
  
# Model Eveluation 131:145 Weeks

test = data[c(407244:456548), ]


## Create Matrix for - Train data

trainm = sparse.model.matrix(train$num_orders ~ . -1, data = train)

train_lable = train[, "num_orders"]

train_matrix = xgb.DMatrix(data = as.matrix(trainm), label = train_lable)


## Create Matrix for - Test data

testm = sparse.model.matrix(test$num_orders ~ . -1, data = test)

test_lable = test[, "num_orders"]

test_matrix = xgb.DMatrix(data = as.matrix(testm), label = test_lable)


## Set Parameters

## https://www.analyticsvidhya.com/blog/2016/03/complete-guide-parameter-tuning-xgboost-with-codes-python/

nc = length(unique(train_lable))

xgb_par = list("objective" = "multi:softmax",
               "eval_metric" = "rmse",
               "num_class" = nc)

watchlist  = list(train  = train_matrix, test = test_matrix)

## XGBoost Model

bst_model = xgb.train(params = xgb_par, data = train_matrix,
                      nrounds = 20,
                      watchlist = watchlist,
                      eta = 0.05)

## Train and Tets erroe plot

bst_model


