#!/usr/bin/Rscript

max_num_ref_stars <- 15
ms_file <- "missed_stars"
base_plate_path <- "../20100101/stars"

plate <- read.table("stars")
num_stars <- nrow(plate)

missed_stars <- NULL
if (file.exists(ms_file))
	missed_stars <- read.table(ms_file) 
index <- setdiff(c(1:max_num_ref_stars),missed_stars)
	
base_src <- readLines(base_plate_path)
base_plate <-read.table(textConnection(base_src[index]))

mf_ksi <- lm(base_plate[,1] ~ plate[,1] + plate[,2],weights=1/plate[,3])

mf_eta <- lm(base_plate[,2] ~ plate[,1] + plate[,2],weights=1/plate[,4])

res <- cbind(
	c(
		as.numeric(coef(mf_ksi))[c(2,3,1)],
		as.numeric(coef(mf_eta))[c(2,3,1)]
	),
	c(
		as.numeric(coef(summary(mf_ksi))[,2][c(2,3,1)]),
		as.numeric(coef(summary(mf_eta))[,2][c(2,3,1)])
	)
)

res_r <- cbind(
	as.numeric(resid(mf_ksi)),
	as.numeric(resid(mf_eta))
)

write.table(res, file="parameters", row.names=FALSE, col.names=FALSE)

write.table(res_r, file="residuals", row.names=F, col.names=F)