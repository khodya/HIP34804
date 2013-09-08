library("corpcor")

base_plate_path <- "../20100101/stars"
num_stars <- 15

base_plate <- read.table(base_plate_path)
plate <- read.table("stars")

m <- cbind(
 plate[,1],
 plate[,2],
 rep(1,num_stars)
)

abc <- pseudoinverse(m) %*% base_plate[,1]
def <- pseudoinverse(m) %*% base_plate[,2]
 
res <- cbind(
	rbind(abc, def),
	c(1,0,0,0,1,0) - rbind(abc, def)
	#c(1,0,mean(base_plate[,1]-plate[,1]),0,1,mean(base_plate[,2]-plate[,2])) - rbind(abc, def)
)

write.table(res, file="parameters", row.names=FALSE, col.names=FALSE)