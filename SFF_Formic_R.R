## SFF formic acid only_ single file

setwd("~/Desktop/Mouser degradation expt")

expt1=read.csv("sff_formic.csv")
head(expt1)

#selecting only data below m/z 700, O/C is less than 1, DBE is greater than 0)
## make sure .csv file is saved without #DIV/0! in O.C column, otherwise will return error.

expt1=subset(expt1, ExpMass<700)
expt1= subset (expt1, ExpMass>150)
expt1= subset(expt1, O.C<=1)
expt1=subset(expt1, DBE>=0)
tail(expt1)

write.table(expt1, "~/Desktop/Mouser degradation expt/SFF_formic.txt", sep="\t", row.names=FALSE)

AvgMolWt= weighted.mean(expt1$ExpMass, expt1$Intensity)
head(AvgMolWt)

##subset to reduce improper formula assignments

CHOClN<- expt1[expt1$S %in% c(0), ]
CHOCl<- CHOClN[CHOClN$N %in% c(0), ]
CHOCl2<-CHOCl[CHOCl$Cl %in% c(2),]
CHONS <- expt1[expt1$Cl %in% c(0), ]
CHOS<- CHONS[CHONS$N %in% c(0), ]
CHON<- CHONS[CHONS$S %in% c(0), ]
CHO<- CHOS[CHOS$S %in% c(0), ]
head(CHOS)

