# Resumen AA 2019

## Aprendizaje automático
---

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
---

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

Datos tomados a través de scrapping pueden tener sesgos étnicos o de géneros debido a los origenes de los datos y la calidad de las consutlas realizadas.  
Se debe saber recolectar, interpretar, organizar, resumir y analizar los datos para poder sacar conclusiones válidas.

## Adquisición de conceptos
---

Inducir automáticamente una función booleana a partir de conjuntos de ejemplos de datos (clasificados como positivos o negativos). Dado un nuevo caso devuelve su clase.  
Un problema de búsqueda de la hipótesis que más se adecua a los ejemplos mostrados sobre un espacio predefinido de posibles hipótesis.

* Las hipótesis pertenecen a un **espacio de hipótesis H**.
* Puede ocurrir que H no contenga al concepto objetivo.
* Algoritmo de aprendizaje: buscar la hipótesis **H** que mejor se ajusta a nuestros datos (D).

### Aprendizaje inductivo

Construir un modelo general a partir de información específica.  
Principio: cualquier hipótesis que aproxime bien a una función objetivo sobre un conjunto suficientemente grande de datos, también aproximará bien a la función objetivo sobre datos no observados.

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
---

* Método para inferencia inductiva.
* Aprenden de reglas if-then sobre los valores de los atributos. Predicen valor objetivo en función de las reglas.
* Nodo: test sobre un atributo de la instancia.
* Rama desde el nodo: corresponde a un valor para ese atributo.
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
---

Una primera idea podría ser utilizar el Accuracy pero resulta ser una mala idea porque el modelo puede memorizar los datos de entrenamiento y medir sobre los datos de entrenamiento tiende a sobreestimar los resultados.

Separar los datos en Desarrollo y Test siempre de manera aleatoria.  
Test no se tocan ni utilizan hasta la elección del algoritmo que se utilizará y va a servir para calcualr el accuracy final.  
Desarrollo se divide en entrenamiento y validación con un q% para validación.

### Cross Validation

Para evitar la mala suerte de la separación de los datos de entrenamiento y validación se utiliza **k-Fold Cross Validation** (k = 5 es lo normal).

Se separa en k folds disjuntos del mismo tamaño y se entrena sobre todos menos 1 y sobre ese se valida, se repite hasta utilizar todas convinaciones.

Cada una de las iteraciones se puede aplicar un modelo diferente y estos modelos se obtienen por:

* Distintos atributos (selección y transformación).
* Distintos algoritmos (árboles, LDA,KNN, SVM, ...).
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
---

## Aprendizaje no supervisado
---

### Tipos de Aprendizaje
* Supervisado:
    * requiere instancias para entrenamiento.
    * regresión, clasificación.
    * objetivo: encontrar una hipótesis que satisfaga los datos.
    * árboles de decisión, Naive Bayes, KNN, NN, Ensambles.
* No supervisado:
    * instancias no están etiquetedas.
    * se usa para visualizar los datos, entedenderlos resumirlos.
    * clustering, reducción de la dimensionalidad (PCA, T-SNE, MDS, ISOMAP).
    * objetivo: que el algoritmo encuentre cierta estructura.
    * clustering.
* Aprendizaje por refuerzos:
    * no tiene entrenador. Interactúa con el ambiente y tiene premios y castigos.
    * tarea: aprender a elegir acciones óptimas para lograr su objetivo.

### Clustering

Encontrar grupos de instancias (clusters) a partir de información en los datos que describan objetos y sus relaciones. Las instancias de un cluster tienen que ser: similares entre sí y diferentes a otros clusters.

Tipos de clustering:
* partición / jerárquicos.
* exclusivos / no exclusivos.

#### Algoritmos

* De partición: se clasifican n datos en k clusters. Cada cluster satisface requerimientos de una particion.
    * cada dato está en un solo cluster.
    * cada cluster debe tener al menos un dato.
* Jerárquicos:
    * Aglomerativos (bottom up): empiezan con n clusters y se combinan grupos hasa terminar en un cluster con n obsevaciones.
    * Divisorios (top down): comienzan con un cluster de n observaciones y en cada paso se divide un cluster en dos hasta tener n clusters.

#### K means

Es de partición, comienza con k centroides (puntos al azar, o datos al azar), los elementos se asocian al centroide mas cercano. Se necesita función de costo. Múltiples inicializaciones para que evitar óptimos locales. Clusters sin elementos se eliminan.

