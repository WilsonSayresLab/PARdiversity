par(mfrow = c(4, 1))
par(cex = 0.6)
par(mar = c(1.5, 1.5, 1.2, 1.2), oma = c(4, 4, 0.5, 0.5))
par(tcl = -0.25)
par(mgp = c(2, 0.6, 0))
for (i in 1:4) {
  plot(1, axes = FALSE, type = "n")
  
  filtered_subs_rates_100kb_filtered_o_panTro4 <- read.delim("~/Projects/PAR/BrotmanCotter/PAR_Project/Codes_04/02_galaxy_chrX_data/filtered_subs_rates_100kb_filtered_o_panTro4.txt", header=FALSE)
  
  data <- filtered_subs_rates_100kb_filtered_o_panTro4
  Position = ((data$V2 + data$V3)/2)*0.000001
  Divergence = (data$V6)
  
  plot (Position, Divergence, xlab = "Chromosome X Position (Mb)", ylab = "Divergence", pch = 20, 
        
        col=sapply(Position, function(x){
          
          if(x<=2.699){"red"}else if(x >= 88.193855 & x <= 93.193855){"blue"}else if(x>=154.940559){"red"}else{"black"}}))
  
  
  text(-1.4,0.07, labels="PAR1")
  text(90,0.025, labels="XTR")
  text(157.2,0.025, labels="PAR2")
  
  mtext("A", side = 3, line = 0.1, adj = -0.046, cex = 0.9,
        col = "black")
  
  
  filtered_subs_rates_100kb_filtered_o_RheMac3 <- read.delim("~/Projects/PAR/BrotmanCotter/PAR_Project/Codes_04/02_galaxy_chrX_data/filtered_subs_rates_100kb_filtered_o_RheMac3.txt", header=FALSE)
  
  data <- filtered_subs_rates_100kb_filtered_o_RheMac3
  Position = ((data$V2 + data$V3)/2)*0.000001
  Divergence = (data$V6)
  
  plot (Position, Divergence, xlab = "Chromosome X Position (Mb)", ylab = "Divergence", pch = 20, 
        
        col=sapply(Position, function(x){
          
          if(x<=2.699){"red"}else if(x >= 88.193855 & x <= 93.193855){"blue"}else if(x>=154.940559){"red"}else{"black"}}))
  
  
  text(0.8,0.15, labels="PAR1")
  text(90,0.10, labels="XTR")
  text(155,0.10, labels="PAR2")
  
  mtext("B", side = 3, line = 0.1, adj = -0.045, cex = 0.9,
        col = "black")
  
  filtered_subs_rates_100kb_filtered_o_canFam3 <- read.delim("~/Projects/PAR/BrotmanCotter/PAR_Project/Codes_04/02_galaxy_chrX_data/filtered_subs_rates_100kb_filtered_o_canFam3.txt", header=FALSE)
  
  data <- filtered_subs_rates_100kb_filtered_o_canFam3
  Position = ((data$V2 + data$V3)/2)*0.000001
  Divergence = (data$V6)
  
  plot (Position, Divergence, xlab = "Chromosome X Position (Mb)", ylab = "Divergence", pch = 20, 
        
        col=sapply(Position, function(x){
          
          if(x<=2.699){"red"}else if(x >= 88.193855 & x <= 93.193855){"blue"}else if(x>=154.940559){"red"}else{"black"}}))
  
  
  text(0.8,0.41, labels="PAR1")
  text(90,0.35, labels="XTR")
  text(155,0.4, labels="PAR2")

  
  mtext("C", side = 3, line = 0.1, adj = -0.045, cex = 0.9,
        col = "black")
  
  filtered_subs_rates_100kb_filtered_o_mm10 <- read.delim("~/Projects/PAR/BrotmanCotter/PAR_Project/Codes_04/02_galaxy_chrX_data/filtered_subs_rates_100kb_filtered_o_mm10.txt", header=FALSE)
  
  data <- filtered_subs_rates_100kb_filtered_o_mm10
  Position = ((data$V2 + data$V3)/2)*0.000001
  Divergence = (data$V6)
  
  plot (Position, Divergence, xlab = "Chromosome X Position (Mb)", ylab = "Divergence", pch = 20, 
        
        col=sapply(Position, function(x){
          
          if(x<=2.699){"red"}else if(x >= 88.193855 & x <= 93.193855){"blue"}else if(x>=154.940559){"red"}else{"black"}}))
  
  
  text(0.8,0.5, labels="PAR1")
  text(90,0.41, labels="XTR")
  text(155,0.5, labels="PAR2")
  
  
  mtext("D", side = 3, line = 0.1, adj = -0.045, cex = 0.9,
        col = "black")
  
  box(col = "black")
}
mtext("Chromosome X Position (Mb)", side = 1, outer = TRUE, cex = 0.9, line = 2.2,
      col = "black")
mtext("Divergence", side = 2, outer = TRUE, cex = 0.9, line = 2.2,
      col = "black")