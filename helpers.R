library(plyr);library(dplyr)
library(reshape2)

## download url zip file
fileUrl <- "https://d396qusza40orc.cloudfront.net/repdata%2Fdata%2FStormData.csv.bz2"
bz2fileName <- "./data/StormData.csv.bz2"
download.file (fileUrl, bz2fileName, "curl")

# load data
file <- read.csv(bzfile(bz2fileName, "r"), header = TRUE, sep = ",",
                 na.string = "", strip.white = TRUE,
                 blank.lines.skip = TRUE)

# columns of interest
dataset <- file[,c(7,2,8,23:24)]

# reshape data for analysis
## date
newdataset <- dataset %>%
  mutate(bgndate = format(as.Date(as.POSIXct(BGN_DATE, format = "%m/%e/%Y %k:%M:%S")),format="%Y-%m-%e"),
         bgnyear = as.numeric(format(as.POSIXct(BGN_DATE, format = "%m/%e/%Y %k:%M:%S"),format="%Y")))
## event
newdataset$EVTYPE <- toupper(newdataset$EVTYPE)
## fatalities + injuries
nd <- newdataset[,-c(2,6)]
nd_g <- group_by(nd,bgnyear,STATE,EVTYPE,humdmg=FATALITIES+INJURIES,evfreq=frequency(EVTYPE))
ndyear <- nd_g[,-c(3:4)]
humcost <- aggregate(cbind(humdmg,evfreq) ~ STATE+bgnyear, data=ndyear,sum)

# write csv file
write.csv(humcost,"./data/humcost.csv",row.names = FALSE,quote = TRUE,na="NA")

