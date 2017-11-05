#Air Polution during July 4th. PM2.5 hourly data.
#Data Reef
library(ggplot2)
library(gridExtra)
library(ggthemes)
library(readr)

#Import the data downloaded from https://aqsdr1.epa.gov/aqsweb/aqstmp/airdata/download_files.html
hourly_88101_2016 <- read_csv("hourly_88101_2016.csv")

#Extract only certain dates data
sub3 = subset(hourly_88101_2016,hourly_88101_2016$`Date Local` == "2016-07-03" )
sub4 = subset(hourly_88101_2016,hourly_88101_2016$`Date Local` == "2016-07-04" )
sub5 = subset(hourly_88101_2016,hourly_88101_2016$`Date Local` == "2016-07-05" )

#Plot each day's graph
sub3g = ggplot(aes(x = sub3$`Time Local`, y = sub3$`Sample Measurement`,color=sub3$`Sample Measurement`), data = sub3) + geom_point(aes(colour = cut(sub3$`Sample Measurement`, c(-Inf, 35, Inf))),shape=18,size=3)+ coord_cartesian(ylim = c(0, 800)) +  geom_hline(yintercept = 35) + annotate("text", 35, 60, label = "Standard") + scale_color_manual(name = "mu", values = c("(-Inf,35]" = "blue","(35, Inf]" = "red"),guide = FALSE)+theme_solarized()+ggtitle("Sunday, July 3,2016")+labs(x="Time",y=expression(PM[2.5]~(μg/m^{3})))+theme(plot.title = element_text(size=16,hjust = 0.5,face="bold"),axis.text=element_text(size=15),axis.title=element_text(size=12,face="bold"))

sub4g = ggplot(aes(x = sub4$`Time Local`, y = sub4$`Sample Measurement`,color=sub4$`Sample Measurement`), data = sub4) + geom_point(aes(colour = cut(sub4$`Sample Measurement`, c(-Inf, 35, Inf))),shape=18,size=3)+ coord_cartesian(ylim = c(0, 800)) +  geom_hline(yintercept = 35) + annotate("text", 35, 60, label = "Standard") + scale_color_manual(name = "mu", values = c("(-Inf,35]" = "blue","(35, Inf]" = "red"),guide = FALSE)+theme_solarized()+ggtitle("Monday, July 4,2016")+labs(x="Time",y=expression(PM[2.5]~(μg/m^{3})))+theme(plot.title = element_text(size=16,hjust = 0.5,face="bold"),axis.text=element_text(size=15),axis.title=element_text(size=12,face="bold"))

sub5g = ggplot(aes(x = sub5$`Time Local`, y = sub5$`Sample Measurement`,color=sub5$`Sample Measurement`), data = sub5) + geom_point(aes(colour = cut(sub5$`Sample Measurement`, c(-Inf, 35, Inf))),shape=18,size=3)+ coord_cartesian(ylim = c(0, 800)) +  geom_hline(yintercept = 35) + annotate("text", 35, 60, label = "Standard") + scale_color_manual(name = "mu", values = c("(-Inf,35]" = "blue","(35, Inf]" = "red"),guide = FALSE)+theme_solarized()+ggtitle("Tuesday, July 5,2016")+labs(x="Time",y=expression(PM[2.5]~(μg/m^{3})))+theme(plot.title = element_text(size=16,hjust = 0.5,face="bold"),axis.text=element_text(size=15),axis.title=element_text(size=12,face="bold"))

#Show all the graphs in one plot
grid.arrange(arrangeGrob(arrangeGrob(sub3g,sub4g,sub5g)))
