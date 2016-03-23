data <- read.delim("pathTo/10k_permutations_NAremoved.txt", header=FALSE)

permute_data <- data.frame(Instance = (1:10001))
newvector <- c("Cor", "RSqr", "PValue", "Sign")
permute_data[,newvector] <- NA

for(i in 1:10001){
  temp.pi <- as.list(t(data[i,]))
  tempdata.with.na <- data.frame(window = (1:30))
  tempdata.with.na$Pi <- unlist(temp.pi)
  tempdata <- na.omit(tempdata.with.na)
  permute_data[i,"Cor"] <- cor(tempdata$window, tempdata$Pi)
  fit <- lm(tempdata$Pi ~ tempdata$window)
  info <- summary(fit)
  permute_data[i, "RSqr"] <- info$r.squared
  permute_data[i, "PValue"] <- info$coefficients[[8]]
  if (permute_data[i,"Cor"] > 0) {
    permute_data[i, "Sign"] <- '+'
  } else {
    permute_data[i, "Sign"] <- '-'
  }
}

original <- permute_data[1,]
reps <- permute_data[2:100001,]
count <- 0
sigs <- 0
negsigs <- 0
pozsigs <- 0

reps[1,]$PValue

for(i in 1:10000){
  if (reps[i,]$PValue < original$PValue){
    count <- count+1
    print(i)
  }
  if (reps[i,]$PValue < 0.05){
    sigs <- sigs + 1
    if (reps[i,]$Sign == '-') {
      negsigs <- negsigs + 1
    } else if (reps[i,]$Sign == '+'){
      pozsigs <- pozsigs + 1
    }
  
  }
}

significance <- count/10000

#test.pi <- as.list(t(data[1157,]))
#testdata.with.na <- data.frame(window = (1:30))
#testdata.with.na$Pi <- unlist(test.pi)
#testdata <- na.omit(testdata.with.na)

plot(testdata)
fit <- lm(testdata$Pi ~ testdata$window)
abline(fit)

summary(fit)

hist(reps$PValue, breaks = 150, prob = TRUE)
abline(v = 0.05, lty = 'dashed', lwd = 2, col = 'blue')
abline(v = original$PValue, lwd = 2, col = 'red')

hist(reps$Cor, main = 'Correlation Coefficients for Each 3 Mb Regression', xlab = 'Correlation Coefficient', breaks = 50, xlim = c(-0.7,0.7))
abline(v = original$Cor, lwd = 2, col = 'red')
text(-0.445, 350, labels ="Correlation Coefficient of \n Original PAB \n Regression", col ='Red')
