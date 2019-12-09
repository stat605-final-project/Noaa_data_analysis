### Plot the time series and ACF. Also calculated the wanted statistics.

PRCP = read.csv("prcp_month.csv", row.names = 1)
TMAX = read.csv("TMAX_month.csv", row.names = 1)
TMIN = read.csv("TMIN_month.csv", row.names = 1)

pdf("PRCP_TS_and_ACF.pdf") 
prcp_max_ts = ts(as.vector(PRCP$max),start = 1877, end = 2018, frequency = 12)
prcp_min_ts = ts(as.vector(PRCP$min),start = 1877, end = 2018, frequency = 12)
prcp_mean_ts = ts(as.vector(PRCP$mean),start = 1877, end = 2018, frequency = 12)

par(mfrow = c(3,2))
plot(ts(as.vector(PRCP$max)[1465:1693],start = 2000, end = 2018, frequency = 12) ,ylab="Max prcp", main="Max prcp in 2000-2018")
acf(prcp_max_ts, main = "acf of prcp_max")

plot(ts(as.vector(PRCP$min)[1465:1693],start = 2000, end = 2018, frequency = 12) ,ylab="Max prcp", main="Min prcp in 2000-2018")
plot.new()

plot(ts(as.vector(PRCP$mean)[1465:1693],start = 2000, end = 2018, frequency = 12) ,ylab="Max prcp",main="Mean prcp in 2000-2018")
acf(prcp_mean_ts, main = "acf of prcp_mean")

dev.off()


pdf("TMAX_TS_and_ACF.pdf")

TMAX_max_ts = ts(as.vector(TMAX$max),start = 1877, end = 2018, frequency = 12)
TMAX_min_ts = ts(as.vector(TMAX$min),start = 1877, end = 2018, frequency = 12)
TMAX_mean_ts = ts(as.vector(TMAX$mean),start = 1877, end = 2018, frequency = 12)
par(mfrow = c(3,2))
plot(ts(as.vector(TMAX$max)[1465:1693],start = 2000, end = 2018, frequency = 12) ,ylab="Max TMAX", main="Max TMAX in 2000-2018")
acf(TMAX_max_ts, main = "acf of TMAX_max")

plot(ts(as.vector(TMAX$min)[1465:1693],start = 2000, end = 2018, frequency = 12) ,ylab="Max TMAX", main="Min TMAX in 2000-2018")
acf(TMAX_min_ts, main = "acf of TMAX_min")

plot(ts(as.vector(TMAX$mean)[1465:1693],start = 2000, end = 2018, frequency = 12) ,ylab="Max TMAX",main="Mean TMAX in 2000-2018")
acf(TMAX_mean_ts, main = "acf of TMAX_mean")

dev.off()


pdf("TMIN_TS_and_ACF.pdf")
TMIN_max_ts = ts(as.vector(TMIN$max),start = 1877, end = 2018, frequency = 12)
TMIN_min_ts = ts(as.vector(TMIN$min),start = 1877, end = 2018, frequency = 12)
TMIN_mean_ts = ts(as.vector(TMIN$mean),start = 1877, end = 2018, frequency = 12)
par(mfrow = c(3,2))
plot(ts(as.vector(TMIN$max)[1465:1693],start = 2000, end = 2018, frequency = 12) ,ylab="Max TMIN", main="Max TMIN in 2000-2018")
acf(TMIN_max_ts, main = "acf of TMIN_max")

plot(ts(as.vector(TMIN$min)[1465:1693],start = 2000, end = 2018, frequency = 12) ,ylab="Max TMIN", main="Min TMIN in 2000-2018")
acf(TMIN_min_ts, main = "acf of TMIN_min")

plot(ts(as.vector(TMIN$mean)[1465:1693],start = 2000, end = 2018, frequency = 12) ,ylab="Max TMIN",main="Mean TMIN in 2000-2018")
acf(TMIN_mean_ts, main = "acf of TMIN_mean")

dev.off()

### Calculated the years in which MAX TMAX / MIN TMIN / MAX PRCP occur.

TMAX_MAX_years = list()
TMAX_MAX = rep(0,12)
TMIN_MIN_years = list()
TMIN_MIN = rep(0,12)
PRCP_MAX_years = list()
PRCP_MAX = rep(0,12)

for(i in 1:12){
  index= c(0,(1:141)*12) + i
  
  TMAX_MAX_VALUE = max(TMAX$max[index])
  TMAX_MAX[i] = TMAX_MAX_VALUE
  TMAX_IND = which(TMAX$max[index] == TMAX_MAX_VALUE)
  TMAX_MAX_years[[i]] = TMAX_IND + 1876
  
  TMIN_MIN_VALUE = max(TMIN$min[index])
  TMIN_MIN[i] = TMIN_MIN_VALUE
  TMIN_IND = which(TMIN$min[index] == TMIN_MIN_VALUE)
  TMIN_MIN_years[[i]] = TMIN_IND + 1876
  
  PRCP_MAX_VALUE = max(PRCP$max[index])
  PRCP_MAX[i] = PRCP_MAX_VALUE
  PRCP_IND = which(PRCP$max[index] == PRCP_MAX_VALUE)
  PRCP_MAX_years[[i]] = PRCP_IND + 1876
}

names(TMAX_MAX_years) = c("1","2","3","4","5","6","7","8","9","10","11","12")
names(TMIN_MIN_years) = c("1","2","3","4","5","6","7","8","9","10","11","12")
names(PRCP_MAX_years) = c("1","2","3","4","5","6","7","8","9","10","11","12")


write.table(TMAX_MAX_years, "TMAX_MAX_stat_years.txt")
write.table(TMAX_MAX, "TMAX_MAX_stat_values.txt")

write.table(TMIN_MIN_years, "TMIN_MIN_stat_years.txt")
write.table(TMIN_MIN, "TMIN_MIN_stat_values.txt")

rite.table(PRCP_MAX_years, "PRCP_MAX_stat_years.txt")
write.table(PRCP_MAX, "PRCP_MAX_stat_values.txt")

