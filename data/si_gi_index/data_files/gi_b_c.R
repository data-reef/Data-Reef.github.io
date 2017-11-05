setwd("~/Desktop/data-reef.github.io/data/GIIndex")
library("png")
require(biOps)
library(gtools)
# read a sample file (R logo)
mydata = read.csv("sg.csv")

png('gi_nob.png',width = 1920, height = 1080,units = "px",pointsize = 12)
dimX <- 5/1
dimy <- 20/1
pngFiles <- mixedsort(list.files("pics", pattern="*png$", full.name=TRUE))
mixedsort(pngFiles)
if (exists("rasterImage")) { 
  mar.default <- c(5,4,4,2)
  par(mar = mar.default + c(0, 4, 0, 0),bg=NA)
  plot(mydata[,4],mydata[,3], type='n',xlim = rev(range(mydata[,4])),main="Satiety Index Vs. Glycemic Index",xlab="Glycemic Index", ylab="Satiety Index",font=2,font.lab=2,cex.lab=2,cex.axis=2,cex.main=3,panel.first=grid(lwd = 2))
 i = 4
  rasterImage(readPNG(pngFiles[i], TRUE), mydata[i,4]-dimX, mydata[i,3]-dimy, mydata[i,4]+dimX, mydata[i,3]+dimy)
  i=29
  #rasterImage(readPNG(pngFiles[i], TRUE), mydata[i,4]-dimX, mydata[i,3]-dimy, mydata[i,4]+dimX, mydata[i,3]+dimy)
  dev.off()
  
}

