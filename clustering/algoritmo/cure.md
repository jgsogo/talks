---
title: "Clustering: Algoritmo CURE"
author: Javier G. Sogo
date: 10 de marzo de 2015
subtitle: Clasificación no supervisada

---


# Algoritmo: CURE

## CURE

### Algoritmo CURE (Clustering Using REpresentatives)
 * Asume distancia **euclidea**.
 * Los clusters pueden adoptar cualquier forma.
 * Utiliza un conjunto de **puntos representativos** de cada cluster.

\centering{\includegraphics[height=100px]{img/cure.png}}


## CURE: Paso a paso

### Primera pasada (de dos)
 * Obtener una muestra aleatoria de los datos que entre en memoria.
 * Utilizar un algoritmo de cluster jerárquico para generar los clusters iniciales
 * Escoger los **puntos representativos**:
    * Dentro de cada cluster escoger $r$ (ej. 4) puntos representativos tan dispersos como sea posible.
    * Mover cada punto un porcentaje (ej. 20%) hacia el centroide del cluster.


## CURE: Paso a paso

### Segunda pasada (de dos)
 * Volver a evaluar cada punto situándolo en el cluster más cercano:
    * Distancia: cluster que tenga un punto representativo más próximo.
 * *Et voilá*.


