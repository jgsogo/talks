---
title: Clustering
author: Javier G. Sogo
date: 10 de marzo de 2015
subtitle: Clasificación no supervisada

---

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

 * **Enlace simple** o vecino más próximo: mínima distancia entre todos los posibles pares de objetos en ambos clusters:
   $D(C, C') = min_{x \in C, x' \in C'} d(\mathbf{x},\mathbf{x'})$

 * **Enlace completo** o vecino más lejano: máxima distancia entre todos los posibles pares.
   $D(C, C') = max_{x \in C, x' \in C'} d(\mathbf{x},\mathbf{x'})$

 * **Enlace medio**: media de las distancias de todos los pares.
   $D(C, C') = \frac{1}{|C||C'|} \sum_{x \in C, x' \in C'} d(\mathbf{x}, \mathbf{x'})$

\centering{\includegraphics[width=300px]{img/distancias.png}}


## Distancia entre un elemento y un cluster
 * **Centroide**: reemplazar cada cluster por su centroide (unitario) y calcular la distancia entre centroides.
   $c^j = \frac{1}{|C|} \sum_{x \in C} x_r^j, \quad r = 1,\dots,n$
   $D(C, C') = d(c, c')$

 * **Ward**: se calcula la suma total de desviaciones de la media de un cluster y trata de minimizarla.
   **No es una medida de distancia**.

### Nota
**Problema**: en algunos conjuntos de datos no es posible calcular el centroide (variables categóricas), entonces habrá que
utilizar **prototipos**, elementos más próximos al *valor medio*.

## Dendograma o árbol jerárquico

\begin{table}
    \begin{tabular}{ c  p{6cm}  }
        \raisebox{-\totalheight}{\includegraphics[width=0.5\textwidth, height=60mm]{img/dendrogram_default.png}}
        &
        \begin{itemize}
            \item 2, 10, 5, 8, 9, 1, 4, 3, 6, 7
            \item (2, 10), 5, 8, 9, 1, 4, 3, 6, 7
            \item (2, 10), (5, 8), 9, 1, 4, 3, 6, 7
            \item (2, 10), (5, 8), 9, 1, 4, 3, (6, 7)
            \item (2, 10), (5, 8, 9), 1, 4, 3, (6, 7)
            \item (2, 10), (5, 8, 9), (1, 4), 3, (6, 7)
            \item (2, 10, 5, 8, 9), (1, 4), 3, (6, 7)
            \item (2, 10, 5, 8, 9), (1, 4), (3, 6, 7)
            \item (2, 10, 5, 8, 9, 1, 4), (3, 6, 7)
            \item (2, 10, 5, 8, 9, 1, 4, 3, 6, 7)
        \end{itemize}
    \end{tabular}
\end{table}

## ¿Dónde cortar?

\centering{\includegraphics[width=300px]{img/distance_vs_clusters.png}}
