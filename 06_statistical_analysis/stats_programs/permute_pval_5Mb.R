data <- read.delim("pathTO/file.txt", header=FALSE)

permute_data <- data.frame(Instance = (1:10001))
newvector <- c("Cor", "RSqr", "PValue", "Sign")
permute_data[,newvector] <- NA

for(i in 1:10001){
  temp.pi <- as.list(t(data[i,]))
  tempdata.with.na <- data.frame(window = (1:50))
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

cor

original <- permute_data[1,]
reps <- permute_data[2:100001,]
count <- 0
sigs <- 0
negsigs <- 0
pozsigs <- 0

original$PValue

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

plot(testdata)
fit <- lm(testdata$Pi ~ testdata$window)
abline(fit)

summary(fit)

hist(reps$Cor, main = 'Correlation Coefficients for Each 5 Mb Regression', xlab = 'Correlation Coefficient', breaks = 50, xlim = c(-1,1))
abline(v = original$Cor, lwd = 2, col = 'red')
text(-0.48, 350, labels ="Correlation Coefficient of \n Original PAB*", col ='Red')
