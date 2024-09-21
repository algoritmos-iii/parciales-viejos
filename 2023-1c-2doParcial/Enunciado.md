# Segundo Parcial 1c 2023 - Algoritmos 3 - FIUBA

Seguimos trabajando en nuestro proyecto de combatientes fantásticos, y nuestra tarea es implementar nuevamente al curador, pero ahora con otro funcionamiento. Hasta el momento teníamos un curador que cuando actuaba curaba 2 puntos de vida a todos los combatientes. Ahora queremos limitar esta capacidad de curar infinitos aliados. 
Cuando el curador actúa va a aplicar una cantidad de dosis limitadas. Cada dosis es el acto de curar a un aliado. A quienes le aplicará las dosis y cuantas dosis aplicará depende del equipamiento con el que cuente y de su estrategia de curación.

## Equipamiento
Los curadores siempre cuentan con un equipo de curación que puede ser un cristal místico o bálsamos esenciales. De dicho equipo depende cuantas dosis se aplica al actuar y el efecto de curación de una dosis sobre cada combatiente. 
Por ejemplo, al aplicar una dosis a un dragón teniendo el equipo “Cristal Místico", lo curará en 5 puntos de vida. A continuación detallamos el efecto y la cantidad de dosis que provee cada equipo.

### Cristal Místico
Por cada actuar el curador va a poder aplicar 5 dosis.
Efecto al aplicar una dosis:
- Curador: es curado en 1 punto de vida
- Humanoide: es curado en 2 puntos de vida 
- Dragón: es curado en 5 puntos de vida

### Bálsamo Esencial
Por cada actuar el curador va a poder aplicar 3 dosis.
Efecto al aplicar una dosis:
- Curador: es curado en  1 punto de vida
- Dragón: es curado en 2 puntos de vida
- Humanoide: es curado el 20% de sus puntos de vida perdidos/faltantes, redondeando siempre para arriba. Pueden utilizar el mensaje ceiling: (puntosDeVidaPerdidos * 0.2) ceiling.

## Estrategia de aplicación
El curador cada vez que actúa tiene una serie de dosis a aplicar pero debe elegir cómo y a quién aplicarlas. Para ello, lo primero que hace es determinar a quién de sus aliados va a curar, priorizando aquellos que tengan menos puntos de vida. Luego, realiza su tarea según dos estrategias posibles: curar a la mayor cantidad de aliados posible vs. curar lo máximo posible a un combatiente.

- Sanar a la mayor cantidad posible: elige a un aliado y le aplica una dosis, luego elige a otro diferente y le aplica otra dosis, y así hasta que no tenga más dosis por aplicar. Solo le aplica una dosis a cada combatiente.
- Sanar lo máximo posible: elige a un aliado y le aplica todas las dosis que pueda hasta que complete sus puntos de vida, si tiene más dosis por aplicar continua con el siguiente, y así sucesivamente.

Por ejemplo, si el curador sigue la estrategia de sanar a la mayor cantidad posible y cuenta con el equipo “Cristal místico” y tiene como aliados a 6 combatientes, a un humanoide con 12 puntos de vidas, a 4 dragones con 100 puntos de vida y a un dragón más con 180 puntos de vida. Al actuar, teniendo 5 dosis por aplicar (debido a que su equipo es “Cristal místico”), va a darle la primera al humanoide con 12 puntos de vida, luego las 4 dosis restantes a los dragones que tenían 100 puntos de vida, y finalmente el dragón de 180 puntos de vida no recibirá ninguna. 

Por el contrario, teniendo el mismo escenario pero siguiendo la estrategia de sanar lo máximo posible las dosis la aplicará de forma diferente. Al actuar, teniendo 5 dosis por aplicar, va a darle todas las dosis que necesite el humanoide hasta que no tenga más dosis por aplicar o hasta que el aliado deje de estar herido. En este caso, como el humanoide está herido en 8 puntos de vida (20 puntos de vida iniciales - 12 puntos de vida)  y el efecto de una dosis con el equipo “Cristal místico” sobre los humanoides es de 2 puntos de vida, le aplicara 4 dosis, y la dosis restante se la aplicara a uno de los dragones de 100 puntos de vida, quedando los otros 3 dragones de 100 pv y el dragón de 180 puntos de vida sin ninguna aplicación.

## Modalidad de trabajo y requisitos.
Nuestra tarea es modelar lo pedido mediante TDD y siguiendo las heurísticas de diseño vistas durante toda la cursada de la materia.

En su modelo final deben pasar todos los tests. Tanto los que agregue en su recorrido en TDD como los ya existentes en el código inicial. 

En el código inicial se agregó una clase de test CuradoresFantasticosTest que debe utilizar para hacer el recorrido de TDD.

### Para poder aprobar el examen el modelo de cumplir:
- El modelo debe ser lo suficientemente flexible para poder agregar nuevos equipos de curación sin modificar al curador ni al resto de los combatientes.
- El modelo debe ser lo suficientemente flexible para poder agregar una nueva estrategia sin tener que modificar al curador.

## Ayudas:
Para implementar la funcionalidad pedida en sus tests seguramente necesite dañar a otro combatiente, en lugar de utilizar “actuar” les recomendamos usar directamente “recibirDaño:” que les simplificará la construcción de dichos tests.

El código inicial, AlgoIII-2023-1C-2Parcial-CombatientesFantasticos-P4.Inicial.st, es muy similar a la solución del parcial anterior. A continuación les enumeramos algunos de los cambios:
- Se ha quitado de nuestro proyecto al ogro y a los ilusionistas. 
- También, debido a que ya no aplica, se borró el comportamiento al actuar estando en combate del curador y los tests que predicaban sobre este comportamiento. Por lo que para implementar la nueva funcionalidad deben utilizar el curador ya modelado, seguramente tengan que modificar entre otras cosas la implementación del mensaje CombatienteCurador >> #actuarEstandoEnCombate 

Prioricen la calidad del trabajo en este orden:
- TDD (tener tests en un orden y granularidad acorde a TDD).
- Modelo (nombres, no repetir código, claridad, etc) y resolver las restricciones de extensibilidad indicadas “para poder aprobar el examen el modelo de cumplir”.
- Nombre de los tests (nombres claros de los tests)
- Correctitud de tests (repetición de código, claridad, etc).

