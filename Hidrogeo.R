
# Manipulación de datos ---------------------------------------------------
library(dplyr)
library(knitr)

precip %>% 
  filter(Year %in% 2001:2007) %>% 
  group_by(Year) %>% 
  summarize_all(mean)

storms %>% 
  select(year, wind, pressure, status) %>% 
  filter(status == "hurricane" & year %in% 2000:2010 ) %>% 
  group_by(year) %>% 
  summarise(mean(wind), mean(pressure))

# Pozos e índices de saturaciónd de agua subterránea ----------------------
#Estadísticos descriptivos#
library(readxl)
Pozos_e_indices_de_saturación <- read_excel("Pozos e indices de saturación.xlsx",col_names = TRUE)
datos <- Pozos_e_indices_de_saturación
rm(Pozos_e_indices_de_saturación)
datos <- datos[,c(1,4,5,7:18,20:26)]

#número de datos por sitios de muestreo#
table(datos$Station)#número de datos por sitios de muestreo#

#calcula la media de todas las variables por factor#
datos2 <- aggregate(. ~ Station, data = datos, mean, na.rm=TRUE, na.action = NULL)

# Gráficos descriptivos ---------------------------------------------------

library(ggplot2)
install.packages("viridis")
library(viridis)
install.packages("RColorBrewer")
library(RColorBrewer)

p1 <- ggplot (datos, aes(x=pH)) +
  geom_histogram(aes(y=..density..), colour="#E69F00", fill="white", size = 0.7) +
  geom_vline(aes(xintercept=7.649204),
  color = "blue",  linetype = "dashed", size = 1, na.rm=TRUE) +
  geom_density(colour= "#E69F00", fill="#E69F00", alpha=0.6, size = 0.5) +
  labs(title="Histograma pH") +
  labs(x="pH", y = "Densidad") +
  theme_minimal()

p2 <- ggplot (datos, aes(x=Conductivity)) +
  geom_histogram(aes(y=..density..), colour="#009999", fill="white", size = 0.7) +
  geom_vline(aes(xintercept=1145.186),
  color = "blue",  linetype = "dashed", size = 1, na.rm=TRUE) +
  geom_density(colour= "#009999", fill="#009999", alpha=0.4, size = 0.5) +
  labs(title="Histograma Conductividad") +
  labs(x="Conductividad", y = "Densidad") +
  theme_minimal()

p3 <- ggplot (datos, aes(x=Hardness)) +
  geom_histogram(aes(y=..density..), colour="#E69F00", fill="white", size = 0.7) +
  geom_vline(aes(xintercept=272.8043),
             color = "blue",  linetype = "dashed", size = 1, na.rm=TRUE) +
  geom_density(colour= "#E69F00", fill="#E69F00", alpha=0.6, size = 0.5) +
  labs(title="Histograma Hardness") +
  labs(x="Hardness", y = "Densidad") +
  theme_minimal()

p4 <- ggplot (datos, aes(x=TDS)) +
  geom_histogram(aes(y=..density..), colour="#009999", fill="white", size = 0.7) +
  geom_vline(aes(xintercept=795.7812),
             color = "blue",  linetype = "dashed", size = 1, na.rm=TRUE) +
  geom_density(colour= "#009999", fill="#009999", alpha=0.4, size = 0.5) +
  labs(title="Histograma TDS") +
  labs(x="TDS", y = "Densidad") +
  theme_minimal()

p5 <- ggplot (datos, aes(x=Na)) +
  geom_histogram(aes(y=..density..), colour="#E69F00", fill="white", size = 0.7) +
  geom_vline(aes(xintercept=209.7633),
             color = "blue",  linetype = "dashed", size = 1, na.rm=TRUE) +
  geom_density(colour= "#E69F00", fill="#E69F00", alpha=0.6, size = 0.5) +
  labs(title="Histograma Na") +
  labs(x="Na", y = "Densidad") +
  theme_minimal()

p6 <- ggplot (datos, aes(x=K)) +
  geom_histogram(aes(y=..density..), colour="#009999", fill="white", size = 0.7) +
  geom_vline(aes(xintercept=26.33462),
             color = "blue",  linetype = "dashed", size = 1, na.rm=TRUE) +
  geom_density(colour= "#009999", fill="#009999", alpha=0.4, size = 0.5) +
  labs(title="Histograma K") +
  labs(x="K", y = "Densidad") +
  theme_minimal()

p7 <- ggplot (datos, aes(x=Ca)) +
  geom_histogram(aes(y=..density..), colour="#E69F00", fill="white", size = 0.7) +
  geom_vline(aes(xintercept=49.43912),
             color = "blue",  linetype = "dashed", size = 1, na.rm=TRUE) +
  geom_density(colour= "#E69F00", fill="#E69F00", alpha=0.4, size = 0.5) +
  labs(title="Histograma Ca") +
  labs(x="Ca", y = "Densidad") +
  theme_minimal()

