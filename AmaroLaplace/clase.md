## Formación del sistema de ecuaciones

% tal vez está parte pueda ser escrita de dos formas.
% en una de ellas se puede hablar del operador en forma
% matricial y de otra forma se puede hablar como un sistema
% de ecuaciones que son similares.

El problema de Dirichlet que está definido en la frontera
nos permite definir un \emph{sistema de ecuaciones}.

Ejercicio. Escribir la forma del operador de Laplace,
Laplaciano, utilizando la aproximación para-adelante de la
derivada.

Ejercicio __muy importante__. Imaginando un $\bar{\Omega}$
como el del dibujo siguiente, escribe la forma del operador de Laplace
__en tu cuarderno__, en donde $*$ son puntos de $\partial\Omega$ y
$o$ son del $\Omega$.

![geometría](geometria.png)

Ejercicio __muy importante__. `Julia` es más eficiente
si se utiliza un único índice para acceder a los elementos
de una matriz. Escribe una función que traduzca un par de
índices $i,j$ a un único índice $k$ para cade elemento de
una matriz. % tal vez aquí tengan problemas dependiendo el
% tipo de la matriz

El operador laplaciano en dos dimensiones es igual a

$$
-\Bigl(\frac{\partial^2}{\partial x^2}\frac{\partial^2}{\partial y^2}\Bigr)
$$
## Solución de ecuaciones de segundo orden con condiciones a la frontera.

__Ejercicio__. Utiliza la aproximación por diferencias finitas
de la _segunda derivada_, escribe la aproximación por
diferencias finitas del _laplaciano_.

http://users.dsic.upv.es/asignaturas/eui/cnu/libro/tema8/tema84.htm


### Ejemplo 


Para una malla de 5 por 6 resolver la ecuación de Laplace utilizando las condiciones  a la frontera siguiente: en la parte superior, toma los valores
$\{0, 70.7107, 100., 70.7107, 0\}$ y en el resto de bordes es cero. El sistema
de ecuaciones es el siguiente


\begin{align*}
-4 f_{2,2}+f_{2,3}+f_{3,2}=0,\\f_{2,2}-4 f_{2,3}+f_{2,4}+f_{3,3}=0,\\f_{2,3}-4 f_{2,4}+f_{2,5}+f_{3,4}=0,\\f_{2,4}-4
   f_{2,5}+f_{2,6}+f_{3,5}=0,\\f_{2,5}-4 f_{2,6}+f_{3,6}+70.7107=0,\\f_{2,2}-4 f_{3,2}+f_{3,3}+f_{4,2}=0,\\f_{2,3}+f_{3,2}-4
   f_{3,3}+f_{3,4}+f_{4,3}=0,\\f_{2,4}+f_{3,3}-4 f_{3,4}+f_{3,5}+f_{4,4}=0,\\f_{2,5}+f_{3,4}-4 f_{3,5}+f_{3,6}+f_{4,5}=0,\\f_{2,6}+f_{3,5}-4
   f_{3,6}+f_{4,6}+100.=0,\\f_{3,2}-4 f_{4,2}+f_{4,3}=0,\\f_{3,3}+f_{4,2}-4 f_{4,3}+f_{4,4}=0,\\f_{3,4}+f_{4,3}-4 f_{4,4}+f_{4,5}=0,\\f_{3,5}+f_{4,4}-4
   f_{4,5}+f_{4,6}=0,\\f_{3,6}+f_{4,5}-4 f_{4,6}+70.7107=0.
\end{align*}

El sistema de ecuaciones resultante es $A x = b$ con $A$ igual a la siguiente matriz

$$
\left(
\begin{array}{ccccccccccccccc}
 -4. & 1. & 0 & 0 & 0 & 1. & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 \\
 1. & -4. & 1. & 0 & 0 & 0 & 1. & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 \\
 0 & 1. & -4. & 1. & 0 & 0 & 0 & 1. & 0 & 0 & 0 & 0 & 0 & 0 & 0 \\
 0 & 0 & 1. & -4. & 1. & 0 & 0 & 0 & 1. & 0 & 0 & 0 & 0 & 0 & 0 \\
 0 & 0 & 0 & 1. & -4. & 0 & 0 & 0 & 0 & 1. & 0 & 0 & 0 & 0 & 0 \\
 1. & 0 & 0 & 0 & 0 & -4. & 1. & 0 & 0 & 0 & 1. & 0 & 0 & 0 & 0 \\
 0 & 1. & 0 & 0 & 0 & 1. & -4. & 1. & 0 & 0 & 0 & 1. & 0 & 0 & 0 \\
 0 & 0 & 1. & 0 & 0 & 0 & 1. & -4. & 1. & 0 & 0 & 0 & 1. & 0 & 0 \\
 0 & 0 & 0 & 1. & 0 & 0 & 0 & 1. & -4. & 1. & 0 & 0 & 0 & 1. & 0 \\
 0 & 0 & 0 & 0 & 1. & 0 & 0 & 0 & 1. & -4. & 0 & 0 & 0 & 0 & 1. \\
 0 & 0 & 0 & 0 & 0 & 1. & 0 & 0 & 0 & 0 & -4. & 1. & 0 & 0 & 0 \\
 0 & 0 & 0 & 0 & 0 & 0 & 1. & 0 & 0 & 0 & 1. & -4. & 1. & 0 & 0 \\
 0 & 0 & 0 & 0 & 0 & 0 & 0 & 1. & 0 & 0 & 0 & 1. & -4. & 1. & 0 \\
 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 1. & 0 & 0 & 0 & 1. & -4. & 1. \\
 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 1. & 0 & 0 & 0 & 1. & -4. \\
\end{array}
\right)
$$
y $b$ de la forma

