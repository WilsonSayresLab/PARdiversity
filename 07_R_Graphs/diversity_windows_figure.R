par(mfrow = c(4, 1))
par(cex = 0.6)
par(mar = c(1.5, 1.5, 1.2, 1.2), oma = c(4, 4, 0.5, 0.5))
par(tcl = -0.25)
par(mgp = c(2, 0.6, 0))
for (i in 1:4) {
  plot(1, axes = FALSE, type = "n")
  
  filtered_pi.All26.100kb_filtered.no <- read.delim("~/Projects/PAR/BrotmanCotter/PAR_Project/Codes_02/05_pi/03_pi/filtered_pi/nonoverlapping/100kb_filtered/filtered_pi.All26.100kb_filtered.no.txt", header=FALSE)
  data1 <- (filtered_pi.All26.100kb_filtered.no)
  Position = ((data1$V1 + data1$V2)/2)*0.000001
  Diversity = (data1$V3)
  plot (Position, Diversity, pch = 20, 
        col=sapply(Position, function(x){
          if(x<=2.699){"red"}else if(x >= 88.193855 & x <= 93.193855){"blue"}else if(x>=154.940559){"red"}else{"black"}}))
  
  text(001,0.0027, labels="PAR1")
  text(91,0.0018, labels="XTR")
  text(155,0.0018, labels="PAR2")
 
  mtext("A", side = 3, line = 0.1, adj = -0.07, cex = 0.9,
        col = "black")
  
  
  filtered_pi.All26.100kb_filtered.o <- read.delim("~/Projects/PAR/BrotmanCotter/PAR_Project/Codes_02/05_pi/03_pi/filtered_pi/overlapping/100kb_filtered/filtered_pi.All26.100kb_filtered.o.txt", header=FALSE)
  data1 <- (filtered_pi.All26.100kb_filtered.o)
  Position = ((data1$V1 + data1$V2)/2)*0.000001
  Diversity = (data1$V3)
  plot (Position, Diversity, pch = 20, 
        col=sapply(Position, function(x){
          if(x<=2.699){"red"}else if(x >= 88.193855 & x <= 93.193855){"blue"}else if(x>=154.940559){"red"}else{"black"}}))
  
  text(001,0.0027, labels="PAR1")
  text(91,0.0018, labels="XTR")
  text(155,0.0018, labels="PAR2")
  
  mtext("B", side = 3, line = 0.1, adj = -0.07, cex = 0.9,
        col = "black")
  
  
  filtered_pi.All26.1Mb_filtered.no <- read.delim("~/Projects/PAR/BrotmanCotter/PAR_Project/Codes_02/05_pi/03_pi/filtered_pi/nonoverlapping/1Mb_filtered/filtered_pi.All26.1Mb_filtered.no.txt", header=FALSE)
  data1 <- (filtered_pi.All26.1Mb_filtered.no)
  Position = ((data1$V1 + data1$V2)/2)*0.000001
  Diversity = (data1$V3)
  plot (Position, Diversity, pch = 20, 
        col=sapply(Position, function(x){
          if(x<=2.699){"red"}else if(x >= 88.193855 & x <= 93.193855){"blue"}else if(x>=154.940559){"red"}else{"black"}}))
  
  text(001,0.0015, labels="PAR1")
  text(91,0.0012, labels="XTR")
  text(155,0.0012, labels="PAR2")
  
  mtext("C", side = 3, line = 0.1, adj = -0.07, cex = 0.9,
        col = "black")
  
  
  filtered_pi.All26.1Mb_filtered.o <- read.delim("~/Projects/PAR/BrotmanCotter/PAR_Project/Codes_02/05_pi/03_pi/filtered_pi/overlapping/1Mb_filtered/filtered_pi.All26.1Mb_filtered.o.txt", header=FALSE)
  data1 <- (filtered_pi.All26.1Mb_filtered.o)
  Position = ((data1$V1 + data1$V2)/2)*0.000001
  Diversity = (data1$V3)
  plot (Position, Diversity, pch = 20, 
        col=sapply(Position, function(x){
          if(x<=2.699){"red"}else if(x >= 88.193855 & x <= 93.193855){"blue"}else if(x>=154.940559){"red"}else{"black"}}))
  
  text(001,0.0015, labels="PAR1")
  text(91,0.0012, labels="XTR")
  text(155,0.0012, labels="PAR2")
  
  mtext("D", side = 3, line = 0.1, adj = -0.07, cex = 0.9,
        col = "black")
  
  
  box(col = "black")
}
mtext("Chromosome X Position (Mb)", side = 1, outer = TRUE, cex = 0.9, line = 2.2,
      col = "black")
mtext("Diversity (pi)", side = 2, outer = TRUE, cex = 0.9, line = 2.2,
      col = "black")