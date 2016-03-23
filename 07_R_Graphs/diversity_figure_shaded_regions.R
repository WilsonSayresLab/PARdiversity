par(mfrow = c(5, 1))
par(cex = 0.6)
par(mar = c(1.5, 1.5, 1.2, 1.2), oma = c(4, 4, 0.5, 0.5))
par(tcl = -0.25)
par(mgp = c(2, 0.6, 0))
for (i in 1:5) {
  plot(1, axes = FALSE, type = "n")
  
  
  
  filtered_pi.All26.100kb_filtered.o <- read.delim("~/Projects/PAR/BrotmanCotter/PAR_Project/Codes_02/05_pi/03_pi/filtered_pi/overlapping/100kb_filtered/filtered_pi.All26.100kb_filtered.o.txt", header=FALSE)
  data1 <- (filtered_pi.All26.100kb_filtered.o)
  Position = ((data1$V1 + data1$V2)/2)*0.000001
  Diversity = (data1$V3)
  plot (Position, Diversity, type = 'n') 
  
  color <- rgb(190, 190, 190, alpha=80, maxColorValue = 255)
  rect(xleft = c(48202745, 48976199, 51395467, 51775560, 52518132, 55464117, 62335733,70894117, 71941159, 100818723, 101435778, 103195105)/1000000, 
       xright = c(48292983, 49062381, 51492862, 51966529, 53027386, 55574172, 62495350, 71055682, 72325075, 100903977, 101774391, 103362341)/1000000, 
       ybottom = -0.001, ytop = 0.00301, col=color, density = 100)
  
  rect(xleft = c(10241177, 16946047, 19303480, 38344992, 45930478, 99459295, 128232540, 151519514)/1000000,
       xright = c(12619185, 18747389, 22198160, 41272675, 77954462, 111145964, 136796526, 155156362)/1000000,
       ybottom = -0.001, ytop = 0.00301, col=color, density = 100)
  
  points(Position, Diversity, pch = 20, 
         col=sapply(Position, function(x){
           if(x<=2.699){"red"}else if(x >= 88.193855 & x <= 93.193855){"blue"}else if(x>=154.940559){"red"}else{"black"}}))
  
  text(001,0.0027, labels="PAR1")
  text(93,0.0018, labels="XTR")
  text(155,0.0018, labels="PAR2")
 
  mtext("A", side = 3, line = 0.1, adj = -0.075, cex = 0.9,
        col = "black")
  
  
  filtered_100kb_All26.o.panTro4 <- read.delim("~/Projects/PAR/BrotmanCotter/PAR_Project/Codes_02/05_pi/04_normalized_pi/normalized_filtered_pi/overlapping/100kb_filtered/All26.100kb_filtered.o.panTro4.txt", header=FALSE)
  data2 <- (filtered_100kb_All26.o.panTro4)
  Position = ((data2$V1 + data2$V2)/2)*0.000001
  Diversity = (data2$V3)
  plot (Position, Diversity, type = 'n') 
  
  rect(xleft = c(48202745, 48976199, 51395467, 51775560, 52518132, 55464117, 62335733,70894117, 71941159, 100818723, 101435778, 103195105)/1000000, 
       xright = c(48292983, 49062381, 51492862, 51966529, 53027386, 55574172, 62495350, 71055682, 72325075, 100903977, 101774391, 103362341)/1000000, 
       ybottom = -0.1, ytop = 0.31, col=color, density = 100)
  
  rect(xleft = c(10241177, 16946047, 19303480, 38344992, 45930478, 99459295, 128232540, 151519514)/1000000,
       xright = c(12619185, 18747389, 22198160, 41272675, 77954462, 111145964, 136796526, 155156362)/1000000,
       ybottom = -0.1, ytop = 0.31, col=color, density = 100)
  
  points(Position, Diversity, pch = 20, 
         col=sapply(Position, function(x){
           if(x<=2.699){"red"}else if(x >= 88.193855 & x <= 93.193855){"blue"}else if(x>=154.940559){"red"}else{"black"}}))
  
  text(001,0.17, labels="PAR1")
  text(90,0.17, labels="XTR")
  text(155,0.17, labels="PAR2")
  
  mtext("B", side = 3, line = 0.1, adj = -0.075, cex = 0.9,
        col = "black")
  
  
  filtered_100kb_All26.o.RheMac3 <- read.delim("~/Projects/PAR/BrotmanCotter/PAR_Project/Codes_02/05_pi/04_normalized_pi/normalized_filtered_pi/overlapping/100kb_filtered/All26.100kb_filtered.o.RheMac3.txt", header=FALSE)
  data3 <- (filtered_100kb_All26.o.RheMac3)
  Position = ((data3$V1 + data3$V2)/2)*0.000001
  Diversity = (data3$V3)
  plot (Position, Diversity, type = 'n') 
  
  color <- rgb(190, 190, 190, alpha=80, maxColorValue = 255)
  rect(xleft = c(48202745, 48976199, 51395467, 51775560, 52518132, 55464117, 62335733,70894117, 71941159, 100818723, 101435778, 103195105)/1000000, 
       xright = c(48292983, 49062381, 51492862, 51966529, 53027386, 55574172, 62495350, 71055682, 72325075, 100903977, 101774391, 103362341)/1000000, 
       ybottom = -0.01, ytop = 0.035, col=color, density = 100)
  
  rect(xleft = c(10241177, 16946047, 19303480, 38344992, 45930478, 99459295, 128232540, 151519514)/1000000,
       xright = c(12619185, 18747389, 22198160, 41272675, 77954462, 111145964, 136796526, 155156362)/1000000,
       ybottom = -0.01, ytop = 0.035, col=color, density = 100)
  
  points(Position, Diversity, pch = 20, 
         col=sapply(Position, function(x){
           if(x<=2.699){"red"}else if(x >= 88.193855 & x <= 93.193855){"blue"}else if(x>=154.940559){"red"}else{"black"}}))
  
  text(001,0.03, labels="PAR1")
  text(93,0.03, labels="XTR")
  text(156,0.03, labels="PAR2")
  
  mtext("C", side = 3, line = 0.1, adj = -0.075, cex = 0.9,
        col = "black")
  
  
  filtered_100kb_All26.o.canFam3 <- read.delim("~/Projects/PAR/BrotmanCotter/PAR_Project/Codes_02/05_pi/04_normalized_pi/normalized_filtered_pi/overlapping/100kb_filtered/All26.100kb_filtered.o.canFam3.txt", header=FALSE)
  data3 <- (filtered_100kb_All26.o.canFam3)
  Position = ((data3$V1 + data3$V2)/2)*0.000001
  Diversity = (data3$V3)
  plot (Position, Diversity, type = 'n') 
  
  color <- rgb(190, 190, 190, alpha=80, maxColorValue = 255)
  rect(xleft = c(48202745, 48976199, 51395467, 51775560, 52518132, 55464117, 62335733,70894117, 71941159, 100818723, 101435778, 103195105)/1000000, 
       xright = c(48292983, 49062381, 51492862, 51966529, 53027386, 55574172, 62495350, 71055682, 72325075, 100903977, 101774391, 103362341)/1000000, 
       ybottom = -0.001, ytop = 0.009, col=color, density = 100)
  
  rect(xleft = c(10241177, 16946047, 19303480, 38344992, 45930478, 99459295, 128232540, 151519514)/1000000,
       xright = c(12619185, 18747389, 22198160, 41272675, 77954462, 111145964, 136796526, 155156362)/1000000,
       ybottom = -0.001, ytop = 0.009, col=color, density = 100)
  
  points(Position, Diversity, pch = 20, 
         col=sapply(Position, function(x){
           if(x<=2.699){"red"}else if(x >= 88.193855 & x <= 93.193855){"blue"}else if(x>=154.940559){"red"}else{"black"}}))
  
  text(001,0.006, labels="PAR1")
  text(93,0.006, labels="XTR")
  text(156,0.006, labels="PAR2")
  
  mtext("D", side = 3, line = 0.1, adj = -0.075, cex = 0.9,
        col = "black")
  
  
  filtered_100kb_All26.o.mm10 <- read.delim("~/Projects/PAR/BrotmanCotter/PAR_Project/Codes_02/05_pi/04_normalized_pi/normalized_filtered_pi/overlapping/100kb_filtered/All26.100kb_filtered.o.mm10.txt", header=FALSE)
  data3 <- (filtered_100kb_All26.o.mm10)
  Position = ((data3$V1 + data3$V2)/2)*0.000001
  Diversity = (data3$V3)
  plot (Position, Diversity, type = 'n') 
  
  color <- rgb(190, 190, 190, alpha=80, maxColorValue = 255)
  rect(xleft = c(48202745, 48976199, 51395467, 51775560, 52518132, 55464117, 62335733,70894117, 71941159, 100818723, 101435778, 103195105)/1000000, 
       xright = c(48292983, 49062381, 51492862, 51966529, 53027386, 55574172, 62495350, 71055682, 72325075, 100903977, 101774391, 103362341)/1000000, 
       ybottom = -0.001, ytop = 0.0063, col=color, density = 100)
  
  rect(xleft = c(10241177, 16946047, 19303480, 38344992, 45930478, 99459295, 128232540, 151519514)/1000000,
       xright = c(12619185, 18747389, 22198160, 41272675, 77954462, 111145964, 136796526, 155156362)/1000000,
       ybottom = -0.001, ytop = 0.0063, col=color, density = 100)
  
  points(Position, Diversity, pch = 20, 
         col=sapply(Position, function(x){
           if(x<=2.699){"red"}else if(x >= 88.193855 & x <= 93.193855){"blue"}else if(x>=154.940559){"red"}else{"black"}}))
  
  text(001,0.005, labels="PAR1")
  text(93,0.005, labels="XTR")
  text(156,0.005, labels="PAR2")
  
  mtext("E", side = 3, line = 0.1, adj = -0.075, cex = 0.9,
        col = "black")
  
  box(col = "black")
}
mtext("Chromosome X Position (Mb)", side = 1, outer = TRUE, cex = 0.9, line = 2.2,
      col = "black")
mtext("Diversity (pi)", side = 2, outer = TRUE, cex = 0.9, line = 2.2,
      col = "black")