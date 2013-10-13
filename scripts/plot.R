library("plotrix")

star <- read.table("reports/coordinates")

x <- star[,2]
y <- star[,3]
err_x <- star[,4]
err_y <- star[,5]

par(mar=c(7,7,2,2))
par(pch=20)

plotCI(x,y,err_y,
	xlim=c(1739,1747),
	ylim=c(1386,1393),
	xlab="pixels",
	ylab="pixels",
  	main="HIP34804",
  	sub="measured coordinates",
  	err="y",
  	asp=1,
  	las=1)
plotCI(x,y,err_x,err="x",add=TRUE)