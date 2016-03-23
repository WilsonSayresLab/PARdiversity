PAR1 <- read.delim("~/Projects/PAR/BrotmanCotter/PAR_Project/Codes_04/07_R_Graphs/PAR1_100kb_no_boxplot.txt", header=FALSE)
PAR2 <- read.delim("~/Projects/PAR/BrotmanCotter/PAR_Project/Codes_04/07_R_Graphs/PAR2_100kb_no_boxplot.txt", header=FALSE)
nonPAR <- read.delim("~/Projects/PAR/BrotmanCotter/PAR_Project/Codes_04/07_R_Graphs/nonPAR_100kb_no_boxplot.txt", header=FALSE)
XTR <- read.delim("~/Projects/PAR/BrotmanCotter/PAR_Project/Codes_04/07_R_Graphs/XTR_100kb_no_boxplot.txt", header=FALSE)

#the input txt files are the 100kb nonoverlapping diversity files with the start and end columns deleted so there is only the pi column

w=c(nonPAR$V1)
x=c(PAR1$V1)
y=c(XTR$V1)
z=c(PAR2$V1)

#---------------------have to change values in this part of the progrm to get the line segments---------------------#
# par(xpd=TRUE)
# yrange<-par("usr")[3:4]
# ypos<-yrange[2]+diff(yrange)/40
# segments(2,ypos,3,ypos)
# text(2.5,ypos+diff(yrange)/40,"*",cex=2)
# par(xpd=FALSE)
#------------------------------------------------------------------------------------------------------------------#

par(bty="l")
boxplot(w, x, y, z,
        names=c ("nonPAR", "PAR1", "XTR", "PAR2"),
        xlab="X Chromosome Region", ylab="Diversity (pi)",
        col=c("white", "red", "blue", "red")
        )
