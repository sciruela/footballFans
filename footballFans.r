library(RColorBrewer)

paises<-read.csv("/Users/sciruela/Documents/footballFans/paises.csv",sep=",")

radius <- sqrt( paises$aforo/ pi )



paises$coloraforo<-cut(paises$aforo, breaks=c(60000,30000,20000,15000,10000,5000,1000))
pal2 <- brewer.pal(9,"Set2")
pdf("/Users/sciruela/Documents/footballFans/grafico.pdf")
symbols(paises$evolucion,paises$asistencia,circles=radius,inches=0.35,fg="white",bg=pal2[paises$coloraforo],xlab="DISMINUCION DE ASISTENCIA",ylab="ASISTENCIA A LOS CAMPOS")
text(paises$evolucion,paises$asistencia, paises$pais, cex=0.5)
dev.off()