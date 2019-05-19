# Aprendizaje automático

## Definición

Samuel 1959:

Estudia algoritmos para que la computadora aprenda a resolver problemas a partir de un set de datos sin necesidad de programarción específica.

Mitchel 1998:

Un programa de computadora aprende una experiencia E con respecto a una clase de tareas T y una medida de performance P, si su performance en las tareas T, medidas por P, mejoran la experiencia E.

### Ejemplos:

* Extracción de información
* Detección de promotores (ADN)
* Minería de datos
* Autos autónomos
* Reconocimiento de escritura
* Procesamiento del lenguaje natural
* Procesamiento de la visión
* Sistemas de recomendación
* Reconocimiento del habla
* Prediccion de tiempo de viaje
* Detección de fraude
* Publicidad on line

#### Juego de Go:
* Tarea T: juegar al go
* Medida de performance P: probabilidad de que el programa gane el siguiente partido.
* Experiencia E: la experiencia de jugar muchos jiuegos de go.

### Tipos de AA

* Supervisado.
* No supervisado.
* Aprendizaje por refuerzos.
  
#### Supervisado
Problemas de regresión. de clasificación.  
Input del algoritmo: set de datos y sus respectivas respuestas.  
Tarea del algoritmo: producir nuevas respuestas.  
Salida: contínua, numérica, discreta.
  
#### No supervisado
Clustering, detección de patrones, reducción de la dimensionalidad.
  
#### Por refuerzos
Juegos de mesa, robots autónomos (secuencia de acciones).  
Premios y castigos en función de satisfacción del objetivo.  
Con agentes autónomos (sensores) para elegir acciones óptimas que le permitan lograr sus objetivos.

## Disponibilidad de datos

Big data, footprint.

#### Datos

* Estructurados:
  * Numéricos.
  * Ordinales (tienen orden).
  * Categóricos (sin orden).
* No estructurados.
* Semiestructurados.

### Calidad de los datos

Definición es subjetiva. Un dato o conjunto de datos X es de mayor (o mejor) calidad que otro conjunto de datos si el primero satisface las necesidades del usuario mejor que el segundo.

#### Consucuencias de los malos datos

* Descreimiento.
* Insatisfacción de los clientes.
* Costos innecesarios.
* Impacto en la toma de decisiones.

#### Dependen de
* Calidad del software.
* Definición de procesos asociados a los datos.
* Diseño de base de datos
* Capacitación.

Se quiere **datos consistentes y correctos**.

No existen datos perfectos y es necesario priorizar las calidades deseadas.

#### Atributos de calidad de los datos

* Completitud.
* Relevancia.
* Vigencia.
* Disponibilidad.
* Confiabilidad.
* Consistencia.
* Corrección.
* Seguridad y privacidad.

### Bias de los datos

Datos tomados a través de scrapping pueden tener sesgos étnicos o de géneros debido a los origines de los datos y la calidad de las consutlas realizadas.  
Se debe saber recolectar, interpretar, organizar, resumir y analizar los datos para poder sacar conclusiones válidas.

## Adquisición de conceptos

Inducir automáticamente una función booleana a partir de conjuntos de ejemplos de datos (clasificados como positivos o negativos). Dado un nuevo caso devuelve su clase.  
Un problema de búsqueda de la hipótesis que más se adecua a los ejemplos mostrados sobre un espacio predefinido de posibles hipótesis.

* Las hipótesis pertenecen a un **espacion de hipótesis H**.
* Puede ocurrir que H no contenga al concepto objetivo.
* Algoritmo de aprendizaje: buscar la hipótesis **H** que mejor se ajusta a nuestros datos (D).

### Aprendizaje inductivo

Construir un modelo general a partir de información específica.  
Principio: cualquiier hipótesis que aproxime bien a una función objetivo sobre un conjunto suficientemente grande de datos, también aproximará bien a la función objetivo sobre datos no observados.

#### Sesgo inductivo (Bias)

Reduce el espacio de búsqueda, asumiendo que las hipótesis tienen una forma particular. En otras palabras: **reducción de espacio de conceptos grande a uno chico**.

#### Relación de orden general - específico

Relación de orden que existe para todos los problemas de aprendizaje de conceptos. Sean hj y hk funciones booleanas definidas en X, entonces hj es más general que hk (hj>=hk) si y solo si para todo elemento x en X si hk(x) = true entonces hj(x) = true.

