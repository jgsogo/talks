---
title: "Clustering: Algoritmo k-medias"
author: Javier G. Sogo
date: 10 de marzo de 2015
subtitle: Clasificación no supervisada

---


# Algoritmo: K-medias


## K-medias

### Inicialización
 * Seleccionar una medida de distancia.
 * Seleccionar un método para medir la distancia entre clusters (simple, completo, media,...).
 * Seleccionar el número de clusters $k$
 * Inicializar los clusters escogiendo un punto para cada uno de ellos.


## K-medias

### Algoritmo paso a paso
 1. Para cada punto, calcular la distancia a los clusters y asignarlo a aquél más próximo.
 2. Una vez que todos los puntos han sido asignados, actualizar los centroides de los $k$ clusters.
 3. Reasignar todos los puntos al cluster más cercano.

 * Repetir los pasos **2** y **3** hasta lograr la convergencia (los puntos no cambian de cluster y los centroides no se mueven).

## K-medias: paso a paso
Iteracion #1

\centering{\includegraphics[height=100px]{img/kmeans1.png}}

## K-medias: paso a paso
Iteracion #2

\centering{\includegraphics[height=100px]{img/kmeans2.png}}

## K-medias: paso a paso
Iteracion #3

\centering{\includegraphics[height=100px]{img/kmeans3.png}}


## K-medias: selección de $k$
### Cómo seleccionar $k$
 * Sabemos *a priori* en cuántas clases se dividen los datos.
 * Probar diferentes valores de $k$ registrando el cambio de la distancia media a los centroides a medida que se modifica $k$.


## K-medias: selección de $k$
### $k=2$
 * Pocos centroides, las distancias son grandes.

\centering{\includegraphics[height=150px]{img/kdistance1.png}}


## K-medias: selección de $k$
### $k=3$
 * Tiene buena pinta, los clusters parecen compactos.

\centering{\includegraphics[height=150px]{img/kdistance2.png}}


## K-medias: selección de $k$
### $k=4$
 * Demasiados clusters, hemos mejorado poco con respecto a $k=2$

\centering{\includegraphics[height=150px]{img/kdistance3.png}}


## K-medias: selección de $k$
### Criterio para seleccionar $k$
 * La distancia media a los centroides se estabiliza a medida que aumenta $k$.

\centering{\includegraphics[height=150px]{img/k_distance.png}}


## K-medias: inicialización de los clusters
### Criterio para seleccionar los $k$ puntos iniciales
 1. Opción 1: **Muestreo**
     1. Ejecutar un clustering jerárquico sobre una muestra de los datos para obtener $k$ clusters.
     1. Seleccionar un punto de cada cluster (ej. el más próximo al centroide)
     1. (La muestra entra en memoria)

 1. Opción 2: **Dispersión**
     1. Elegir un punto aleatoriamente.
     1. Elegir el siguiente punto de tal forma que la mínima distancia a los *puntos ya seleccionados* sea la máxima posible.
     1. Repetir el proceso hasta tener $k$ puntos.


## K-medias: complejidad

### Complejidad
 * En cada iteración examinamos cada punto una vez para encontrar el centroide más próximo.
 * Cada iteración es $O(kN)$ con $N$ puntos y $k$ clusters.
 * ...pero el número de iteraciones hasta converger puede ser muy elevado.