p8 <- ggplot (datos, aes(x=Mg)) +
  geom_histogram(aes(y=..density..), colour="#009999", fill="white", size = 0.7) +
  geom_vline(aes(xintercept=34.66438),
             color = "blue",  linetype = "dashed", size = 1, na.rm=TRUE) +
  geom_density(colour= "#009999", fill="#009999", alpha=0.4, size = 0.5) +
  labs(title="Histograma Mg") +
  labs(x="Mg", y = "Densidad") +
  theme_minimal()

p9 <- ggplot (datos, aes(x=Fl)) +
  geom_histogram(aes(y=..density..), colour="#E69F00", fill="white", size = 0.7) +
  geom_vline(aes(xintercept=6.052469),
             color = "blue",  linetype = "dashed", size = 1, na.rm=TRUE) +
  geom_density(colour= "#E69F00", fill="#E69F00", alpha=0.4, size = 0.5) +
  labs(title="Histograma Fl") +
  labs(x="Fl", y = "Densidad") +
  theme_minimal()

p10 <- ggplot (datos, aes(x=Cl)) +
  geom_histogram(aes(y=..density..), colour="#009999", fill="white", size = 0.7) +
  geom_vline(aes(xintercept=127.1966),
             color = "blue",  linetype = "dashed", size = 1, na.rm=TRUE) +
  geom_density(colour= "#009999", fill="#009999", alpha=0.4, size = 0.5) +
  labs(title="Histograma Cl") +
  labs(x="Cl", y = "Densidad") +
  theme_minimal()

p11 <- ggplot (datos, aes(x=HCO3)) +
  geom_histogram(aes(y=..density..), colour="#E69F00", fill="white", size = 0.7) +
  geom_vline(aes(xintercept=570.3386),
             color = "blue",  linetype = "dashed", size = 1, na.rm=TRUE) +
  geom_density(colour= "#E69F00", fill="#E69F00", alpha=0.4, size = 0.5) +
  labs(title="Histograma HCO3") +
  labs(x="HCO3", y = "Densidad") +
  theme_minimal()

p12 <- ggplot (datos, aes(x=NO3)) +
  geom_histogram(aes(y=..density..), colour="#009999", fill="white", size = 0.7) +
  geom_vline(aes(xintercept=62.36595),
             color = "blue",  linetype = "dashed", size = 1, na.rm=TRUE) +
  geom_density(colour= "#009999", fill="#009999", alpha=0.4, size = 0.5) +
  labs(title="Histograma NO3") +
  labs(x="NO3", y = "Densidad") +
  theme_minimal()

p13 <- ggplot (datos, aes(x=SO4)) +
  geom_histogram(aes(y=..density..), colour="#E69F00", fill="white", size = 0.7) +
  geom_vline(aes(xintercept=71.30099),
             color = "blue",  linetype = "dashed", size = 1, na.rm=TRUE) +
  geom_density(colour= "#E69F00", fill="#E69F00", alpha=0.4, size = 0.5) +
  labs(title="Histograma SO4") +
  labs(x="SO4", y = "Densidad") +
  theme_minimal()

p14 <- ggplot (datos, aes(x=SiO2)) +
  geom_histogram(aes(y=..density..), colour="#009999", fill="white", size = 0.7) +
  geom_vline(aes(xintercept=43.09326),
             color = "blue",  linetype = "dashed", size = 1, na.rm=TRUE) +
  geom_density(colour= "#009999", fill="#009999", alpha=0.4, size = 0.5) +
  labs(title="Histograma SiO2") +
  labs(x="SiO2", y = "Densidad") +
  theme_minimal()

p15 <- ggplot (datos, aes(x=O18)) +
  geom_histogram(aes(y=..density..), colour="#E69F00", fill="white", size = 0.7) +
  geom_vline(aes(xintercept=-5.310782),
             color = "blue",  linetype = "dashed", size = 1, na.rm=TRUE) +
  geom_density(colour= "#E69F00", fill="#E69F00", alpha=0.4, size = 0.5) +
  labs(title="Histograma O18") +
  labs(x="O18", y = "Densidad") +
  theme_minimal()

p16 <- ggplot (datos, aes(x=H2)) +
  geom_histogram(aes(y=..density..), colour="#009999", fill="white", size = 0.7) +
  geom_vline(aes(xintercept=-31.48567),
             color = "blue",  linetype = "dashed", size = 1, na.rm=TRUE) +
  geom_density(colour= "#009999", fill="#009999", alpha=0.4, size = 0.5) +
  labs(title="Histograma H2") +
  labs(x="H2", y = "Densidad") +
  theme_minimal()

