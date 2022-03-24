#amulya geereddy
#install packages
install.packages(c("rmarkdown", "car", "Hmisc","rio", "moments", "corrplot", "MASS", "ppcor"), dep =TRUE)
install.packages("rio")
install.packages("moments")
library(rio)
library(moments)
#import the data
filmdata=import("6304 Module 1 Assignment Data.xlsx",sheet="rko_film_19301941.dat")
colnames(filmdata)=tolower(make.names(colnames(filmdata)))
# Random Sample from Data
set.seed(62067273)
my.sample.data=filmdata[sample(1:nrow(filmdata),45),]
#question3 creating my primary data
my.sample.data["total.revenue"] = my.sample.data$foreign.revenue + my.sample.data$domestic.revenue
my.sample.data["total.profit"] = my.sample.data$total.revenue - my.sample.data$production.costs - my.sample.data$distribution.costs
# Analysis part 1
str(my.sample.data$total.revenue)
mean(my.sample.data$total.profit)
median(my.sample.data$total.profit)
sd(my.sample.data$total.profit)
skewness(my.sample.data$total.profit)
kurtosis(my.sample.data$total.profit)

#creating boxplot
boxplot(my.sample.data$total.profit,col="green",main="Boxplot for the profit for RKO studios")

#creating quantiles
quantile(my.sample.data$domestic.revenue,probs=seq(0,1,.10))

#creating histogram
hist(my.sample.data$total.profit,col="blue",main="plot of profit variable for RKO studios")


boxplot(filmdata$domestic.revenue,filmdata$foreign.revenue, col ="red", main = "Domestic and Foreign revenue", names= c("Domestic","Foreign"))



