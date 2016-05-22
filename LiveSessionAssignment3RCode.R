##########This is the code for Doing Data Science Live Session Assignment -3 #########

install.packages ("plyr")

library(plyr)
library(gdata)
installXLSXsupport()

# read in original manhattan data download from the site
mh<- read.csv(file="Analysis/Data/rollingsales_manhattan.csv")

head(mh)
summary(mh)
class(mh)

sapply(mh,class) # can see what classes all of the data variables are...

mh$SALE.PRICE.N<- as.numeric(gsub("[^[:digit:]]","",mh$SALE.PRICE))
length( which(is.na(mh$sale.price.n)))
names(mh)
names(mh) <- tolower(names(mh))
names(mh)

##clean/format the data with regular expressions
mh$gross.sqft<- as.numeric(gsub("[^[:digit:]]","",mh$gross.square.feet))
mh$land.sqft<- as.numeric(gsub("[^[:digit:]]","",mh$land.square.feet))
## do a bit of exploration to make sure there is not anything weird going on with sales prices
attach(mh)
hist(sale.price.n)
hist(sale.price.n[sale.price.n>0])
hist(gross.sqft[sale.price.n==0])
detach(mh)

##keep only the actual sales

mh.sale<- mh[mh$sale.price.n!=0,]
plot(mh.sale$gross.sqft, mh.sale$sale.price.n)
plot(log(mh.sale$gross.sqft), log(mh.sale$sale.price.n))