p17 <- ggplot (datos, aes(x=Tritium)) +
  geom_histogram(aes(y=..density..), colour="#E69F00", fill="white", size = 0.7) +
  geom_vline(aes(xintercept=1.47356),
             color = "blue",  linetype = "dashed", size = 1, na.rm=TRUE) +
  geom_density(colour= "#E69F00", fill="#E69F00", alpha=0.4, size = 0.5) +
  labs(title="Histograma Tritium") +
  labs(x="Tritium", y = "Densidad") +
  theme_minimal()

p18 <- ggplot (datos, aes(x=Alkalinity)) +
  geom_histogram(aes(y=..density..), colour="#009999", fill="white", size = 0.7) +
  geom_vline(aes(xintercept=0.007827631),
             color = "blue",  linetype = "dashed", size = 1, na.rm=TRUE) +
  geom_density(colour= "#009999", fill="#009999", alpha=0.4, size = 0.5) +
  labs(title="Histograma Alkalinity") +
  labs(x="Alkalinity", y = "Densidad") +
  theme_minimal()

library(gridExtra)
windows()
grid.arrange(p10,p11,p12,p13,p14,p15,p16,p17,p18,nrow=3)


# Gráfico Precipitación - Isótopos ----------------------------------------
library(readxl)
library(plyr)
precip <- read_excel("Lluvia.xlsx",col_names = TRUE)
precip <- precip[with(precip,order(-precip$Año)),]##forma directa##
precip <- arrange(precip, Año)##forma simple## requiere plyr###

mPrecMen <- apply(precip[,-1],2,mean,na.rm = TRUE)
mPrecMen <- as.data.frame(mPrecMen)

sdPrecMen <- apply(precip[,-1],2,sd,na.rm = TRUE)
sdPrecMen <- as.data.frame(sdPrecMen)

mPrecAn <- aggregate(. ~ Año, data = precip, mean, na.rm=TRUE, na.action = NULL)

isotopos <- read_excel("Isótopos.xlsx")
mIsoMen <- aggregate(. ~ Mes, data = isotopos, mean, na.rm=TRUE, na.action = NULL)
sdIsoMen <- aggregate(. ~ Mes, data = isotopos, sd, na.rm=TRUE, na.action = NULL)

comp <- cbind(mIsoMen,sdIsoMen$`18O`,sdIsoMen$`2H`,mPrecMen,sdPrecMen)

windows()
par(mar=c(5, 5, 3, 5))
barplot(comp$mPrecMen,names.ar=comp$Mes,col="aquamarine3",border=NA,xlab="Month",ylab="Precipitation (mm)",
        tcl=0.3,cex.lab=1.5,font.lab=2,cex.axis=1,space=0.5,ylim=c(0,100))
par(new=T)
plot(comp$Mes,comp$`2H`,type="p",col="red",pch=16,cex=2,axes=F,ylim=c(-60,5),ylab="",xlab="")
arrows(comp$Mes, comp$`2H`-comp$sd2H, comp$Mes, comp$`2H`+comp$sd2H, code=3, length=0.05,lwd=3, angle=90)
axis(side=4,tcl=0.3,cex.axis=1)
abline(h=mean(isotopos$`2H`),col="red", lty=4, lwd=3)
mtext(expression(bold(delta*D(VSMOW))),side=4,line=3,cex=1.5)
legend("top",c("Precipitation (mm)",expression(delta*D),"Mean Ground Water"),
  col=c("aquamarine3","black","red"),
  bg="white", border="white", lty=c(1,1,2), lwd=c(8,3,3), cex=1, bty="n")

windows()
par(mar=c(5, 5, 3, 5))
barplot(comp$mPrecMen,names.ar=comp$Mes,col="aquamarine3",border=NA,xlab="Month",ylab="Precipitation (mm)",
        tcl=0.3,cex.lab=1.5,font.lab=2,cex.axis=1,space=0.5,ylim=c(0,100))
par(new=T)
plot(comp$Mes,comp$`18O`,type="p",col="red",pch=16,cex=2,axes=F,ylim=c(-10,0),ylab="",xlab="")
arrows(comp$Mes, comp$`18O`-comp$sd18O, comp$Mes, comp$`18O`+comp$sd18O, code=3, length=0.05,lwd=3, angle=90)
axis(side=4,tcl=0.3,cex.axis=1)
abline(h=mean(isotopos$`18O`),col="red", lty=4, lwd=3)
mtext(expression(bold(delta ^18*O (VSMOW) )),side=4,line=3,cex=1.5)
legend("top",c("Precipitation (mm)",expression(delta ^18*O),"Mean Ground Water"),
       col=c("aquamarine3","black","red"),
       bg="white", border="white", lty=c(1,1,2), lwd=c(8,3,3), cex=1, bty="n")


