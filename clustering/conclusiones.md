---
title: Clustering
author: Javier G. Sogo
date: 10 de marzo de 2015
subtitle: Clasificación no supervisada

---

# Conclusiones

## Técnica: ¿jerárquico o particional?

### Jerárquico
 * No requiere la elección de semillas iniciales.
 * El dendograma puede ser muy útil.
 * No permite reasignaciones.
 * Sensible a la medida de distancia elegida.

### No jerárquico
 * **Muy sensible** a las semillas iniciales.
 * Buena opción: tomar como entrada la solución del jerárquico.


## Método

### Consideraciones
 * Ruido en los datos.
 * Usar varios métodos y comparar
 * El cluster jerárquico tiene **efecto encadenamiento** (meterse en clusters que ya existen, más que agruparse en nuevos)
    * grave si ocurre al principio
    * el enlace simple es muy susceptible a este ¿problema?

\centering{\includegraphics[height=80px]{img/linkage.png}}

 * el enlace completo (y Ward) identifica clusters compactos y está menos afectado por outliers que el enlace simple.


## Método

### k-medias
 * Funciona bien cuando los clusters son compactos y bien separados (hiperesferas).
 * Es fácil asignar nuevos objectos a los clusters existentes (el espacio queda particionado en polígonos de Thiessen).
 * Sensible a la **escala**, ruido y **outliers**.
 * Utilizar una **estrategia** multicomienzo y escoger la que minimiza $J$.

\centering{\includegraphics[width=200px]{img/cluster_mouse.png}}

## Medida de distancia

### Distancia de Minkowski

\centering{$d(\mathbf{x}, \mathbf{x'}) = (\sum_{r=1}^n |x_r - x'_r|^p)^{1/p}$}

 * Distancia **euclídea** para $p=2$, **Manhattan** para $p=1$, Tchebychev o norma del supremo para $p=\infty$

### Problema
 * Las **unidades** de medida influyen en el resultado del clustering (la variable con mayores unidades es dominante)
 * Soluciones:
    * Medir cada variable en escalas comparables
    * Estandarizar los datos
    * Usar una medida de distancia que elimina este problema: **Mahalanobis**

\centering{$d(\mathbf{x}, \mathbf{x'}) = ((\mathbf{x} - \mathbf{x'})^T \Sigma^{-1} (\mathbf{x} - \mathbf{x'}))^{1/2} $}

$\Sigma$ es la matriz varianza-covarianza

## Medida de distancia

### Datos cualitativos
 * **Datos cualitativos**: sustituir el concepto de distancia por el de **similitud**.
    * ¿Se puede calcular un centroide? Hablar de prototipos
    * Edit-distance, correlación, coseno del ángulo, información mutua, *ad-hoc* para el problema,...


## Resultados

### Evaluación
 * Valor de la función $J$ que tratábamos de minimizar.
 * Distancias grandes entre centroides.
 * Validación externa (auditor, analista,...)
 * Evaluar los clusters respecto a cada variable. Eliminar alguna variable y repetir el análisis.

### Interpretación de la solución
 * Etiquetar los clusters utilizando sus centroides.
 * Si los centroides son muy distintos en cierta variable, se puede utilizar ésta para etiquetar.