#### Algoritmos

* Find-S.
* List-then-eliminate.
* CAE (candidate elimination).

##### Find-S

Usa orden parcial general-específico. Garantiza:

* Hipótesis más específica en H consitente con los ejemplos positivos.
* Hipótesis consistente con valores negativos.
* Encuentra una hipótesis consiste con los datos de entrenamiento.
* Puede haber otras hipótesis en H consistentes con los datos.
* Prefiere la hipótesis más específica.
* No es robusto a ruido.

##### List-Then-Eliminate

Espacio de versiones VS: subconjunto de hipótesis de H consistentes con el conjunto de entrenamiento.  
Es inmanejable por el tamaño de H.

##### CAE
Espacio de versiones: subconjunto de hipótesis representadas por la más general y la menos general.  
Sesgo: no se incluyen todas las posibles hipótesis ya que solo se permiten conjunciones de atributos y no disyunciones.  
Sesgo 2: reducción del espacio de conceptos.

## Árboles de decisión

* Método para inferencia inductiva.
* Aprenden de reglas if-then sobre los valores de los atributos. Predicen valor objetivo en función de las reglas.
* Nodo: test sobre un atributo de la instancia.
* Rama desde el node: corresponde a un valor para ese atributo.
* Representa disyunción de conjunciones sobre los valores de los atributos.
* No son sensibles a datos ruidosos.

### Cuando usarlos

* Instancias representables por pares atributo-valor.
* La función objetivo tiene valores de salida discretos.
* Se pueden requrir hipótesis disyuntivas.
* Posible aumento de entrenamiento ruidoso.
* Posibles valores con atributos faltantes.

### Algoritmos
* ID-3
* C4.5

Para la elección del mejor atributo se pueden utilizar alguna de las siguientes medidas:

* Information Gain (Entropía): reducción esperada de entropía por partir ejemplos basados en ese atributo.
* Impureza de Gini (Gini Gain): reducción de índice Gini por partir ejemplos basados en ese atributo.
* Gain ratio.
* otras...

Se elije siempre el atributo que tiene el mayor valor para la medida elegida.

#### Information Gain

$$Entropy(S)\ =\ \sum_{c\ \in\ Clases}\ -p_{c}log_{2}p_{c}$$

$$Gain(S, A)\ =\ Entropy(S)\ - \sum_{v\ \in\ Valores(A)}\ \dfrac{|S_{v}|}{|S|}Entropy(S_{v})$$

$$S_{v}\ =\ \{s\ \in\ S\ |\ A(s)\ =\ v\}$$

#### Gini Gain
$$Gini(S)\ =\ 1\ -\ \sum_{c\ \in\ Clases}(\dfrac{|S_{c}|}{|S|})^{2}$$

$$GiniGain(S, A)\ =\ Gini(S)\ -\ \sum_{v\ \in\ Valores(A)}\dfrac{|S_{v}|}{|S|}Gini(S_{v})$$

$$S_{v}\ =\ \{s\ \in\ S\ |\ A(s)\ =\ v\}$$

### Sesgo inductivo

* Preferencia por:
    * árboles más bajos
    * atributos con information gain alto cerca de la raíz
* Sesgo:
    * preferencia: búsqueda incompleta en espacio de hipótesis completo. Sesgo: consecuencia de hipótesis de acuerdo a estrategia de búsqueda. Ej: ID-3.
    * restricción: búsqueda completa en espacio de hipótesis incompleto. Sesgo: consecuencia de poder expresivo de la representación de hipótesis. Ej: CEA.
* Navaja de Occam: prefiere la hipótesis más corta que satisface a los datos.

### Overfitting

Una hipótesis sobreajusta a los datos de entrenamiento si existe otra hipótesis que generaliza mejor.

Se puede medir con la exactitud (Aaccuracy):
$$\dfrac{TP\ +\ TN}{TP\ +\ TN\ +\ FP\ +\ FN}$$

Como evitar el overfitting en árboles de decisión:

* Detener el crecimiento del árbol antes de que clasifique perfectamente a los datos.
* Hacer crecer el árbol entero y luego podar (post-prune).

### Discretizar valores continuos