$$
(0.,0.,0.,0.,70.7107,0.,0.,0.,0.,100.,0.,0.,0.,0.,70.7107)^T.
$$

La solución, $x$, de ese sistema de ecuaciones tiene la forma

![Solución de la tabla](solucionTabla.png)

__Ejercicio condiciones a la frontera de Dirichlet__. Escribe la aproximación en diferencias finitas de 
la segunda derivada de una función $f(x)$ y resuelve el sistema de ecuaciones resultante
de considerar $x \in [0,1]$ con $f(0) = a$ y $f(1) = b$ dividiendo el intervalo $[0,1]$ 
en $5$ puntos.

__Ejercicio condiciones a la frontera de Neumann__. Si se te pidiera resolver el problema anterior, salvo que ahora se te indique que $f'(1) = b$ utilizando la aproximación de la derivada por diferencias finitas es necesario realizar el siguiente procedimiento. Supongamos que es necesario tomar en cuenta $f'(x_n) = t$, entonces utilizando la aproximación

$$
f'(x_n) = \frac{f(x_{n+1}-f(x_{n-1}))}{h}
$$
se despeja para $f(x_{n+1}) = f(x_{n-1}) + 2hf'(x_n)$. Sustituye este valor
en la ecuación de Laplace aproximada y se obtiene un sistema de ecuaciones. 
Resuélvelo para encontrar la solución.

## Método iterativo (Gauss-Seidel) para resolver

Dado que lo que se quiere resolver es un sistema de ecuaciones no es raro que
un método para resolver la ecuación de Laplace provenga de esa área.
Llanamente, el método consiste en dar una _adivinanza_ de la solución tras lo
cual se mejora una entrada de la adivinanza utilizando información del sistema
de ecuaciones. A continuación, se mejora la siguiente entrada de la adivinanza
utilizando el valor que se optimizó en el paso anterior.

El sistema que se obtiene al utilizar diferencias finitas es de la forma
$$
\mathbf{A} \mathbf{x} = \mathbf{b},
$$

De esta manera si denotamos las entradas de la matriz $\mathbf{A}$ por $a_{i,j}$ se tiene que
$$
\sum_i a_{i,j} x_i = b_j,
$$
separando la primer entrada de $\mathbf{x}$, es decir, $x_1$ se tiene

$$
\sum_{i=2} a_{i,j} x_i + a_{1,j} x_1 = b_j,
$$
despejando

y en general
$$
 x_l =a_{l,j}^{-1}\bigl( b_j-\sum_{i\neq l} a_{i,j} x_i\bigr),
$$

En forma matricial esto puede ser escrito separando a $\mathbf{A}$ en tres partes:
$\mathbf{A} = D + T_s + T_i$ en donde $D$ es la __diagonal__ de $\mathbf{A}$
y $T_s$ y $T_i$ son las matrices __triangular superior__ y __triangular inferior__, respectivamente, de $\mathbf{A}$.

__Ejercicio__ Escribe una función que genere una matriz aleatoria y te devuelva
las partes de la matriz como se indicó en el párrafo anterior.

De aquí, se puede promover una solución iterativa de la siguiente forma

$$
\mathbf{x}^{k+1} = D^{-1}\bigl(-(T_s + T_i)\mathbf{x}^k + \mathbf{b}\bigr).
$$

En caso de que el lector esté poniendo atención, se podrá dar cuenta que el valor 
de $x_i$ ya se encuentra _actualizado_ cuando se calcula el valor de $x_{i+1}$. Esto se puede comprobar al verificar la validez de la siguiente expresión:

$$
x^{(k+1)}_i  = \frac{1}{a_{ii}} \left(b_i - \sum_{j=1}^{i-1}a_{i,j}x^{(k+1)}_j - \sum_{j=i+1}^{n}a_{i,j}x^{(k)}_j \right)
$$

Esta ecuación puede ser escrita __matricialmente__ si $\mathbf{A}$ es descompuesta de la siguiente forma: $\mathbf{A} = T_i + \tilde{T_s}$ en donde $\tilde{T_i}$ es la matriz triangular inferior y $\tilde{T_s}$ es la matriz triangular superior _junto con la diagonal de_ $\mathbf{A}$.

__Ejercicio__ escribe una función que lleve a cabo la descomposición indicada arriba.
$$
\mathbf{x}^{k+1} = \tilde{T_s}^{-1}\bigl(b-T_i \mathbf{x}^k\bigr).
$$

## Diagonalización de una matriz triangular inferior.
