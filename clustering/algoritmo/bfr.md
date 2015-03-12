---
title: "Clustering: Algoritmo BFR"
author: Javier G. Sogo
date: 10 de marzo de 2015
subtitle: Clasificación no supervisada

---


# Algoritmo: BFR

## BFR

### Algoritmo Bradley-Fayyad-Reina (BFR)
 * Es una variante de k-medias para conjuntos de datos muy grandes.
 * No es un algoritmo de cluster probabilista puesto que asigna los puntos a un único cluster, aunque puede utilizarse
   su salida de forma probabilista.
 * Asume que cada cluster se distribuye según una normal (gaussian) en torno a un centroide en un espacio euclideo.

\centering{\includegraphics[height=100px]{img/gauds.png}}

 Probabilidad de encontrar un punto en un cluster a cierta distancia (según cada dimensión) de un centroide.

## BFR: Pros and cons

### Limitaciones
 * Asume sólo una distribución normal.
 * Las distribuciones están alineadas según los ejes definidos por las dimensiones.

\centering{\includegraphics[height=100px]{img/bfr_limit.png}}

### Ventajas
 * La mayoría de los puntos se resumen estadísticamente (una única lectura de los datos).


## BFR: Tipos de puntos

### Tipos de puntos
 * A medida que se leen los datos estos son incorporados a un conjunto:
    * **Discard set** (DS): puntos que están suficientemente cerca de un centroide y se incorporar a él.
    * **Compression set** (CS): grupos de puntos que están próximos entre sí, pero no están cerca de ningún centroide.
      También se resumen en términos estadísticos.
    * **Retained set** (RS): puntos aislados a la espera de ser asignados a un *compression set*.

\centering{\includegraphics[height=100px]{img/bfr_galaxy.png}}


## BFR: Cluster

### Cómo resumir un conjunto de puntos
Cada cluster (*discard set*) se resume utilizando las siguientes variables:

 * Número de puntos, $N$
 * Vector $SUM$ cuya i-ésima componente se corresponde con la suma de la i-ésima componente de cada punto.
 * Vector $SUMSQ$, su i-ésima componente es la suma de los cuadrados de la i-ésima componente de cada punto.

A medida que nuevos puntos son incorporados al cluster, se actualizan estos valores.

### Estadísticos
 * Centroide: puede calcular como

\centering{$c_i = \frac{SUM_i}{N} \quad i=1,\dots,d$}

 * Varianza:

\centering{$var_i = \frac{SUMSQ_i}{N} - \frac{SUM_i}{N}^2$}

\centering{$\sigma_i = \sqrt{var_i}$}


## BFR: Paso a paso

### Para cada *subset* de datos
 * Los puntos que están ***"suficientemente cerca"*** de un centroide:
    1. Se añaden al cluster correspondiente.
    1. Se descartan.
 * El resto de puntos son tratados por un algoritmo **en memoria**:
    * Los clusters irán al *compression set* (resumido también por sus estadísticos)
    * Los *outliers* se mantienen en el *retained set* (RS)

### Última iteración
 * Los puntos del *retained set* son asignados al cluster más cercano.
 * Considerar la unión de varios *compressed sets*.


## BFR: Cómo evaluar el "suficientemente cerca".
### Mahalanobis distance
 * Si el cluster $C$ tiene como centroide $(c_1,\dots,c_d)$ y desviación estándar $(\sigma_i,\dots,\sigma_d)$
 * Estamos considerando el punto $P=(x_1,\dots,x_d)$
 * La distancia normalizada según la dimensión $i$ será:

\centering{$d_i = \frac{x_i - c_i}{\sigma_i}$}

 * Distancia Mahalanobis:

\centering{$MD = \sqrt{\sum_{i=1}^d y_i^2}$}

## BFR: Cómo evaluar el "suficientemente cerca".

### Criterio de aceptación Mahalanobis
 * Un punto que esté a una *desviación estándar* del centroide en cada dimensión tendrá $MD = \sqrt{d}$.

\centering{\includegraphics[height=100px]{img/gauds.png}}

 * Según la distribución normal:
    * 68% de los puntos tienen $MD \le \sqrt{d}$
    * 95% de los puntos tienen $MD \le 2\sqrt{d}$
    * 99% de los puntos tienen $MD \le 3\sqrt{d}$

Aceptar en un cluster todos los puntos cuya $MD$ sera menor que un umbral seleccionado, p.ej. $3\sqrt{d}$


## BFR: Cómo decidir si dos CS deben ser combinados

### Combinación de dos clusters del CS
 * Calcular la varianza del cluster combinado: ¡muy rápido puesto que tenemos las variables $N$, $SUM$ y $SUMSQ$ de cada uno!
 * Combinarlos si la varianza del cluster combinado está por debajo de un límite.

