#!/usr/bin/Rscript

files <-c("g074a001.dat","g074a002.dat",
	"g074a003.dat", "g074a004.dat",
	"g074a005.dat", "g074a006.dat",
	"g074a007.dat", "g074a008.dat")

stars <- c("star_01", "star_02", "star_03", "star_04",
      	 "star_05", "star_06", "star_07", "star_08",
	 "star_09", "star_10", "star_11", "star_12",
	 "star_13", "star_14", "star_15")	     

num_plates <- length(files)

plate <- read.table(files[1])
num_stars <- nrow(plate)

for (j in 1:num_stars) {
    assign(stars[j], c())
    assign(stars[j], rbind(get(stars[j]), plate[j,10:13]))
}

for (i in 2:num_plates) {
    plate <- read.table(files[i])
    for (j in 1:num_stars) {
    	assign(stars[j], rbind(get(stars[j]), plate[j,10:13]))
    }
}

results <- c()
for (i in 1:num_stars)
    results <- rbind(results, colMeans(get(stars[i])))

write.table(results, file="stars", row.names=FALSE, col.names=FALSE)





