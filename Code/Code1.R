library(quantmod)
library(lubridate)

prcp = read.table("PRCP.csv", quote="\"", comment.char="",col.names = c("date","prcp"))
prcp = prcp[order(prcp$date),]
prcp$date = as.Date(as.character(prcp$date),"%Y%m%d")

prcp$year = year(prcp$date)
prcp$month = month(prcp$date)
setdiff(1877:2018,unique(prcp$year))
prcp_mean = matrix(1:(length(1877:2018)*12),nrow = 12)
prcp_min = prcp_mean
prcp_max = prcp_mean
month = prcp_mean
for(y in 1877:2018){
  for(m in 1:12){
    prcp.1 = prcp$prcp[prcp$year == y & prcp$month == m]
    prcp_mean[m,y-1876] = mean(prcp.1)
    prcp_min[m,y-1876] = min(prcp.1)
    prcp_max[m,y-1876] = max(prcp.1)
    month[m,y-1876] = as.numeric(paste0(y,formatC(m, flag = '0', width = 2)))
  }
}
prcp.month = data.frame(month = c(month), mean = c(prcp_mean), min = c(prcp_min), max = c(prcp_max))
write.csv(prcp.month,file = "prcp_month.csv")


TMAX = read.table("TMAX.csv", quote="\"", comment.char="",col.names = c("date","TMAX"))
TMAX = TMAX[order(TMAX$date),]
TMAX$date = as.Date(as.character(TMAX$date),"%Y%m%d")
#TMAX_xts = xts(TMAX$TMAX,order.by=TMAX$date)
#chartSeries(TMAX_xts)
TMAX$year = year(TMAX$date)
TMAX$month = month(TMAX$date)
setdiff(1877:2018,unique(TMAX$year))
TMAX_mean = matrix(1:(length(1877:2018)*12),nrow = 12)
TMAX_min = TMAX_mean
TMAX_max = TMAX_mean
month = TMAX_mean
for(y in 1877:2018){
  for(m in 1:12){
    TMAX.1 = TMAX$TMAX[TMAX$year == y & TMAX$month == m]
    TMAX_mean[m,y-1876] = mean(TMAX.1)
    TMAX_min[m,y-1876] = min(TMAX.1)
    TMAX_max[m,y-1876] = max(TMAX.1)
    month[m,y-1876] = as.numeric(paste0(y,formatC(m, flag = '0', width = 2)))
  }
}
TMAX.month = data.frame(month = c(month), mean = c(TMAX_mean), min = c(TMAX_min), max = c(TMAX_max))
write.csv(TMAX.month,file = "TMAX_month.csv")


TMIN = read.table("TMIN.csv", quote="\"", comment.char="",col.names = c("date","TMIN"))
TMIN = TMIN[order(TMIN$date),]
TMIN$date = as.Date(as.character(TMIN$date),"%Y%m%d")
#TMIN_xts = xts(TMIN$TMIN,order.by=TMIN$date)
#chartSeries(TMIN_xts)
TMIN$year = year(TMIN$date)
TMIN$month = month(TMIN$date)
setdiff(1877:2018,unique(TMIN$year))
TMIN_mean = matrix(1:(length(1877:2018)*12),nrow = 12)
TMIN_min = TMIN_mean
TMIN_max = TMIN_mean
month = TMIN_mean
for(y in 1877:2018){
  for(m in 1:12){
    TMIN.1 = TMIN$TMIN[TMIN$year == y & TMIN$month == m]
    TMIN_mean[m,y-1876] = mean(TMIN.1)
    TMIN_min[m,y-1876] = min(TMIN.1)
    TMIN_max[m,y-1876] = max(TMIN.1)
    month[m,y-1876] = as.numeric(paste0(y,formatC(m, flag = '0', width = 2)))
  }
}
TMIN.month = data.frame(month = c(month), mean = c(TMIN_mean), min = c(TMIN_min), max = c(TMIN_max))
write.csv(TMIN.month,file = "TMIN_month.csv")





