setwd("D:/METOPEL UAS/CACA METOPEL")
library(readxl)
library(tidyverse)
library(kableExtra)
read_excel("minyak.xlsx")
dat <- read_excel("minyak.xlsx")
kbl(dat) %>%
  kable_styling(bootstrap_options = c("striped", "hover", "condensed", "responsive"))

# regresi
reg1<-lm(minyak~bio+motor,data=dat)
summary(reg1)

# Plot 
plot(dat$tahun,dat$minyak,xlab="Ekspor Minyak Mentah Dunia",ylab="Ekspor Minyak Sawit")
plot(dat$tahun,dat$bio,xlab="Ekspor Bio Diesel Dunia",ylab="Ekspor Minyak Sawit")
plot(dat$tahun,dat$motor,xlab="Ekspor Motor (Penggerak) Listrik Dunia",ylab="Ekspor Minyak Sawit")

# Plot Error
dat$m<-resid(reg1)
plot(dat$minyak,dat$m,xlab="Ekspor Minyak Mentah/Bumi",ylab="error")
abline(h=0) # membuat garis horizontal di y=0

dat$m<-resid(reg1)
plot(dat$bio,dat$m,xlab="Ekspor Bio Diesel",ylab="error")
abline(h=0) # membuat garis horizontal di y=0

dat$m<-resid(reg1)
plot(dat$motor,dat$m,xlab="Ekspor Motor/Penggerak Elektrik",ylab="error")
abline(h=0) # membuat garis horizontal di y=0
