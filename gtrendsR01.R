install.packages("gtrendsR")
library(gtrendsR)
BidenTrumpElection = gtrends(c("Trump","Biden","election"), time = "all")
par(family="Georgia")
plot(BidenTrumpElection)
tg = gtrends("transgender", time = "all")

# Example: Transgender, Feminism and Women's rights
# 
plot(gtrends(c("transgender"), time = "all"))
data("countries")
plot(gtrends(c("transgender"), geo = "GB", time = "all")) 
plot(gtrends(c("transgender"), geo = c("US","GB","TW"), time = "all")) 
tg_iot = tg$interest_over_time
tw = gtrends(c("transgender","women right"), time = "all")
tw1 = data.frame(tw$interest_over_time)
plot(gtrends(c("transgender","women right","feminism"), time = "all"))
data("categories")