# Gráfico con distribución marginal ---------------------------------------

library(tidyverse)
library(ggpubr)
library(rstatix)
library(ggExtra)

boxplot.stats(H2)$out
O18 <- datos2$O18[!datos2$O18 %in% boxplot.stats(datos2$O18)$out]

outlier <- datos2 %>%
  identify_outliers("Conductivity")

datos2.wo <- datos2 %>% 
  anti_join(outlier, by = "Station")

model <- lm(H2 ~ O18, datos2.wo)

p1 <- ggplot(datos2.wo, aes(x = O18, y = H2, colour = Conductivity)) +
  geom_point(size = 2, alpha = 0.7) +
  geom_smooth(method=lm, col = "red")+
  gradient_color(c("RdYlBu")) +
  theme(legend.position = "left") 
  ggMarginal(p1, type = "histogram", xparams = list(col = "orange", fill = "orange"),
           yparams = list(col = "darkcyan", fill = "darkcyan"))

p2 <- ggscatter(datos2.wo[-178,], x = "O18", y = "H2", color = "Conductivity", size = 3) +
  gradient_color(c("red", "yellow", "blue")) +
  geom_smooth(method=lm, col = "blue", linetype = "dashed") +
  theme(plot.background = element_rect(), legend.position = "left", panel.border = element_rect(linetype = "dashed", fill = NA))
p2.2 <- ggMarginal(p2, type = "histogram", xparams = list(col = "orange", fill = "orange"),
           yparams = list(col = "darkcyan", fill = "darkcyan"))

p3 <- ggscatter(datos2.wo, x = "O18", y = "H2", color = "lightgray") +
  geom_density_2d()

p4 <- p3 + stat_density_2d(aes(fill = ..level..), geom = "polygon")

p5 <- p3 + stat_density_2d(aes(fill = ..level..), geom = "polygon")+
  gradient_fill(c("white", "steelblue"))

p6 <- p3 + stat_density_2d(aes(fill = ..level..), geom = "polygon") +
  gradient_fill("YlOrRd")

library(gridExtra)
windows()
grid.arrange(p2.2, p6,nrow=1)


# Mapas Coropléticos o de Coropletas -------------------------------------------------------------------

install.packages("rgdal")
install.packages("rgeos")
library(rgdal)
library(rgeos)

#cargar base de datos#
Census.Data <-read.csv("practicaldata.csv")

#cargar las capas de áreas#
Output.Areas<- readOGR(".", "Camden_oa11")
windows()
plot(Output.Areas)

#combinar las capas y la base de datos#
OA.Census <- merge(Output.Areas, Census.Data, by.x="OA11CD", by.y="OA")

#Configurar el sistemas de coordenadas#
proj4string(OA.Census) <- CRS("+init=EPSG:22195")

#cargar mapas#
install.packages ("tmap")
install.packages("leaflet")

library(tmap)
library(leaflet)

windows()
qtm(OA.Census, fill = "Qualification")

#crea un mapa coroplético simple de la variable seleccionada#
windows()
tm_shape(OA.Census) + tm_fill("White_British")

#configurar la paleta de colores#
library(RColorBrewer)
display.brewer.all()
windows()
tm_shape(OA.Census) + tm_fill("Qualification", palette = "-Greens")

#configura los intervalos#
windows()
tm_shape(OA.Census) + tm_fill("Qualification", style = "quantile", palette = "Reds")
tm_shape(OA.Census) + tm_fill("Qualification", style = "quantile", n=7, palette = "Reds")

#incluye un histograma en la leyenda del mapa#
windows()
tm_shape(OA.Census) + tm_fill("Qualification", style = "quantile", 
                              n=5, palette = "Reds", legend.hist = TRUE )

#incluir bordes y flecha de norte#
windows()
tm_shape(OA.Census) + tm_fill("Qualification", palette = "Reds") +
  tm_borders(alpha=.4) +
  tm_compass()

#editar el diseño del mapa#
windows()
tm_shape(OA.Census) + tm_fill("Qualification", palette = "Reds",
    style = "quantile", title = "% with a Qualification") +
tm_borders (alpha=0.4) +
tm_compass() +
tm_layout(title = "Camden, London", legend.text.size = 1.1,
            legend.title.size = 1.4, legend.position = c("right", "top"), frame = FALSE)


# Mapas de puntos ---------------------------------------------------------

install.packages("rgdal")
install.packages("rgeos")
library(rgdal)
library(rgeos)

#cargar base de datos#
Census.Data <-read.csv("practicaldata.csv")

#cargar las capas de áreas#
Output.Areas<- readOGR(".", "Camden_oa11")
windows()
plot(Output.Areas)

#combinar las capas y la base de datos#
OA.Census <- merge(Output.Areas, Census.Data, by.x="OA11CD", by.y="OA")

