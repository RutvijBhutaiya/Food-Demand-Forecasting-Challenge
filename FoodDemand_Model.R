

#### MOdel Building  ####

data = read.csv('Train_clean.csv')


# Make Ratio of 30% and 70% for test and train dataset 

dim(data)
# [1] 456548     14

# Model Development First 1:130 Weeks 

train = data[ c(1:407243), ]
  
# Model Eveluation 131:145 Weeks

test = data[c(407244:456548), ]