Distancias que se pueden utilizar:
* para numéricos continuos: euclídea, Manhattan, Chebychev.
* para discretos: VDM.
* para documentos: Similaridad de coseno, Jackard.
* para cadena de caracteres: Hamming o Levensthein.

Elección del k:
* manualmente --> genera ambiguedad.
* elbow method.
* evaluar con una métrica.

Ventajas
* algoritmo simple.
* eficiente.

Desventajas
* sensible a la elección de los centroides iniciales.
* sensible al ruido y outliers.
* hay que especificar el k.

#### Expectation Maximization

Gaussian mixture models.
Asumimos overlap o softclustering.

#### Linkage

Es un algoritmo aglomerativo. Cada dato forma un clusters, computar matriz de proximidad. Une los cluster más similares y actualiza la matriz hasta que haya un solo cluster.

Similaridad:
* MIN (single linkage): distancia mínima entre dos puntos de los dos clusters.
* MAX (complete link): distancia máxima entre dos puntos de los clusters.
* AVG: promedio de la distancia entre los puntos de los clusters.
* distancia entre los centroides.

Ventajas:
* no asume ningún número de clusters (se obtiene cortando el dendograma).
* pueden corresponder a taxonomías (reino animal).

Desventajas:
* sensible a ruido y outliers.
* computacionalmente más caro en tiempo y espacio.

#### DEBSCAN

Es un algoritmo de agrupamiento basado en densidad (density-based clustering) porque encuentra un número de grupos (clusters) comenzando por una estimación de la distribución de densidad de los nodos correspondientes.

* Un punto $p$ es un punto núcleo si al menos minPts puntos están a una distancia $\epsilon$ de él y, esos puntos son directamente alcanzables desde $p$. No es posible tener puntos directamente alcanzables desde un punto que no sea un núcleo.
* Un punto q es alcanzable desde p si existe una secuencia de puntos $p_{1}$,...,$p_{n}$ donde $p_{1}$=$p$ y $p_{n}$=$q$ tal que cada punto $p_{i+1}$ es directamente alcanzable desde $p_{i}$; es decir, todos los puntos de la secuencia deben ser puntos núcleos, con la posible excepción de $q$.
* Un punto que no sea alcanzable desde cualquier otro punto es considerado ruido.

**Ventajas**:
* no necesita de la especificación del número de clusters
* puede encontrar clusters con formas geométricas arbitrarias
* tiene noción del ruido, y es robusto detectando outliers
* requiere solo de dos parámetros y no es susceptible al orden en que se encuentren los puntos dentro de la base de datos

**Desventajas**:
* no es enteramente determinista
* calidad depende de la noción de distancia
* no puede agrupar conjuntos de datos bien con grandes diferencias en las densidades

## Ensambles de modelos
---

### Sesgo y varianza

Error debido a sesgo (bias): debido a diferencia entre predicción del modelo (o promedio de predicciones) y valor correcto.

Error debido a varianza: la variabilidad de la predicción de un modelo para unos datos dados. Cuánto varían los resultados para distintos datos.

$$ Y = f(X)\ +\  \epsilon $$
con X,Y datos de entrada.
$$ Err(x) = Bias^{2}\ +\ Variance\ +\ IrreducibleError $$
Para disminuir el error requerimos un método que tenga bajo sesgo y varianza.

**Algoritmos de aprendizaje inestables**: sufren cambios importantes antes pequeñas variaciones en datos de entrenamiento (árboles de decisión, redes neuronales).

**Predictores rígidos**: poca flexibilidad, menos complejos. Mayor error de sesgo.
**Predictores flexibles**: más complejos. Mayor error de varianza y menos de sesgo.

#### Dilema Bias - Varianza

A bajo sesgo, alta varianza y a alto sesgo baja varianza.

Soluciones:
* usar predictores con bajo sesgo para disminuir la varianza (bagging y random forest).
* reducir sesgo de predictores (boosting).

### Ensambles

Uso de un conjunto de modelos para construir un **meta modelo**. Usar el conocimiento de distintas fuentes para tomar decisiones. Muy usado en competencias.
Como combinar decisiones: votación simple o ponderada, promedio simple, pesado o condicional.

| **Ensambles**  | **Planos** | **Divisivos** |
| -- | -- | -- |
| | comité de expertos en un mismo tema | comité de expertos en distintas áreas |
| **Algoritmos** | bagging, boosting, random forest| stacking, mezcla de expertos |

### Bootstrapping