#cargar la matriz de puntos para graficar#
houses <- read.csv("camdenhousesales15.csv")
houses <- houses[,c(1,2,8,9)]

#convertir CSV en SpatialPointsDataFrame#
install.packages("sp")
library(sp)

House.Points <- SpatialPointsDataFrame(houses[,3:4], houses,
                                      proj4string = CRS("+init=EPSG:27700"))

#crear mapa de puntos#
library(tmap)

windows()
tm_shape(OA.Census) + tm_borders(alpha=.4)

windows()
tm_shape(Output.Areas) + tm_borders(alpha=.4) +
  tm_shape(House.Points) + tm_dots(col = "Price", scale = 1.5, palette = "Reds", style = "quantile", title = "Price Paid")

#crear mapa de símbolos graduados#

windows()
tm_shape(OA.Census) + tm_borders(alpha=.4) +
tm_shape(House.Points) + tm_bubbles(size = "Price", col = "Price",
                                      palette = "Blues", style = "quantile",
                                      legend.size.show = FALSE,
                                      title.col = "Price Paid (£)") +
tm_layout(legend.text.size = 1.1, legend.title.size = 1.4, frame = FALSE)


# Mapas de densidad ------------------------------------------------------

library(sp)
library(rgdal)
library(rgeos)

Output.Areas <- readOGR(".", "Camden_oa11") #cargar las capas de áreas#

House.Points <- readOGR(".", "Camden_house_sales") #cargar las capas de puntos#

#estimación de densidad Kernel#
install.packages("raster")
install.packages("adehabitatHR")
library(raster)
library(adehabitatHR)

kde.output <- kernelUD(House.Points, h="href", grid = 1000)
windows()
plot(kde.output)

#mapa de contornos de densidad#
library(tmap)
kde <- raster(kde.output) #convertir a raster#
projection(kde) <- CRS("+init=EPSG:27700")

windows()
tm_shape(kde) + tm_raster("ud")

bounding_box <- bbox(Output.Areas)
windows()
tm_shape(kde, bbox = bounding_box) + tm_raster("ud")

#mapa de combinación raster vs capa de áreas#
masked_kde <- mask(kde, Output.Areas)

windows()
tm_shape(masked_kde, bbox = bounding_box) + tm_raster("ud", style = "quantile",
                                                      n = 100,
                                                      legend.show = FALSE,
                                                      palette = "YlGnBu") +
tm_shape(Output.Areas) + tm_borders(alpha=.3, col = "white") +
tm_layout(frame = FALSE)

#estimación de densidad kernel: límites de contorno#

range75 <- getverticeshr(kde.output, percent = 75)
range50 <- getverticeshr(kde.output, percent = 50)
range25 <- getverticeshr(kde.output, percent = 25)

windows()
tm_shape(Output.Areas) + tm_fill(col = "#f0f0f0") + tm_borders(alpha=.8, col = "white") +
  tm_shape(House.Points) + tm_dots(col = "blue") +
  tm_shape(range75) + tm_borders(alpha=.7, col = "#fb6a4a", lwd = 2) +
  tm_fill(alpha=.1, col = "#fb6a4a") +
  tm_shape(range50) + tm_borders(alpha=.7, col = "#de2d26", lwd = 2) +
  tm_fill(alpha=.1, col = "#de2d26") +
  tm_shape(range25) + tm_borders(alpha=.7, col = "#a50f15", lwd = 2) +
  tm_fill(alpha=.1, col = "#a50f15") +
  tm_layout(frame = FALSE)


# Mapas Quequén -----------------------------------------------------------
library(sp)

#cargar base de datos de puntos#
datos3 <- datos2[,c(3,2,5)]

#cargar las capas de áreas#
Output.Areas <- readOGR(".", "municipios_1")
windows()
plot(Output.Areas)

#crear un SpatialPointsDataFrame#

Quequen <- SpatialPointsDataFrame(datos3[,c(1:2)], 
                                  datos3,
                                  proj4string = CRS("+init=EPSG:22195"))

library(tmap)
windows()
tm_shape(Output.Areas, projection="longlat") + 
  tm_borders(alpha=.4) +
  tm_shape(Quequen) + 
  tm_dots(col = "Conductivity", palette = "BuPu", style = "quantile", size = 0.1, legend.hist = TRUE, colorNA = "red") +
  tm_layout(legend.stack = "horizontal", frame = FALSE, outer.margins = c(0.01,0.05,0.01,0.01), inner.margins = c(0.01,0.01,0.01,0.01)) +
  tm_grid(projection="longlat", alpha = 0, labels.size = .8, labels.rot= c(0,90), labels.margin.y = 0, labels.inside.frame = F) +
  tm_compass(type = "8star", position = c("right","top"), size = 4, show.labels = 2)

