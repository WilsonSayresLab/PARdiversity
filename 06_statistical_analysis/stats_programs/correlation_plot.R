#nonoverlapping data
filtered_pi.All26.100kb_filtered.no <- read.delim("pathTO/filtered_pi.All26.100kb_filtered.no_NAremoved.txt", header=FALSE)
rawdata <- filtered_pi.All26.100kb_filtered.no

#overlapping data
filtered_pi.All26.100kb_filtered.o <- read.delim("pathTo/filtered_pi.All26.100kb_filtered.o.txt", header=FALSE)
rawdata <- filtered_pi.All26.100kb_filtered.o

data <- data.frame(Sort = (1:(nrow(rawdata))), Start=rawdata$V1, End=rawdata$V2, Pi=rawdata$V3)
newvector <- c("Cor", "RSqr", "PValue", "Color")
data[,newvector] <- NA
length <- length(data$Sort)

data$Pi[is.na(data$Pi)] <- 0

for(i in 1:(length - 29)){
  temp.data <- subset(data, i <= Sort & Sort <=29+i)
  data[i, "Cor"] <- cor(temp.data$Sort, temp.data$Pi)
  fit <- lm(temp.data$Pi ~ temp.data$Sort)
  info <- summary(fit)
  data[i, "RSqr"] <- info$r.squared
  data[i, "PValue"] <- info$coefficients[[8]]
}

plotdata <- subset(data, Sort <= 65)
Position <- ((plotdata$Start + plotdata$End)/2)*0.000001
Diversity <- plotdata$Pi
fit <- lm(Diversity ~ Position)



plotdata$Color <- sapply(plotdata$PValue, function(x){if(is.na(x)){"black"}else if(x <= 0.05){"red"}else{"black"}})


##Change for numbers you are working with. Add x+i for the less then part.
plotdata$Color <- sapply(plotdata$Sort, function(x){if(x <= 55){"red"}else{"black"}})

##colors = sapply(data$PValue, function(x){if(is.na(x)){"black"}else if(x <= 0.05){"red"}else{"black"}})

Position <- ((plotdata$Start + plotdata$End)/2)*0.000001
Diversity <- plotdata$Pi

plot(Position, Diversity, frame.plot=TRUE, 
     xlab="Position (Mb)", ylab="Diversity (pi)", pch = 20,
     col = plotdata$Color)

abline(v = 2.699, lty = "dashed")
text(1, 0.0026, labels="PAR", font = 2)
text(5.5, 0.0026, labels= "nonPAR", font=2)
text(3.4, 0.00195, labels ="Pseudoautosomal\n Boundary")
abline(fit)

fit.info <- summary(fit)
print(fit.info$coefficients[[8]])
print(fit.info$r.squared)