* Herramienta estadística.
* Técnica de resampleo a partir de un conjunto de datos con reemplazo.

### Bagging

* Arquitectura paralela.
* Para reducir la varianza.
* Promediar un conjunto de observaciones reduce la varianza.
* No se tiene muchos conjuntos de entrenamiento, entonces usa bootstrap para tomar muestras repetidas.
* Útil cuando los resultados son sensibles a los conjuntos de entrenamiento.

### Random forest

* Mejora bagging cuando se usa con árboles de decisión --> atributos que son predictores fuertes (alto information gain) entonces los árboles serán muy similares.
* Intenta eliminar la correlación de los árboles.
* En cada split de un nodo se considera solo un subconjunto **m** de los **p** atributos elegidos al azar, m ~= sqrt(p).

### Boosting

Arquitectura secuencial. Difiere de bagging en que cada modelo se arma usando información de los modelos anteriores. Se computan pesos para mejorar los casos en que el algoritmo dio mal (Ejemplo de weight-based: AdaBoost). Procedimiento:
1. modelo simple h0.
2. en cada iteración i, entrenar hi dando mayor importancia a los datos mal clasificados por la iterción anterior.
3. terminar luego de una cantidad determinada de iteraciones.
4. clasificar nuevas instancias usando votación de todos los modelos construidos.

### Stacking

Hacer varias predicciones a un held-out dataset. Usar esas predicciones para armar un nuevo dataset para entrenar un nuevo modelo, usa distintos clasificadores. Procedimiento:
1. dividir el dataset en entrenamiento y validación (aparte queda el held-out).
2. entrenar distintos modelos con el dataset de entrenamiento.
3. hacer predicciones con los modelos entrenados sobre el held-out.
4. usar los resultados de 3 para entrenar otro modelo (metamodelo).

### Resúmen

Para clasificadores inestables (árboles de decisión) usar bagging o random forest.
Para clasificadores estables y simples (Naive Bayes) usar boosting.

## Aprendizaje por refuerzos
---

**Agente autónomo**: percibe e interactúa con el ambiente. Tiene que elegir acciones óptimas para lograr su objetivo.
* percibe el estado de su entorno.
* realiza acciones para alterar su estado.
* obtiene recompensas o catigos.
* Tarea:
    * realizar secuencias de acciones, observar sus consecuencias y aprender una estrategia de control.
    * queremos aquella secuencia desde un estado inicial que elige acciones que maximizan la recompensa acumulada en el tiempo.

### Proceso de Decisión de Markov (MDP)

Los problemas de RL modelan el mundo usando MDP.
$$ MDP: <S,A,\delta,R,\gamma> $$
Con:
* S: conjunto de estados.
* A: conjunto de acciones.
* $\delta$: S x A --> S una función de transición determinística (podría no serlo, ej: probabilística).
* R: S x A --> $\R$ una funciíon de recompensa.
* $\gamma$ $\in$ [0,1): factor de descuento.

En MDP la recompensa y la transición de un estado a otro dependen del estado actual (no de los anteriores).
* El agente percibe el estado st, elige y realiza una acción at.
* El ambiente responde dando una recompensa rt = R(st, at).
* R(st, at) depende solo del estado actual no de los anteriores.

**Tarea**: aprender política para elegir acción at a partir de st. Se busca la política que arroja mayor recompensa acumulada.

Dada una política o estrategia de control: $\pi$: S --> A. Se define una función valor:
$$ V^{\pi}(S)\ =\ r_{0}\ +\ \gamma r_{1}\ +\ \gamma r_{2}\ +\ ...\ =\ \sum_{t=0}^{\infty}\ \gamma^{t} r_{t}$$

como la recompensa acumulada (con descuentos) al seguir una política $\pi$ para seleccionar acciones a partir del estados s.

$\gamma$: valor de recompensas retrasadas vs inmediatas. Si $\gamma$ ~= 0 es solo recompensa inmediata y $\gamma$ ~= 1 se da más peso a recompensas futuras.

Función objetivo: política de control que maximiza la función del valor.

### Estrategias

* Dilema exploración - explotación
    * Estrategia $\epsilon$-first
        * con probabilidad 1-$\epsilon$ se elige al azar.
        * con probabilidad $\epsilon$ se elige mejor acción conocida.
    * Estrategia $\epsilon$-greedy
        * con probabilidad $\epsilon$ se elige al azar.
        * con probabilidad 1-$\epsilon$ se elige mejor acción conocida.
    * Azar: distribución uniforme.

