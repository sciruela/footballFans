library(ggplot2)
library(RColorBrewer)

entradas<-read.csv("/Users/sciruela/Documents/footballFans/entradas.csv",sep=",")

df<-data.frame(x=entradas$equipo,y.min=entradas$barata,y=entradas$cara)

df.melt<-melt(df,id.var='x')
pal2 <- brewer.pal(9,"Set2")

pdf("/Users/sciruela/Documents/footballFans/entradas.pdf",width=50,height=20)
ggplot(df.melt,aes(x=x,y=value,fill=variable))+geom_bar(stat="identity")+scale_y_continuous("Cara - Barata",formatter="comma",limits=c(0,200))+opts(axis.text.x=theme_text(size=20))+opts(axis.text.y=theme_text(size=20))+scale_fill_manual(values=c(NA,pal2[5]))
dev.off()