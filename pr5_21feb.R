#Practica 5.
#Manuel Tristán Martín Ruiz

#Ej.1
set.seed(123)

n_registros <- 200

yacimientos <- sample(paste0("Site", 1:10),n_registros, replace = TRUE)
tipo_artefactos <- sample(c("Pottery","Tools","Jewerly","Weapons"), n_registros, replace = TRUE)
numero_artefactos <- sample(1:1000, n_registros, replace = TRUE)
contexto <- sample(c("Habitacional","Funerario","Otros"), n_registros, replace = TRUE)
latitud <- sample(0:90, n_registros, replace = TRUE)
longitud <- sample(-180:180, n_registros, replace = TRUE)

datos_arqueologicos <- data.frame(
  yacimientos = yacimientos,
  tipo_artefactos = tipo_artefactos,
  numero_artefactos = numero_artefactos,
  contexto = contexto,
  latitud = latitud,
  longitud =longitud
)
print(datos_arqueologicos)
View(datos_arqueologicos)

#Ej.2
media_numero_artefactos <- mean(datos_arqueologicos$numero_artefactos)
print(media_numero_artefactos)

primer_cuartil <- quantile(datos_arqueologicos$numero_artefactos, probs = 0.25)
print(primer_cuartil)
segundo_cuartil <- quantile(datos_arqueologicos$numero_artefactos, probs = 0.5)
print(segundo_cuartil)
tercer_cuartil <- quantile(datos_arqueologicos$numero_artefactos, probs = 0.75)
print(tercer_cuartil)
cuarto_cuartil <- quantile(datos_arqueologicos$numero_artefactos, probs = 1)
print(cuarto_cuartil)

#Ej.3
hist(datos_arqueologicos$numero_artefactos)
mean(datos_arqueologicos$numero_artefactos)
median(datos_arqueologicos$numero_artefactos)
#Al ser la media y la mediana iguales, hablamos de una distribución de frecuencias simétrica o normal. 

#Ej.4
library(ggplot2)
boxplot(datos_arqueologicos$numero_artefactos)
#Los cuantiles antes calculados Q1, Q2, Q3 y Q4 muestran que estamos ante una distribución simétrica, distibuidos grosso modo, un cuarto de los datos por debajo del 25%, un cuarto de los datos por encima del 75% y la mitad de los datos entre Q1 y Q2

#Ej.5 Sin terminar. 
datos_arqueologicos$yacimientos <- factor(datos_arqueologicos$yacimientos, levels = paste0("Site", 1:10))
agregado_num_arte_yacimiento <- aggregate(numero_artefactos ~ yacimientos, data = datos_arqueologicos, FUN = mean)
max_agregado_num_artefactos 

barplot(table(datos_arqueologicos$numero_artefactos,datos_arqueologicos$yacimientos), main = "Número medio de artefactos")

#Ej.6
ggplot(datos_arqueologicos, aes(x = longitud, y = latitud)) +
  geom_bin2d() +
  labs(title = "Mapa de calor de artefactos", x = "Longitud", y = "Latitud")

#Ej.7
artefactos_totales <- sum(datos_arqueologicos$numero_artefactos)
print(artefactos_totales)

#Ej.8
mediana_artefactos <- median(datos_arqueologicos$numero_artefactos)
print(mediana_artefactos)

#Ej.9
desviacion_estandar_artefactos <- sd(datos_arqueologicos$numero_artefactos)
print(desviacion_estandar_artefactos)

#Ej.10
which.max(datos_arqueologicos$numero_artefactos)

#Ej.11
tabla_resumen <- data.frame(
  media = media_numero_artefactos,
  mediana = mediana_artefactos,
  desviacion_estandar = desviacion_estandar_artefactos
)
print(tabla_resumen)
View(tabla_resumen)

#Ej.12
boxplot(numero_artefactos~yacimientos,  
        main = "Artefactos por yacimiento", 
        xlab = "Yacimientos", 
        ylab = "Número de artefactos")

