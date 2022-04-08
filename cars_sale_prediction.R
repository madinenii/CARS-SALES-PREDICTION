
dataset = read.csv("car_sales.csv")
View(dataset)
testrequest= dataset[,4]
offerrequest = dataset[,5]
data = data.frame(testrequest,offerrequest)
View(data)
str(data)
library(caTools)
set.seed(211)
split = sample.split(data$offerrequest,SplitRatio = 0.8)
View(split)
training_set = subset(data,split==TRUE)
testing_set = subset(data,split==FALSE)
View(training_set)
View(testing_set)

regressor = lm(formula = offerrequest~testrequest,data = training_set)

y_pred = predict(regressor,newdata = testing_set)
a = testing_set$offerrequest
b = y_pred

plot(testing_set$testrequest,a,type='p',col='blue',xlab = 'Count',ylab='red')
lines(testing_set$testrequest,b,type = 'o',col='red')
