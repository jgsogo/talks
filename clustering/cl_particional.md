---
title: Clustering
author: Javier G. Sogo
date: 10 de marzo de 2015
subtitle: Clasificación no supervisada

---

# Clustering particional

## Definición del problema

### Problema de optimización
 * **Objetivo**: agrupar $N$ objetos en $k$ clusters disjuntos.
 * ... pero no se conoce el valor de $k$ de antemano.
 * El número de posibles agrupaciones con $N$ objectos en $k$ grupos es (número de Stirling de segunda especie):

\centering{$S(N,k)=\frac{1}{k!} \sum_{i=1}^{k} (-1)^{k-i}  \binom{k}{i} i^N$}

\tiny{Número de Stirling de segunda especie: \url{http://en.wikipedia.org/wiki/Stirling_numbers_of_the_second_kind}}
\normalsize{}

 * El problema del clustering será minimizar la función $J$ donde $\mu_i$ representa al prototipo de cada cluster y $r_{ij}$
   es una variable que vale $1$ si $x_j$ es asignado al cluster $i$ y vale $0$ en otro caso:

\centering{$min_{r_{ij}, \mu_{i}} J = \sum_{j=1}^{N} \sum_{i=1}^{k} r_{ij} \|x_j - \mu_i\|^2$}


## Definición del problema

### Complejidad de $S(N,k)$
Posibilidades (eje Y) con $N=5,10,15,\dots,50$ objetos (sobre la curva) en $k=1,2,\dots$ clusters (eje X):
\centering{\includegraphics[height=150px]{img/stirling2.png}}

## Procedimiento

### Pasos
 1. Seleccionar ***k*** semillas iniciales (centroides/prototipos).
 1. Asignar cada objeto al cluster más cercano.
 1. Actualizar los prototipos.
 1. Repetir hasta convergencia.

### Criterios
 * Cómo seleccionar las semillas iniciales
 * Cómo actualizar los prototipos

## Procedimiento

### Paso 1: Selección de las semillas iniciales
 * Al azar
 * Los primero $k$ objetos
 * Basadas en conocimiento previo (experto)
 * Heurística que busque elementos lo más alejados posible
 * Primera semilla al azar, la segunda debe estar alejada una distancia data, etc...

### Paso 2: Asignación al cluster más cercano
 * Elección de la medida de distancia

## Procedimiento

### Paso 3: Actualización de los prototipos
 * **Forgy (1965)**: una vez que se han asignado todos los objetos a un cluster, actualizar los centroides y recalcular.
 * **MacQueen (1967)**: recalcular los centroides cada vez que se asigna un objeto (del que provenía y al que va ahora)
 * Otros: asignar los objetos intentando minimizar algún criterio estadístico (varianza dentro del cluster).

### Paso 4: Convergencia
Continuar hasta que los centroides no se muevan

## Ejemplos

### Forgy
\centering{\includegraphics[height=150px]{img/forgy.png}}

## Ejemplo

### k-medias - Segmentación de imágenes (Bishop, 2006)
\centering{\includegraphics[height=150px]{img/bishop.png}}

