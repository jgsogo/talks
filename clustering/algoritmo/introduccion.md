---
title: "Clustering: Algoritmos"
author: Javier G. Sogo
date: 10 de marzo de 2015
subtitle: Clasificación no supervisada

---

# Introducción

## Acotar el problema

### Complejidad del algoritmo
 * Implementación näive de clustering jerárquico: $O(N^3)$
 * Una implementación mejor puede llegar a $O(N^2logN)$

### Tamaño del problema
 * ¿Podemos cargar todos los datos en memoria?
 * ¿Es crítico el tiempo de ejecución del algoritmo?


## Introducción

### Medida de distancia
 * Depende del número de dimensiones $d$ y de los valores que puedan tomar. Ejs.:
    * Documento como conjunto de palabras --> distancia **Jaccard**
    * Documento como punto $\mathbf{x}=(x_1,\dots,x_d)$ donde $x_i=1$ si el documento contiene la palabra $i$ --> distancia **Euclidea**
    * Documento como vector en un *espacio de palabras* --> distancia **coseno**.
 * Cuando hay muchas dimensiones $d$ todos los puntos están cerca.
 * Atención a la escala de las variables (standarizar o distancia **Mahalanobis**).


## Cuándo detener el algoritmo

### Clúster jerárquico
 * Elegir un número $k$ de clases *a priori* y detener el algoritmo cuando se alcance ese número.
 * Medir la **cohesión** del cluster:
   * **Diámetro**: máxima distancia entre dos puntos del cluster.
   * **Radio**: máxima distancia de un punto al centroide.
   * Basarse en la **densidad**: número de puntos por unidad de volumen (utilizar radio o diámetro).

### Clúster particional
 * Criterio de **convergencia**: detener el algoritmos cuando los puntos no se muevan entre clusters y los centroides no cambien.

## Introducción

### A tener en cuenta
 * Cómo tratar attributos no numéricos.
 * Cómo tratar valores no disponibles: imputación.
