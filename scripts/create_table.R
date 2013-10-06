#!/usr/bin/Rscript

blocked <- NULL
base_path <- "20100101"
nights <- dir("src")
nights <- setdiff(nights, blocked)

base_plate <- read.table(paste0("src/",base_path,"/stars"))
num_stars <- nrow(base_plate)

sheet <- c()
miscl <- c()
for (i in nights) { 
	std_star <- read.table(paste0("src/",i,"/standart"))
	sheet <- rbind(sheet, t(std_star))
	
	misc_row <- rep(NA, num_stars)
	missed <- NULL
	if (file.exists(paste0("src/",i,"/missed_stars")))
		missed <- read.table(paste0("src/",i,"/missed_stars"))
	index <- setdiff(c(1:num_stars),missed)
	misc_data <- read.table(paste0("src/",i,"/misclosures"))
	misc_row[index] <- misc_data[,1]
	miscl <- rbind(miscl, misc_row)
	misc_row[index] <- misc_data[,2]
	miscl <- rbind(miscl, misc_row)
}

rownames(sheet) <- nights
colnames(sheet) <- c("x","y","err_x","err_y")

write.table(format(sheet, digits=1, nsmall=4, trim=TRUE, scientific=FALSE), file="reports/coordinates", col.names = FALSE, quote=FALSE)

rows_for_misc <- c()
for (i in nights)
	rows_for_misc <- cbind(rows_for_misc, c(i,i))
rownames(miscl) <- rows_for_misc
write.table(format(round(miscl, digits=4), scientific=FALSE), file="reports/residuals", quote=FALSE, col.names=FALSE, na="NA")