#estimación de densidad Kernel#
install.packages("raster")
install.packages("adehabitatHR")
library(raster)
library(adehabitatHR)

kde.output <- kernelUD(Quequen, h="href", grid = 1000)
windows()
plot(kde.output)

kde <- raster(kde.output) #convertir a raster#
projection(kde) <- CRS("+init=EPSG:22195")

#estimación de densidad kernel: límites de contorno#

range80 <- getverticeshr(kde.output, percent = 80)
range60 <- getverticeshr(kde.output, percent = 60)
range40 <- getverticeshr(kde.output, percent = 40)
range20 <- getverticeshr(kde.output, percent = 20)

windows()
tm_shape(Output.Areas, projection="longlat") + tm_fill(col = "#f0f0f0") + tm_borders(alpha=.8, col = "white", lwd=2) +
  tm_shape(Quequen) + tm_dots(col = "Conductivity", palette = "Reds", style = "quantile", size = 0.1, legend.hist = TRUE, colorNA = "darkgreen") +
  tm_shape(range80) + tm_borders(alpha=.7, col = "#fb6a4a", lwd = 2) +
  tm_fill(alpha=.1, col = "#fb6a4a") +
  tm_shape(range60) + tm_borders(alpha=.7, col = "#fb6a4a", lwd = 2) +
  tm_fill(alpha=.1, col = "#fb6a4a") +
  tm_shape(range40) + tm_borders(alpha=.7, col = "#de2d26", lwd = 2) +
  tm_fill(alpha=.1, col = "#de2d26") +
  tm_shape(range20) + tm_borders(alpha=.7, col = "#a50f15", lwd = 2) +
  tm_fill(alpha=.1, col = "#a50f15") +
  tm_layout(legend.stack = "vertical", frame = FALSE, outer.margins = c(0.01,0.05,0.01,0.01), inner.margins = c(0.05,0.05,0.05,0.05)) +
  tm_grid(projection="longlat", alpha = 0, labels.size = .8, labels.rot= c(0,90), labels.margin.x = 0, labels.margin.y = 0, labels.inside.frame = F) +
  tm_compass(type = "8star", position = c("right","top"), size = 4, show.labels = 2)




# Interpolacion espacial ------------------------------------------------

##Polígonos de Thiessen o interpolación por proximidad##

install.packages("spatstat")
install.packages("maptools")

library(spatstat)
library(maptools)
library(raster)

dat.pp <- as(dirichlet(as.ppp(Quequen)), "SpatialPolygons")
dat.pp <- as(dat.pp,"SpatialPolygons")

proj4string(dat.pp) <- CRS("+init=EPSG:22195")
proj4string(Quequen) <- CRS("+init=EPSG:22195")

int.Z <- over(dat.pp,Quequen, fn=mean)#asigna los polígonos creados a la base de datos de Quequén#
thiessen <- SpatialPolygonsDataFrame(dat.pp, int.Z)#crea un SpatialPolygonsDataFrame#

#Mapa de Polígonos de Thiessen#
windows()
tm_shape(Output.Areas) + tm_fill(alpha=.3, col = "grey") +
  tm_shape(thiessen) + tm_borders(alpha=.5, col = "black") +
  tm_shape(Quequen) + tm_dots(col = "blue", scale = 0.5)

#Mapa2 de Polígonos de Thiessen#
thiessen.crop <-crop(thiessen, Output.Areas)

tm_shape(Output.Areas) + tm_fill(alpha=.3, col = "grey") +
  tm_shape(thiessen.crop) + tm_borders(alpha=.5, col = "black") +
  tm_shape(Quequen) + tm_dots(col = "blue", scale = 0.5)

#Mapa3 de Polígonos de Thiessen#
windows()
tm_shape(thiessen.crop) + tm_fill(col = "Conductivity", style = "quantile", palette = "Reds") +
  tm_borders(alpha=.3, col = "black") +
  tm_shape(Quequen) + tm_dots(col = "black", scale = 0.5) +
  tm_layout(legend.position = c("left", "bottom"), legend.text.size = 1.05,
            legend.title.size = 1.2, frame = FALSE)

#Mapa de Polígonos de Thiessen rasterizados#

proj4string(dat.pp) <- proj4string(Quequen)

th.clp <- raster::intersect(Output.Areas,thiessen)

windows()
tm_shape(th.clp) + 
  tm_polygons(col="Conductivity", palette="RdBu", auto.palette.mapping=FALSE) +
  tm_legend(legend.outside=TRUE)

#Inverse Distance Weighting (IDW)#

install.packages("gstat")
install.packages("xts")
library(gstat)
library(xts)

grid <- spsample(Quequen, type = 'regular', n = 10000)