### Q learning

* Aprender la política óptima.
* $\alpha$ $\in$ (0,1]: tasa de aprendizaje 
* $\pi$(S) = $argmax_{a}$ Q(S,A)
* Estrategia: $\epsilon$-first o $\epsilon$-greedy.

### Deep reinforcement learning

* Aproximación de Q(S,A) con una red neuronal convolucional (CNN).

### Resumen

* Recompensa tardía: queremos aprender $\pi$, tal que dado un estado S,A = $\pi$(S). No tenemos como entrada el par (S, $\pi$(S)).
* Estrategias de experimentación: dilema **exploración** (nuevos) vs **explotación** (conocidos). El entrenamiento está dado por la secuencia de acciones que se sigue.
* Estados parcial o totalmente observables.
* Aprendizaje permanente.
* Interacción con el ambiente.
* Aprendizaje con un crítico en vez de aprendizaje con un maestro. No avisa de antemano.
* Proceso de decisión de Markov, $MDP:<S,A,\delta,R,\gamma>$.
* Política $\pi$, función de valor $V^{\pi}(S)$, función Q(S,A).
* Estrategias $\epsilon$-greedy y $\epsilon$-first.
* Algoritmo Q-Learning.

## Redes Nueronales
---
**Aprendizaje supervisado**
* Perceptrón simple
* Redes feddforward multicapa

**Aprendizaje no supervisado**
* aprendizaje hebbiano
* aprendizaje competitivo
* mapas auto organizados

**Redes neuronales**
* inspiradas en un modelo biológico
* conexión de neuronas
* opera en paralelo, es robusto ante fallas

### Modelo matemático
Nuerona: unidad básica de procesamiento de información de una red neuronal. Un modelo de una neuroana esta dado por:
* conjunto de conexiones (sinapsis) con pesos asociados.
* una señal xj conectada a la neurona k se multiplica por peso wkj
* sumador de señal de entrada
* una función de activación que limita el umbral
* un umbral bk para variar la neurona

**Funciones de activación**
* sigmoid (logística)
* tanh
* escalón
* ReLU
* leaky ReLU

### Estándares

**Perceptrón simple y multicapa**: resuelve problemas linealmente separables, funciona para AND, OR, NOT. No funciona para XOR.

Arquitectura feed forward:
* capa de entrada, capa oculta, capa de salida.
* acíclicas, no se saltean capas.
* perceptrón multicapa.
* conexión total.
* cada neurona esta conectada con todas las de la capa oculata.

### Regresión logística como red neuronal

* algoritmo de clasificación binaria.
* queremos aprender W $\in$ $\R^{nx}$, b $\in$ $\R$.
* representación de imágen en computadora.

### Algoritmo del descenso por gradiente

* se busca minimizar una función

### Profundas

* CNN: imagenes.
* RNN: texto, habla.
* Híbridas.

### Parámetros

* función de activación
* inicialización de pesos
* cantidad de capas ocultas
* conexión entre capas
* tasa de aprendizaje (learning rate)
* en cada caso se debe evaluar

## Text mining
---

### Procesamiento del lenguaje natural (NLP)

Lenguaje natural: hablado y escrito por personas.
Naturaleza del texto:
* informal:
    * errores ortográficos
    * abreviaturas no estándar o ambiguas
    * errores gramaticales
    * ej: twiiter, ciertos informes médicos
* formal:
    * oraciones bien formadas
    * ej: notas periodísticas, artículos científicos

**NLP**:
* técnicas computacionales para procesar lenguaje natural, de forma de analizarlo y/o generarlo
* diferencias con otros sistemas de procesamiento de datos
* aspectos a considerar:
    * morfologia
    * sintaxis
    * semántica
    * pragmática
* ejemplos:
    * traducción
    * resumen
    * autopredictor
    * autocorrector
    * sistemas de respuesta a preguntas (QA)
    * generación de ln
    * diálogo automático

### Extracción de información

* extracción de info estructurada a partir de textos
* tarea parecida a llenar plantillas
* ej:
    * reconocimiento de entidades nombradas (NER)
    * extracción de relaciones (RE)
* estructura de eventos a partir de mails

### Mineria de textos (TM)

* análisis de info para descibrir patrones o conocimiento no mencionado en el texto explicitamente
* puede incluir un sistema que hace extracción de info
* ej:
    * opinión de mining (sarcasmo)
    * interacción medicina-medicina
    * sentiment analysis
    * detección spam
    * determinación de autoría

