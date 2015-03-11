
# Clustering probabilista

## Introducción

### Hipótesis
 * Los datos provienen de una **mixtura de $k$ distribuciones** de probabilidad, una para cada cluster.
 * Cada distribución da la probabilidad de que un objeto pertenezca a un cluster (**soft clustering**).
 * Obviamente cada objeto en realidad pertenece a un único cluster, pero **no podemos saber a cual**.

### Objetivo
 * Encontrar el conjunto de distribuciones más probable dados los datos.


## Introducción
### Ejemplo: Mixtura de Gaussianas (una variable)
\centering{\includegraphics[height=150px]{img/gaussians.png}}

## Introducción
### Ejemplo: Mixtura de Gaussianas (dos variables)
\centering{\includegraphics[height=150px]{img/gaussians2.png}}


...pero en el caso general tenemos $n$ variables (dimensiones) y podemos utilizar $k$ clusters.


## Modelo

### Mixtura de Gaussianas
 * **Combinación lineal de $k$ gaussianas**:

\centering{$ f(x) = \sum_{i=1}^k \pi_i \mathcal{N} (\mathbf{x}|\mathbf{\mu_i}, \mathbf{\Sigma_i})$}

 * Los parámetros del modelo serán $\pi_i$, $\mu_i$, $\Sigma_i \quad i=1,\dots,k$, y los podemos estimar
   por **máxima verosimilitud** ==> métodos numéricos iterativos o **algoritmo EM**.
 * El algoritmo EM no garantiza encontrar el óptimo global, así que habrá que repetir con distintas inicializaciones
   y tomar la mejor.


## Mixtura de Gaussianas
\centering{\includegraphics[height=200px]{img/gaussian_mixture.png}}


