#CCA
#Paquetes
library("CCA")
#Selección de variables
ruta1<-file.choose()
datos1<-read.csv(ruta1)
ruta2<-file.choose()
datos2<-read.csv(ruta2)
head(datos1)
head(datos2)
dim(datos1)
ind <- match(datos1[,1], datos2[,1])
data<-data.frame(datos1[ind,],datos2[,2:14])
X <- data[,2:14]
Y <- data[,15:27]
#Análisis de Correlación Canónica  
result <- matcor(X,Y)
img.matcor(result, type = 2)
cc <- cc(X,Y)
plt.cc(cc,ind.names = data[,1])
plt.cc(cc,d1=1,d2=2,type="v",var.label=TRUE)

