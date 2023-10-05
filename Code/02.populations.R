# uinstall.pcakages("spatstat")
library(spatstat)
library(terra)

bei 
plot(bei) 
plot(bei, pch=19, cex=.5) 

bei.extra
plot(bei.extra)
plot(bei.extra[[1]])

plot(bei.extra[[1]])
plot(bei, pch=19, cex=.5, add=T) 

density_map <- density(bei)

par(mfrow=c(2,1))
plot(bei.extra[[1]])
plot(density_map)

bei.rast <- rast(bei.extra[[1]])
density.rast <- rast(density_map)

randompoints <- spatSample(bei.rast, 100, "random", as.points = TRUE)
par(mfrow=c(2,1))
plot(bei.rast)
points(randompoints)
plot(density.rast)
points(randompoints)

# bei.rast and density.rast do not have the same extent and do not have the same
# number of rows/columns, so I can't stack them

bei.points <- terra::extract(bei.rast, randompoints)
density.points <- terra::extract(density.rast, randompoints)

pointmaps <- data.frame(bei.points[1:2], density.points[2])