idw <- idw(Quequen$Conductivity ~ 1, Quequen, newdata= grid)

idw.output = as.data.frame(idw)
names(idw.output)[1:3] <- c("long", "lat", "prediction")

library(raster)
spg <- idw.output
coordinates(spg) <- ~ long + lat

gridded(spg) <- TRUE
raster_idw <- raster(spg)
projection(raster_idw) <- CRS("+init=EPSG:22195")

windows()
plot(raster_idw)

#enmascarar un raster#
masked_idw <- mask(raster_idw, Output.Areas)

#Mapa1#
windows()
tm_shape(masked_idw) + 
  tm_raster("prediction", palette = "RdBu", style = "quantile", n = 1000, legend.show = F) +
  tm_shape(Output.Areas) + tm_borders(alpha=.5) +
  tm_shape(Quequen) + tm_dots(col = "Conductivity", palette = "Reds", style = "quantile", size = 0.1) +
  tm_layout(legend.position = c("left", "bottom"), legend.text.size = 1.1,
            legend.title.size = 1.4, frame = FALSE)










colnames(mPrecAn) <- c("Year","Jan","Feb","Mar","Abr","May","Jun","Jul","Ago","Sep","Oct","Nov","Dic")

ej <- mPrecAn %>% 
  filter(Year %in% 2000:2018)
kable(ej)

ej <- gather(ej, key = "Months", value = "Precip", -Year)

ggplot(ej, aes(Months, Precip)) + 
  geom_point(aes(color = Year)) +
  stat_smooth(method = "lm", formula =  y ~ x + I(x^2)) +
  scale_x_discrete(limits=ej$Months) +
  theme_bw()






# NMDS --------------------------------------------------------------------

library(vegan)
library(ggplot2)
library(RColorBrewer)

row.names(datos6) <- datos6$Station
datos6[sapply(datos6, is.nan)] <- NA


data.mds <- metaMDS(datos6, distance = "euclidean", autotransform = F, na.rm = T)


# Convertir DMS a DD ------------------------------------------------------

install.packages("parzer")
library(parzer)
library(tidyverse)

coord.dd = coord %>%
  mutate(Lon = parzer::parse_lon(Longitud),
         Lat = parzer::parse_lat(Latitud))

write.csv(coord.dd, file = "coordenadas.csv")


# Boxplot -----------------------------------------------------------------

b1 <- ggplot(
  data = datos3 %>% filter(Conductividad < 2800), 
  aes(x = Sitios, y = Conductividad, fill = Sitios)
  ) +
  geom_boxplot(
    width = 0.4,
    notch = TRUE, 
    outlier.shape = NA, 
    color = "black",
    lwd = 1,
    fill = "darkorchid4",
    alpha = 0.7,
    show.legend = F
    ) + 
  geom_violin(
    fill = "darkorchid4", 
    color = NA, 
    alpha = 0.3,
    position = position_dodge(width = 0.5), size = 1, color = NA,
    trim = F
    ) +
  geom_point(
    shape = 16,
    size = 2,
    position = position_jitterdodge(),
    color = "darkorchid4",
    show.legend = F, 
    alpha = 0.5
  ) +
  labs(
    x = NULL, 
    y = "Conductivity"
    ) + 
  scale_x_discrete(
    labels = NULL
    ) +
  theme_bw()

#Histograma#

p3 <- ggplot (
  datos3 %>% filter(Conductividad < 2800),
  aes(x = Conductividad)
  ) +
  geom_histogram(
    aes(y = ..density..), 
    colour = "#E69F00", 
    fill = "white", 
    size = 0.9
    ) +
  geom_vline(
    aes(xintercept = 1036.734), 
    color = "blue",  
    linetype = "dashed", 
    size = 1, 
    na.rm=TRUE
    ) +
  geom_density(
    colour= "#E69F00", 
    fill="#E69F00",
    alpha=0.6, 
    size = 0.5
    ) +
  labs(
    title="Histograma Conductividad", 
    x = "Conductividad", 
    y = "Densidad"
    ) +
  theme_minimal()

##Regresión Hidrógeno-2 vs Oxígeno-18##

multi.hist(x = reg[,-1], bcol = "gray",
           dcol = c("blue", "red"), 
           dlty = c("dotted", "solid"), lwd=2)


pairs.panels(x = reg[-1], ellipses = F, lm = TRUE, method = "spearman")

ggpairs(
  reg2[,-1],
  lower = list(continuous = wrap("smooth", pch = 16, alpha = 0.3, color = "darkorchid4")),
  diag = list(continuous = wrap("barDiag", color = "white", fill = "#E69F00")), 
  axisLabels = "none",
  title = "Análisis de correlación filtrando la base de datos por conductividad: 609 datos"
  ) +
  theme_bw()

model1 <- lm(data = reg2, X2H ~ X18O)

