#PCA
#Paquetes
library(FactoMineR)
library(factoextra)
#Selección de variables
ruta<-file.choose()
datos<-read.csv(ruta)
head(datos)
dim(datos)
d<-datos[,c("F0","F1","F2","F3","F4","Time")]
#Análisis de Componentes Principales
result<-PCA(X = d, graph = FALSE)
fviz_screeplot(result, addlabels = TRUE, ylim = c(0, 100))
fviz_contrib(result, choice = "var", axes = 1, top = 10)
fviz_pca_ind(result, geom.ind="point", col.ind="gray", axes=c(1, 2), pointsize=0.5) 
fviz_pca_var(result, col.var = "cos2", geom.var = c("arrow","text"), labelsize=2, repel = FALSE,label = "all")
fviz_pca_biplot(result,label="var", col.var ="cos2", alpha.ind="contrib", pointsize = 0.5)
