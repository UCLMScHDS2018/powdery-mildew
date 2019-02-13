rm(list = ls()) # Borra todos los objetos
setwd("D:/Respaldo disco c 2/Trabajo INIA/Pruebas R")
#generar un archivo pdf con los graficos
pdf(file = "histogramas OIV2.pdf", width = 8.5, height = 11)
#separa la pantalla en c(numero de filas, numero de columnas)  
par(mfrow = c(3,2))  

resoidio <- read.csv("CSV ODIO.csv", header = T, sep=",")

OIV <- resoidio$OIV
OIV <- na.omit(OIV)

hist(OIV, main = "Todos los Cruzamientos", xlab = "Resistencia a Oidio", ylab = "Individuos", col = "grey", las = 1 , xlim = c(0,9) , breaks = seq(0.5,9.5,by=1), xaxt='n')
axis(side=1,at=hist$mids,labels=seq(1,9))

cruzamientos <- resoidio$Cruzamiento
cruzamientos <- na.omit(cruzamientos)
max_cruzamientos <- max(cruzamientos)
num_cruzamientos <- unique(cruzamientos)
num_cruzamientos <- sort(num_cruzamientos, decreasing = FALSE)

for (i in num_cruzamientos){  
  
  OIVcruzai <- resoidio[resoidio$Cruzamiento == i, ]
  
  OIVcruzai <- na.omit(OIVcruzai)

  hist <- hist(OIVcruzai$OIV, main = paste("Cruzamiento ", i ," ", OIVcruzai$Madre[1] , " X " , OIVcruzai$Padre[1] , sep = ""), xlab = "Resistencia a Oidio", ylab="Individuos", las=1, xlim = c(0,9), breaks = seq(0.5,9.5,by=1), col = "grey", xaxt='n')
  axis(side=1,at=hist$mids,labels=seq(1,9))
  }

dev.off()
