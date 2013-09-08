library("plotrix")

star_path <- "../20100101/star"
m <- read.table("parameters")

star <- read.table(star_path)
starc <- read.table("star")

x <- c(star[1,1], starc[1,1])
y <- c(star[1,2], starc[1,2])
err_x <- c(star[1,3], starc[1,3])
err_y <- c(star[1,4], starc[1,4])

par(mar=c(7,7,2,2))

plotCI(x,y,err_y,
	xlim=c(0,3056),
	ylim=c(0,3056),
	xlab="pixels",
	ylab="pixels",
  	main="HIP34804\nobs. 20100101, 20110214",
  	sub="measured coordinates",
  	err="y",
  	asp=1,
  	las=1)
 plotCI(x,y,err_x,err="x",add=TRUE)