### NLP, IE, TM

* segmentación de texto
* desambiguación de palabras
* resolución de anáforas y co-referencia
* desambiguación de sentidos:
    * mañana: próximo día
    * dr: doctor, drive
* expansión de abreviaturas y acrónimos

**Soluciones**:
* por reglas: necesidad de expertos, trabajoso, mentenimiento lento
* aprendizaje autmático: mejores resultados, necesita muchos datos
* hibridas

**Recursos**:
* diccionarios, lexicones
* tokenizadores, analizadores sintácticos, etc
* diferentes para cada idioma o variación de idioma

**Definiciones**:
* abreviatura ambiguas o no estándares
* acrónimo ambiguas o no estándares
* stop words: 
    * palabras comunes como preposiciones
    * consideradas irrelevantes
    * no existe lista universales
* morfología: estudia palabras y su estructura y los mecanismos de formación de las mismas
* palabras están formadas de morfemas (unidad mínima con significado de una palabra):
    * raíz: morfema principal de la palabra
    * afijo: agregan significado
        * prefijos
        * sufijos
        * infijos
        * circunfijos
* se pueden combinar morfemas de distintas formas y crear palabras
    * inflexión: raíz +  morfema
    * derivación: cambia significado
    * composición: combinación de muchas raíces
* n-gramas: secuencia contiguas de n objetos
* modelo de lenguaje (LM): modelos que asignan probabilidades a secuencias de palabras
* en LM se usan n-gramas para:
    * estimar probabilidad de la última palabra de un n-grama dadas las palabras anteriores
    * asignar probabilidades a las secuencias enteras

**Problemas**
* texto no gramátical
* falta de estructura
* presencia de abriviaturas y acrónimos
* textos con palabras en distantos idiomas
* ambiguedad
* errores ortográficos
* polisemia
* términos

### Representación de las palabras

* one hot vector(localist representation): cada palabra es una posición de un vector:
    * mucho vocabulario: vector muy grande
    * no representa similaridad semántica entre palabras
* word-embeddings (distributed representation):
    * cada palabra representada por un vector denso
    * palabras representadas por su contexto
    * palabras relacionadas semánticamente están cerca en el espacio
    * distintas formas de aprenderlas

### Stemming y lematización

* stemmimng: reducción de afijos para obtener la raíz
* lemantización: obtención de la forma básica o entrada de diccionario de una palabra

###  Arquitectura básica de un sistema de IE o NLP

1. reconomiento de idioma
2. segmentación de oraciones
    * identificar oraciones
3. segmentación de palabras: tokenización
    * identificaciones de unidades llamadas token
    * específico del idioma
4. análisis morfolófico: normalización
    * identificar clases de palabras que aparecen en contextos parecidos y sufren transformaciones similares (sustantivo, verbo, adjetivo, etc) 
5. asignación de etiquetas morfosintácticas: pos tagging
    * asignar una etiqueta de clase de palabra a cada palabra de un texto
    * como se desarrolla:
        * a partir de reglas
        * con aprendizaje automático (SVM, HMM, DNR)
6. análisis sintáctico: shallow parsing
    * se puede contar con gramática: reglas para la construcción de frases
    * parsing completo: costoso computacionalmente, se usa shallow parsing y chunking
7. constituyentes básicos o chunks
8. NLP: análisis semántico
9. IE
    * NER:
        * indentificar instancias de una clase de información específica en el texto y asignarles una clase, puede incluir normalización.
        * métodos: relgas, aprendizaje automático o hibridos
        * evaluación: precision recall, F1
        * criterios de coincidencia:
            * total match: mismo comienzo mismo fin
            * partial match: mismo comienzo o mismo fin
    * ER: detectar un tipo de relación específico entre entidades nombradas

### Pasos de aprendizaje automático para text mining

1. Segmentar: tokenizar
2. Pos tagging
3. extraer features
4. dividir los datos (entrenamiento, validación, test)
5. entrenar el modelo con la técnica seleccionada
6. entrenar modelo con el dataset de desarrollo y reportar resultados con el dataset de test.

#### Otras tareas

* clasificación de documentos: spam - spam, tendencia política de un artículo
* detección de negaciones: informe médicos, más del 50% de los hallazgos aparecen como negados
* métodos basados en:
    * reglas
    * reglas a partir de análisis sintáctico
    * aprendendizaje automático