library("corpcor")

max_num_ref_stars <- 15
ms_file <- "missed_stars"
base_plate_path <- "../20100101/stars"

plate <- read.table("stars")
num_stars <- nrow(plate)

if (file.exists(ms_file))
	missed_stars <- read.table(ms_file) 
	
index <- setdiff(c(1:max_num_ref_stars),missed_stars)	
base_src <- readLines(base_plate_path)
base_plate <- read.table(textConnection(base_src[index]))

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