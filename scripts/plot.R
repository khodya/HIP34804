library("plotrix")

star_path <- "../20100101/star"
m <- read.table("parameters")

star <- read.table(star_path)
starc <- read.table("star")

x <- c(star[1,1], starc[1,1])
y <- c(star[1,2], starc[1,2])
err_x <- c(star[1,3], starc[1,3])
err_y <- c(star[1,4], starc[1,4])

par(mar=c(6,6,2,2))

plotCI(x,y,err_y,pt.bg=par("bg"),pch=21,
	xlim=c(0,2500),
	ylim=c(0,2500),
  	main="plotCI with extra space on the x axis")
 plotCI(x,y,err_x,pt.bg=par("bg"),pch=21,err="x",add=TRUE)