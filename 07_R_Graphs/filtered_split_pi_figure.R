par(mfrow = c(4, 1))
par(cex = 0.6)
par(mar = c(1.5, 1.5, 1.2, 1.2), oma = c(4, 4, 0.5, 0.5))
par(tcl = -0.25)
par(mgp = c(2, 0.6, 0))
for (i in 1:4) {
  plot(1, axes = FALSE, type = "n")
  4
  
  pi_All26 <- read.delim("~/Projects/PAR/BrotmanCotter/PAR_Project/Codes_04/05_pi/03_pi/split_filtered_pi/split_filtered_pi_All26_graph.txt", header=FALSE)

  pi <- pi_All26$V2
  pi[1]
  plot(0, type="n", xlim=c(0, 155), ylim=c(0, 0.002))
  
  rect(0, (pi[1]-0.0003), 2.699, (pi[1]+0.0003), col="red")
  rect(2.700, (pi[3]-0.0003), 88.193855, (pi[3]+0.0003))
  rect(88.193955, (pi[4]-0.0003), 93.193855, (pi[4]+0.0003), col="blue")
  rect(93.193855, (pi[3]-0.0003), 154.940559, (pi[3]+0.0003))
  rect(154.940559, (pi[2]-0.0003), 155.260001, (pi[2]+0.0003), col="red")

  text(001,0.00195, labels="PAR1")
  text(90,0.00118, labels="XTR")
  text(155,0.00115, labels="PAR2")
  text(45,0.00055, labels="nonPAR")
  text(125,0.00055, labels="nonPAR")
  
  mtext("A", side = 3, line = 0.1, adj = -0.07, cex = 0.9,
        col = "black")
  
  
  pi_All26.panTro4 <- read.delim("~/Projects/PAR/BrotmanCotter/PAR_Project/Codes_04/05_pi/04_normalized_pi/normalized_split_filtered_pi/pi_All26.panTro4.txt", header=FALSE)

  pi2 <- pi_All26.panTro4$V2
  pi2[1]
  plot(0, type="n", xlim=c(0, 155), ylim=c(0.04, 0.09))
  
  rect(0, (pi2[1]-0.007), 2.699, (pi2[1]+0.007), col="red")
  rect(2.700, (pi2[3]-0.007), 88.193855, (pi2[3]+0.007))
  rect(88.193955, (pi2[4]-0.007), 93.193855, (pi2[4]+0.007), col="blue")
  rect(93.193855, (pi2[3]-0.007), 154.940559, (pi2[3]+0.007))
  rect(154.940559, (pi2[2]-0.007), 155.260001, (pi2[2]+0.007), col="red")
  
  text(001,0.077, labels="PAR1")
  text(90,0.079, labels="XTR")
  text(155,0.088, labels="PAR2")
  text(45,0.052, labels="nonPAR")
  text(125,0.052, labels="nonPAR")
  
  mtext("B", side = 3, line = 0.1, adj = -0.07, cex = 0.9,
        col = "black")
  
  
  pi_All26.RheMac3 <- read.delim("~/Projects/PAR/BrotmanCotter/PAR_Project/Codes_04/05_pi/04_normalized_pi/normalized_split_filtered_pi/pi_All26.RheMac3.txt", header=FALSE)

  pi3 <- pi_All26.RheMac3$V2
  pi3[1]
  plot(0,type="n", xlim=c(0, 155), ylim=c(0.003, 0.022))
  
  rect(0, (pi3[1]-0.003), 2.699, (pi3[1]+0.003), col="red")
  rect(2.700, (pi3[3]-0.003), 88.193855, (pi3[3]+0.003))
  rect(88.193955, (pi3[4]-0.003), 93.193855, (pi3[4]+0.003), col="blue")
  rect(93.193855, (pi3[3]-0.003), 154.940559, (pi3[3]+0.003))
  rect(154.940559, (pi3[2]-0.003), 155.260001, (pi3[2]+0.003), col="red")
  
  text(001,0.019, labels="PAR1")
  text(90,0.0176, labels="XTR")
  text(155,0.020, labels="PAR2")
  text(45,0.01, labels="nonPAR")
  text(125,0.01, labels="nonPAR")
  
  mtext("C", side = 3, line = 0.1, adj = -0.07, cex = 0.9,
        col = "black")
  
  
  pi_All26.canFam3 <- read.delim("~/Projects/PAR/BrotmanCotter/PAR_Project/Codes_04/05_pi/04_normalized_pi/normalized_split_filtered_pi/pi_All26.canFam3.txt", header=FALSE)
  
  pi3 <- pi_All26.canFam3$V2
  pi3[1]
  plot(0,type="n", xlim=c(0, 155), ylim=c(0.003, 0.022))
  
  rect(0, (pi3[1]-0.003), 2.699, (pi3[1]+0.003), col="red")
  rect(2.700, (pi3[3]-0.003), 88.193855, (pi3[3]+0.003))
  rect(88.193955, (pi3[4]-0.003), 93.193855, (pi3[4]+0.003), col="blue")
  rect(93.193855, (pi3[3]-0.003), 154.940559, (pi3[3]+0.003))
  rect(154.940559, (pi3[2]-0.003), 155.260001, (pi3[2]+0.003), col="red")
  
  text(001,0.019, labels="PAR1")
  text(90,0.0176, labels="XTR")
  text(155,0.020, labels="PAR2")
  text(45,0.01, labels="nonPAR")
  text(125,0.01, labels="nonPAR")
  
  mtext("D", side = 3, line = 0.1, adj = -0.07, cex = 0.9,
        col = "black")
  
  
  box(col = "black")
}
mtext("Chromosome X Position (Mb)", side = 1, outer = TRUE, cex = 0.9, line = 2.2,
      col = "black")
mtext("Diversity (pi)", side = 2, outer = TRUE, cex = 0.9, line = 2.2,
      col = "black")