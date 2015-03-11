---
title: Clustering
author: Javier G. Sogo
date: 10 de marzo de 2015 
subtitle: Clasificación no supervisada

---


# Introducción

## Objetivos
Conjunto de casos u objetos, caracterizados por varias variables:

|         | $Var_1$ | $\dots$ | $Var_i$ | $\dots$ | $Var_n$ |
|---------|---------|---------|---------|---------|---------|
| $x_1$   | $x_1^1$ | $\dots$ | $x_i^1$ | $\dots$ | $x_n^1$ |
| $\dots$ | $\dots$ | $\dots$ | $\dots$ | $\dots$ | $\dots$ |
| $x_j$   | $x_1^j$ | $\dots$ | $x_i^j$ | $\dots$ | $x_n^j$ |
| $\dots$ | $\dots$ | $\dots$ | $\dots$ | $\dots$ | $\dots$ |
| $x_N$   | $x_1^N$ | $\dots$ | $x_i^N$ | $\dots$ | $x_n^N$ |

 * Encontrar **conglomerados**/grupos/clusters que emerjan naturalmente de los datos.
 * Los elementos de un grupo son **similares** y pueden ser descritos por características comunes.
 * **Homogeneidad** del grupo y **heterogeneidad** entre grupos.
 * Puede ser considerado un **arte** (¡cuidado!).

<div class="notes">
 - Hay que tener cuidado con todo lo que sea un *arte* en ML, tal es el caso del clustering o de los ensemble-classifier
 y la medida de diversidad. El *arte* suele funcionar, pero no se sabe por qué ni cómo.
</div>

## Ejemplos

### Marketing
 * Segmentación de clientes.
 * Sistemas de recomendación.
 * Publicidad dirigida, ofertas.

### Textos
 * Clasificación en temáticas: *topic modelling*.
 * Recuperación de información.

### Internet
 * Patrones de comportamiento de visitas en web.
 * Clasificación de logs de acceso.


## Tipos de clustering
 * **Jerárquico**: los datos se van agrupando en conjuntos cada vez más numerosos hasta que sólo queda
   uno de ellos que reune a todos los elementos.
 * No jerárquico:
    * **Particional**: los elementos se dividen en un número determinado de grupos (prefijado de antemano)
    * **Probabilista**: un elemento puede pertenecer a varios grupos simultáneamente con distintas probabilidades.


## Interpretación geométrica

\centering{\includegraphics[height=5cm,keepaspectratio]{img/clustering_2d.png}}

\tiny{Clustering en 2 dimensiones: \url{http://en.wikipedia.org/wiki/Cluster_analysis}}
\normalsize{}


### ...pero
 * En general cada observación será un punto en $\Re^n$
 * Visualmente resulta poco claro para $n>2$
 * Se considera una herramienta **exploratoria** para generar hipótesis.

<div class="notes">
 - Relacionado con el **arte**, el clustering sirve como herramienta exploratoria, no contrasta las hipótesis.
</div>


## Resultados

\includegraphics[width=300px]{img/plot_cluster_comparison_11.png}

\tiny{Comparación visual de algunos algoritmos de clustering: \url{http://jaquesgrobler.github.io/Online-Scikit-Learn-stat-tut/modules/clustering.html}}


## Procedimiento

### Pasos
 1. Seleccionar una medida de **distancia**/similaridad adecuada.
 2. Elegir la **técnica** de clustering: jerárquico, no jerárquico.
 3. Elegir el **método/algoritmo** dentro de la técnica.
 4. (Decidir el número de clusters)
 5. **Interpretar** los resultados (en base a qué atributos se ha generado la división)


# Clustering jerárquico

## Tipos de clustering jerárquico

### Ascendente o aglomerativo
 * Paso 1: _N_ clusters (cada elementos es un cluster).
 * Paso 2: _N - 1_ clusters (se unen los dos elementos más próximos).
 * $\dots$
 * Paso N: _1_ cluster con todos los puntos.

### Descendente o divisivo
Es el proceso inverso al *clustering jerárquico ascendente*.


## Distancia entre un elemento y un cluster
El cálculo de la distancia entre un punto y un cluster puede realizarse de diferentes formas:

 * **Enlace simple** o vecino más próximo: mínima distancia entre todos los posibles pares de objectos en ambos clusters:
   $D(C, C') = min_{x \in C, x' \in C'} d(\mathbf{x},\mathbf{x'})$
  
 * **Enlace completo** o vecino más lejano: máxima distancia entre todos los posibles pares.
   $D(C, C') = max_{x \in C, x' \in C'} d(\mathbf{x},\mathbf{x'})$

 * **Enlace medio**: media de las distancias de todos los pares.
   $D(C, C') = \frac{1}{|C||C'|} \sum_{x \in C, x' \in C'} d(\mathbf{x}, \mathbf{x'})$


## Distancia entre un elemento y un cluster
 * **Centroide**: reemplazar cada cluster por su centroide (unitario) y calcular la distancia entre centroides.
   $c^j = \frac{1}{|C|} \sum_{x \in C} x_r^j, \quad r = 1,\dots,n$
   $D(C, C') = d(c, c')$

 * **Ward**: se calcula la suma total de desviaciones de la media de un cluster y trata de minimizarla. **No es una medida de distancia**.


## Dendograma o árbol jerárquico
A       |   B
--------|------------------------------------
 * 2, 10, 5, 8, 9, 1, 4, 3, 6, 7           | ![Dendograma](img/dendrogram_default.png)
 * (2, 10), 5, 8, 9, 1, 4, 3, 6, 7         |
 * (2, 10), (5, 8), 9, 1, 4, 3, 6, 7       |
 * (2, 10), (5, 8), 9, 1, 4, 3, (6, 7)     |
 * (2, 10), (5, 8, 9), 1, 4, 3, (6, 7)     |
 * (2, 10), (5, 8, 9), (1, 4), 3, (6, 7)   |
 * (2, 10, 5, 8, 9), (1, 4), 3, (6, 7)     |
 * (2, 10, 5, 8, 9), (1, 4), (3, 6, 7)     |
 * (2, 10, 5, 8, 9, 1, 4), (3, 6, 7)       |
 * (2, 10, 5, 8, 9, 1, 4, 3, 6, 7)         |



¿Dónde cortar? Se puede utilizar un *scree-plot* distancia-nº clusters
