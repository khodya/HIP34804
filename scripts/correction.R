star_path <- "../20100101/star"
ms_file <- "missed_stars"
m <- read.table("parameters")

# calculating target star
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

# calculating reference stars
stars <- read.table("stars")
num_stars <- nrow(stars)
calc_stars <- c()
for (i in 1:num_stars) {
    a1 <- m[1,1] * stars[i,1] +
    	  m[2,1] * stars[i,2] + m[3,1]
    a2 <- m[4,1] * stars[i,1] +
    	  m[5,1] * stars[i,2] + m[6,1]
    a3 <- sqrt(
    	  (m[1,2] * stars[i,3])^2 +
	  (m[2,2] * stars[i,4])^2 +
	  m[3,2]^2
	  )
    a4 <- sqrt(
    	  (m[4,2] * stars[i,3])^2 +
	  (m[5,2] * stars[i,4])^2 +
	  m[6,2]^2
	  )
    calc_stars <- rbind(calc_stars, c(a1,a2,a3,a4))
}

# misclosure O-C
obs_stars_src <- readLines(paste0(star_path,"s"))

if (file.exists(ms_file))
	missed_stars <- read.table(ms_file)
index <- setdiff(c(1:length(obs_stars_src)), missed_stars)

obs_stars <- read.table(textConnection(obs_stars_src[index]))
miscl <- obs_stars[,1:2]-calc_stars[,1:2]

write.table(c(x,y,err_x,err_y), file="star", row.names=FALSE, col.names=FALSE)
write.table(format(miscl, digits=1, nsmall=4), file="misclosures", row.names=FALSE, col.names=FALSE, quote=FALSE)