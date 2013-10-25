#!/usr/bin/Rscript

# home dir: src/<night>

star_path <- "star"
ms_file <- "missed_stars"
m <- read.table("parameters")

# target star in standard coordinates
star <- read.table(star_path)
x 	<- 	m[1,1] * star[1,1] + 
		m[2,1] * star[1,2] + m[3,1]
y 	<- 	m[4,1] * star[1,1] + 
		m[5,1] * star[1,2] + m[6,1]
		
err_x <- star[1,3]
#err_x <-sqrt(
	#m[1,2]^2 * star[1,3]^2 +
	#m[2,2]^2 * star[1,4]^2 +
	#m[3,2]^2
#)

err_y <- star[1,4]
#err_y <- sqrt(
	#m[4,2]^2 * star[1,3]^2 +
	#m[5,2]^2 * star[1,4]^2 +
	#m[6,2]^2
#)

write.table(c(x,y,err_x,err_y), file="standart", row.names=FALSE, col.names=FALSE)
