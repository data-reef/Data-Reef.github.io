library("png")
require(biOps)
library(gtools)
# read a sample file (R logo)
mydata = read.csv("sg.csv")

img <- readPNG(tiffFiles[1], TRUE) # here import a different image 
img.n <- readPNG(system.file("img", mydata[1,5], package="png"), TRUE)


tiffFiles <- list.files("pics", pattern="*png$", full.name=TRUE)
tiffList <- lapply(tiffFiles, readPNG)


# img2 <- readPNG(system.file("img", "Rlogo.png", package="png"))
img2 <- readPNG(tiffFiles[2], TRUE) # here import a different image 
dim <- 15

pngFiles <- mixedsort(list.files("pics", pattern="*png$", full.name=TRUE))
mixedsort(pngFiles)
if (exists("rasterImage")) { 
  plot(mydata[,4],mydata[,3], type='p')
  rasterImage(readPNG(pngFiles[1], TRUE), mydata[1,3], mydata[1,4]-dim, mydata[1,3]+dim, mydata[1,4]+dim)
  rasterImage(readPNG(pngFiles[2], TRUE), mydata[2,3]-dim, mydata[2,4]-dim, mydata[2,3]+dim, mydata[2,4]+dim)
}



dimX <- 5/1.5
dimy <- 10/1.5
pngFiles <- mixedsort(list.files("pics", pattern="*png$", full.name=TRUE))
mixedsort(pngFiles)
if (exists("rasterImage")) { 
  plot(mydata[,4],mydata[,3], type='p',xlim = rev(range(mydata[,4])))
  for(i in 1:32){
    rasterImage(readPNG(pngFiles[i], TRUE), mydata[i,4]-dimX, mydata[i,3]-dimy, mydata[i,4]+dimX, mydata[i,3]+dimy)
  }
}

points(mydata[,4],mydata[,3], col = "red", cex = .6)


img = readPNG('1.png', native=TRUE)
plot(NA,xlim=c(0,nrow(img)),ylim=c(0,ncol(img)))
rasterImage(img,0,0,nrow(img),ncol(img))



plot(MDS, type = "n", asp = 1)
for(ii in 1:length(pngList)){  # Go through each flag
  tempName <- rownames(MDS)[ii]
  Coords <- MDS[tempName, 1:2]  # Get coordinates from MDS
  Dims <- flagDimensions[tempName, ]  # Get pixel dimensions
  rasterImage(pngList[[tempName]],  # Plot each flag with these boundaries:
              Coords[1]-Dims[2]/boxParameter, Coords[2]-Dims[1]/boxParameter,
              Coords[1]+Dims[2]/boxParameter, Coords[2]+Dims[1]/boxParameter)
}

