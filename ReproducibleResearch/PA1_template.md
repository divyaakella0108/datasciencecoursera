---
title: "Reproducible Research: Peer Assessment 1"
output: 
  html_document:
    keep_md: true
---

## Loading and preprocessing the data

```r
setwd("C:/Users/212470996/Desktop/dataset/RR")

if(!exists("activity"))
{ 
  FileUrl <- "https://d396qusza40orc.cloudfront.net/repdata%2Fdata%2Factivity.zip"
  download.file(FileUrl,destfile = "./activity.zip")
  unzip("./activity.zip")
  activity <- read.csv("./activity.csv",header = TRUE)
}
```

## What is mean total number of steps taken per day?  
*  Solved this question using SumStepsPerDay. 
*  Below MeanOfTotalSteps chunck of code gives histogram of the total number of steps taken each day. 
*  Calculated mean and median of the total number of steps taken per day.


```r
   SumStepsPerDay <- aggregate(steps~date,activity,sum, na.rm = TRUE)
   
   hist(SumStepsPerDay$steps, col = "blue")
```

![](PA1_template_files/figure-html/unnamed-chunk-2-1.png)<!-- -->

```r
   MeanSteps <- mean(SumStepsPerDay$steps)
   MedianSteps <- median(SumStepsPerDay$steps)
```
## What is the average daily activity pattern?  
* Based on MeanActivityPattern, Time Series Plot has been created.

```r
MeanActivityPattern <- aggregate(steps~interval,activity,mean, na.rm = TRUE)

plot(MeanActivityPattern$interval,MeanActivityPattern$steps, type ="l", xlab = "steps", ylab="ActivityInterval")
```

![](PA1_template_files/figure-html/AvgDailyActivityPattern-1.png)<!-- -->

```r
MaxSteps <- MeanActivityPattern[which.max(MeanActivityPattern$steps),]
MaxSteps$interval
```

```
## [1] 835
```
## Imputing missing values  
* Calculates and report the total number of missing values 
* Devise a strategy for filling in all of the missing values in the dataset.
* Create a new dataset including the missing values with strategy defined above
* Make a histogram of the total number of steps taken each day 
* Calculate and report the mean and median total number of steps taken per day.
* Find impact of imputing missing data on the estimates of the total daily number of steps.



```r
missingsvalues <- is.na(activity$steps)
CountMissingValues <- nrow(activity[missingsvalues,])

activityNoNA <- activity

getMeanStepsPerInterval<-function(interval){
    MeanActivityPattern[MeanActivityPattern$interval==interval,]$steps
}

activityNoNA<-activity
for(i in 1:nrow(activityNoNA)){
    if(is.na(activityNoNA[i,]$steps)){
        activityNoNA[i,]$steps <- getMeanStepsPerInterval(activityNoNA[i,]$interval)
    }
}

SumStepsPerDayNoNA <- aggregate(steps ~ date, data=activityNoNA, sum)
hist(SumStepsPerDayNoNA$steps)
```

![](PA1_template_files/figure-html/ImputeMissingValues-1.png)<!-- -->

```r
MeanStepsPerDayNoNA <- mean(SumStepsPerDayNoNA$steps)

MedianStepsPerDayNoNA <- median(SumStepsPerDayNoNA$steps)
```
## Are there differences in activity patterns between weekdays and weekends?  
Below Lattice plot compares the weekend and weekday activity patterns. They vary slighly.


```r
library("lubridate")
```

```
## Warning: package 'lubridate' was built under R version 3.5.1
```

```
## 
## Attaching package: 'lubridate'
```

```
## The following object is masked from 'package:base':
## 
##     date
```

```r
weekend_weekday <- function(date)
{
day <- wday(as.Date(date),label = TRUE) 
if( day %in% c("Sun","Sat"))
return("weekend")
else if (day %in% c("Mon","Tue","Wed","Thu","Fri"))
return("weekday")
else stop("invalid date")
}

activityNoNA$day <- lapply(activityNoNA$date,weekend_weekday)

stepsByDay <- aggregate(activityNoNA$steps ~ activityNoNA$interval + as.character(activityNoNA$day), activityNoNA, mean)

names(stepsByDay) <- c("interval", "day", "steps")

library("lattice")
xyplot(steps ~ interval | day, stepsByDay, type = "l", layout = c(1, 2), xlab = "Interval", ylab = "Steps")
```

![](PA1_template_files/figure-html/ActivityPatternWeekdayWeekend-1.png)<!-- -->
