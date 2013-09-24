#!/usr/bin/Rscript

base_night <- "20100101"
nights <- dir("src")
nights <- setdiff(nights, base_night)

for (i in nights) {
	setwd(paste0("src/",i))
	source("../../scripts/mean.R")
	source("../../scripts/ols.R")
	source("../../scripts/correction.R")
	setwd("../..")
}