class(model1)

library(stargazer)
stargazer(
  model1, 
  type = "text", 
  title = "Estadísticos de regresión del modelo", 
  style = "all2",
  single.row = T)

kable(model1, format = "html") %>% 
  kable_styling(bootstrap_options = c("striped", "condensed"),
                position = "left", full_width = F)



# NMDS con ordisurt y ggplot2 ---------------------------------------------

BioR.theme <- theme(
  panel.background = element_blank(),
  panel.border = element_blank(),
  panel.grid = element_blank(),
  axis.line = element_line("gray25"),
  text = element_text(size = 12),
  axis.text = element_text(size = 10, colour = "gray25"),
  axis.title = element_text(size = 14, colour = "gray25"),
  legend.title = element_text(size = 14),
  legend.text = element_text(size = 14),
  legend.key = element_blank())

####Análisis de agrupamiento####

library(ade4)
library(adespatial)
library(vegan)
library(gclus)
library(cluster)
library(pvclust)
library(RColorBrewer)
library(labdsv)
library(rioja)
library(indicspecies)
library(mvpart)
library(MVPARTwrap)
library(dendextend)
library(vegclust)
library(colorspace)
library(agricolae)
library(picante)

dist.euc <- vegdist(
  datos4, "euc"
  )

attr(dist.euc,"labels") <- rownames(datos4) 

isotopes.ward <- hclust(
  dist.euc,
  method = "ward.D2"
  )

library(factoextra)

fviz_dend(
  isotopes.ward,
  cex = 0.2,
  lwd = 0.2,
  k = 4,
  rect = TRUE,
  k_colors = "jco",
  rect_border = "jco",
  rect_fill = TRUE,
  type = "circular"
  )### dendrograma circular###

##cálculo de los valores de niveles de fusión para establecer el corte##

plot(
  isotopes.ward$height,
  nrow(datos4): 2,
  type = "S",
  main = "Niveles de fusión - Ward",
  ylab = "k (número de grupos)",
  xlab = "h (altura del nodo)",
  col = "gray"
)
text(
  isotopes.ward$height,
  nrow(datos4): 2,
  nrow(datos4): 2,
  col = "red",
  cex = 0.5
)


###Número óptimo de grupos###

grpdist <- function(X) {
  require(cluster)
  gr <- as.data.frame(as.factor(X))
  distgr <- daisy(gr, "gower")
  distgr
}


kt <- data.frame(k = 1:nrow(datos4), r = 0)
for (i in 2:(nrow(datos4) - 1)) {
  gr <- cutree(isotopes.ward, i)
  distgr <- grpdist(gr)
  mt <- cor(dist.euc, distgr, method = "pearson")
  kt[i, 2] <- mt
}
k.best <- which.max(kt$r)
plot(
  kt$k,
  kt$r,
  type = "h",
  main = "Matrix correlation-optimal number of clusters",
  xlab = "k (number of clusters)",
  ylab = "Pearson's correlation"
)
axis(
  1,
  k.best,
  paste("optimum", k.best, sep = "\n"),
  col = "red",
  font = 2,
  col.axis = "red"
)
points(k.best,
       max(kt$r),
       pch = 16,
       col = "red",
       cex = 1.5)

###Dendrograma de calor (heat map)###

cluster1 <- reorder.hclust(isotopes.ward, dist.euc)

dend <- as.dendrogram(cluster1)

heatmap(
  as.matrix(dist.euc),
  Rowv = dend,
  symm = TRUE,
  margin = c(3, 3)
)

###Gráfico espacial de los grupos###

cluster2 <- cutree(
  isotopes.ward,
  k = 4
  )

coord <- datos4[,c(2,1)]

namescluster <- names(cluster2[cluster2 == 4])
namescluster <- c(namescluster, "G3483")

coord1 <- coord[namescluster,]


drawmap(xy = coord,
        clusters = cluster2,
        main = "k = 4")

text(coord1, 
     row.names(coord1),
     col = "black",
     cex = 0.5,
     pos = 1)


coord <- coord %>% filter(cluster == 3 | cluster == 4)

ggplot(
    data = coord,
    aes(x = Lod_Longitud_F5, y = Lod_Latitud_F5, color = cluster)
  ) +
geom_point(
    size = 2,
    alpha = 0.5,
    pch = 16
  ) +
  geom_text(
    data = coord %>% filter(cluster == 3 | cluster == 4),
    aes(label = row.names(coord %>% filter(cluster == 3 | cluster == 4))),
    col = "black",
    size = 2.5,
    nudge_y = 0.5,
    check_overlap = T,
  ) +
  labs(
    title = "Análisis de agrupamiento con k =2",
    x = "Longitud (km)",
    y = "Latitud (km)"
  ) +
theme_bw()



