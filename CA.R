#CA
#Paquetes
library(readxl)
library(FactoMineR)
library(factoextra)
#Selección de variables
ruta<-file.choose()
datos<-read_excel(ruta)
datos<-as.data.frame(datos)
head(datos)
dim(datos)
names(datos)
d1<-datos[,c("ESTADO","VIVO O MUERTO")]

#Prueba de Chi-cuadrada
td1<-table(d1)
chisq <- chisq.test(td1)
#Análisis de Correspondencia Simple
result<-CA(td1, graph = FALSE)
fviz_screeplot(result, addlabels = TRUE, ylim = c(0, 100))
fviz_contrib(result, choice = "row", axes = 1:2, top = 15)
fviz_ca_biplot(result, repel = TRUE, arrow = c(FALSE, TRUE),pointsize = 0.5,labelsize = 2,col.col = "#16A085",col.row = "black")
