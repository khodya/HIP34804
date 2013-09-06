coord <- read.table("coord.dat")

m <- cbind(
	coord[,10],
	coord[,11],
	coord[,12],
	coord[,13]
)

write(colMeans(m), file="star")