Buscar un umbral t y discriminar en función de si A < t. Ordernar las instancias de menor a myor de A y luego buscar partir la lista de forma de maximizar la reducción de impureza.

### Valores faltantes

Posibles estrategias:

* asignar el valor más común entre los datos de entrenamiento.
* asignar el valor más común entre los datos de entrenamiento que tienen la misma clasificación.
* asignar una probabilidad basada en frecuencias observadas en valores de A en nodo n.

### Atributos con costo

* Se prefieren árboles que usen atributos de bajo costo y solo usar los de alto costo cuando es necesario.
* Modificación en ID-3: se usa el término de costo en medida de selección de atributo:
    * Gain(S,A) / costo(A), sesgo: preferencia de atributos menos costos.

### Resumen

Ventajas:

* Fácil visualización e interpretación.
* Se pueden usar atributos categóricos, continuos, binarios.
* Fáciles de usar y enteder.
* Identificar atributos importantes (análisis exploratorio).
* Para usar en clasificación y regresión.

Desventajas:

* Pueden tener overfitting.
* Suelen necesitarse ensambles de árboles para tener mejor performance.

## Evaluación de modelos

Una primera idea podría ser utilizar el Accuracy pero resulta ser una mala idea porque el modelo puede memorizar los datos de entrenamiento y medir sobre los datos de entrenamiento tiende a sobreestimar los resultados.

Separar los datos en Desarrollo y Test siempre de manera aleatoria.  
Test no se tocan ni utilizan hasta la elección del algoritmo que se utilizará y va a servir para calcualr su accuracy final.  
Desarrollo se divide en entrenamiento y validación con un q% para validación.

### Cross Validation

Para evitar la mala suerte de la separación de los datos de entrenamiento y validación se utiliza **k-Fold Cross Validation** (k = 5 es lo normal).

Se separa en k folds disjuntos del mismo tamaño y se entrena sobre todos menos 1 y sobre ese se valida, se repite hasta utilizar todas convinaciones.

Cada una de las iteraciones se puede aplicar un modelo diferente y estos modelos se obtienen por:

* Distintos atributos (selección y transformación).
* Distintos algoritmops (árboles, LDA,KNN, SVM, ...).
* Distintos hiperparámetros de cada algoritmo:
    * Information Gain, Gini Gain, ... .
    * Criterio de parada.
    * Estrategia de poda.

La selección de modelos puede utilizarse mediante un random search o grid search.

### Medidas de performance

#### Matriz de confución

|            |            | valores reales | valores reales |
| ---------- | ---------- | ----------     | ----------     |
|            |            | positivo       | negativo       |
| predicción | positivo   | TP             | FP             |
| predicción | negativo   | FN             | TN             |

El accuracy no dice nada sobre los tipos de aciertos y de errores que tiene el modelo.

$$Accuracy\ =\ \dfrac{TP\ +\ TN}{TP\ +\ TN\ +\ FP\ +\ FN}$$

Precisión de las instancias clasificadas como positivas, cuántas son (cuan útiles son los resultados de búsqueda).

$$Precision\ =\ \dfrac{TP}{TP\ +\ FP}$$

Recall o cubrimiento de las instancias positivas, cuántas fueron clasificadas como positivas (cuan completos son los resultados).

$$Recall\ =\ \dfrac{TP}{TP\ +\ FN}$$

Sensitivy/TPR: pacientes enfermos correctamente diagnosticados. Proporción de usuarios válidos autenticados. **True Positive Rate**.

$$\dfrac{TP}{TP\ +\ FN}$$

Specificity: porcentaje de pacientes sanos correctamente diagnosticados. **Tue Negative Rate**.

$$\dfrac{TN}{TN\ +\ FP}$$

FPR: proporción de impostores que aceptamos erróneamente.

$$\dfrac{FP}{FP\ +\ TN}$$

### Curva ROC

Gráfico TPR (Recall) vs FPR

En la coordenada x pongo el valor del fpr y en la coordenada y pongo el valor del tpr para todos los modelos que evalué.  
Modelos más sobre el eje y es porque necesito priorizar el TPR y más arriba pero lejos del eje y porque acepto que haya más fpr.  
Luego dependiendo del problema que estoy queriendo resolver elijo cual me conviene.

#### Área bajo la curva AUC

Siempre elijo aquella curva que me deja más área.

## Naive Bayes