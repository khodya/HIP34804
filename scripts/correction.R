
star_path <- "../20100101/star"
m <- read.table("parameters")

star <- read.table(star_path)

x 	<- 	m[1,1] * star[1,1] + 
		m[2,1] * star[1,2] + m[3,1]
y 	<- 	m[4,1] * star[1,1] + 
		m[5,1] * star[1,2] + m[6,1]


err_x <-sqrt(
	m[1,2]^2 * star[1,3]^2 +
	m[2,2]^2 * star[1,4]^2 +
	m[3,2]^2
)

err_y <- sqrt(
	m[4,2]^2 * star[1,3]^2 +
	m[5,2]^2 * star[1,4]^2 +
	m[6,2]^2
)

star_corrected <- cbind(
	x, y, err_x, err_y
)

write.table(star_corrected, file="star", row.names=FALSE, col.names=FALSE)