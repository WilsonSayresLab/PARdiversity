par(mfrow = c(4, 1))
par(cex = 0.6)
par(mar = c(2, 2, 1.5, 1.5), oma = c(4, 4, 0.5, 0.5))
par(tcl = -0.25)
par(mgp = c(2, 0.6, 0))
for (i in 1:4) {
  plot(1, axes = FALSE, type = "n")

  
    filtered_pi.All26.100kb_filtered.o.PAR1 <- read.delim("~/Projects/PAR/BrotmanCotter/PAR_Project/Codes_02/08_galaxy_data_for_graphs/filtered_pi.All26.100kb_filtered.o.PAR1.txt", header=FALSE)
  
    data1 <- (filtered_pi.All26.100kb_filtered.o.PAR1)
    Position = ((data1$V1 + data1$V2)/2)*0.000001
    Diversity = (data1$V3)
  
      plot (Position, Diversity, pch = 20,
        
        col=sapply(Position, function(x){
          
          if(x<=2.699){"red"}else if(x >= 88.193855 & x <= 93.193855){"blue"}else if(x>=154.940559){"red"}else{"black"}}))
     
  mtext("A", side = 3, line = 0.1, adj = -0.07, cex = 0.9,
        col = "black")
  
    filtered_100kb_All26.o.panTro4_PAR1 <- read.delim("~/Projects/PAR/BrotmanCotter/PAR_Project/Codes_02/08_galaxy_data_for_graphs/All26.100kb_filtered.o.panTro4_PAR1.txt", header=FALSE)
  
    data2 <- (filtered_100kb_All26.o.panTro4_PAR1)
    Position = ((data2$V1 + data2$V2)/2)*0.000001
    Diversity = (data2$V3)
      
      plot (Position, Diversity, pch = 20,
        
        col=sapply(Position, function(x){
          
          if(x<=2.699){"red"}else if(x >= 88.193855 & x <= 93.193855){"blue"}else if(x>=154.940559){"red"}else{"black"}}))
  
  mtext("B", side = 3, line = 0.1, adj = -0.07, cex = 0.9,
        col = "black")
  
    filtered_100kb_All26.o.RheMac3_PAR1 <- read.delim("~/Projects/PAR/BrotmanCotter/PAR_Project/Codes_02/08_galaxy_data_for_graphs/All26.100kb_filtered.o.RheMac3_PAR1.txt", header=FALSE)
  
    data3 <- (filtered_100kb_All26.o.RheMac3_PAR1)
    Position = ((data3$V1 + data3$V2)/2)*0.000001
    Diversity = (data3$V3)

      plot (Position, Diversity, xlab = "Chromosome X Position (Mb)", ylab = "Diversity (pi)", pch = 20,
        
        col=sapply(Position, function(x){
          
          if(x<=2.699){"red"}else if(x >= 88.193855 & x <= 93.193855){"blue"}else if(x>=154.940559){"red"}else{"black"}}))

  
  mtext("C", side = 3, line = 0.1, adj = -0.07, cex = 0.9,
          col = "black")
  
  filtered_100kb_All26.o.canFam3_PAR1 <- read.delim("~/Projects/PAR/BrotmanCotter/PAR_Project/Codes_02/08_galaxy_data_for_graphs/All26.100kb_filtered.o.canFam3_PAR1.txt", header=FALSE)
  
  data3 <- (filtered_100kb_All26.o.canFam3_PAR1)
  Position = ((data3$V1 + data3$V2)/2)*0.000001
  Diversity = (data3$V3)
  
  plot (Position, Diversity, xlab = "Chromosome X Position (Mb)", ylab = "Diversity (pi)", pch = 20,
        
        col=sapply(Position, function(x){
          
          if(x<=2.699){"red"}else if(x >= 88.193855 & x <= 93.193855){"blue"}else if(x>=154.940559){"red"}else{"black"}}))
  
  
  mtext("D", side = 3, line = 0.1, adj = -0.07, cex = 0.9,
        col = "black")
  
  
  box(col = "black")
  }
mtext("Chromosome X Position (Mb)", side = 1, outer = TRUE, cex = 0.9, line = 2.2,
        col = "black")
mtext("Diversity (pi)", side = 2, outer = TRUE, cex = 0.9, line = 2.2,
        col = "black")