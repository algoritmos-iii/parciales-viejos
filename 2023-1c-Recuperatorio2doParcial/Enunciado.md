# Primer Recuperatorio 1c 2023 - Algoritmos 3 - FIUBA

Queremos extender las capacidades de nuestro combatiente humanoide para que, al actuar, lo haga de acuerdo a un estilo de combate. Hasta ahora el humanoide sigue el estilo de combate marcial. Es un estilo donde el combatiente mantiene su desempeño no importa cuanto daño sufra o cuántos ataques efectúe.

Además de este estilo queremos introducir dos nuevos estilos más, el estilo de los combatientes bárbaros y de los combatientes derviches. En estos estilos ambos combatientes van cambiando su postura. La postura de un combatiente determina cómo pelean a medida que reciben daño, reciben ataques o efectúan ataques. A continuación pasamos a detallar cada estilo.

## Bárbaro
- El bárbaro empieza combatiendo con una postura normal. Esta postura normal es la típica del estilo marcial que teníamos hasta ahora en el humanoide. Esta postura dura hasta que recibe 8 puntos de daño (sin contar lo absorbido por la armadura).
- Una vez que sufre 8 puntos de daño o más, pasa a estar furioso. En esta postura de combate el bárbaro hace 4 puntos más de daño en cada ataque (por ejemplo, hace 6 de daño cuando ataca con los puños). Esta postura dura hasta que realiza 4 ataques.
- Una vez que realiza 4 ataques estando furioso, pasa a estar levemente cansado. En esta postura de combate el bárbaro hace 2 puntos menos de daño que cuando estaba normal (y deja de hacer los 4 extra de estar furioso). El bárbaro permanece levemente cansado por el resto del combate.

Es importante notar que si sufrió 8 puntos de vida o más de daño (ya sea en un golpe o en varios) pasa a estar furioso, independientemente de si lo curaron en algún momento durante el combate. Por ejemplo:
- sufre 4 (recibe 6 de daño y absorbe 2) ← Hasta aquí acumula 4 de daño
- le curan 4
- sufre 3 (recibe 5 de daño y absorbe 2) ← Hasta aquí acumula 7 de daño
- sufre 3 (recibe 5 de daño y absorbe 2) ← Hasta aquí acumula 10 de daño
- ** entra en postura furiosa **

## Derviche
- El derviche también empieza combatiendo con una postura normal, al igual que el humanoide y el bárbaro. Esta postura dura hasta que recibe 8 puntos de daño, al igual que el bárbaro.
- Una vez que sufre 8 puntos de daño o más, a diferencia del bárbaro, pasa a estar en trance. En esta forma de combate el derviche recibe 4 puntos menos de daño en cada ataque. Esta postura dura hasta que recibe 4 ataques (estando en trance). Ojo que, a diferencia del bárbaro, aquí hablamos de recibir ataques y NO de realizar ataques.
- Una vez que recibe 4 ataques estando en trance, pasa a estar fuertemente cansado. En esta postura de combate el derviche hace 4 puntos menos de daño con sus ataques (en lugar de sólo 2 puntos menos como el bárbaro). Al igual que el bárbaro, el derviche permanece en esta postura por el resto del combate.

Es importante notar que si sufrió 8 puntos de vida o más de daño (ya sea en un golpe o en varios) pasa a estar en trance, independientemente de si lo curaron en algún momento durante el combate. Por ejemplo:
- sufre 4 (recibe 6 de daño y absorbe 2) ← Hasta aquí acumula 4 de daño
- le curan 4
- sufre 3 (recibe 5 de daño y absorbe 2) ← Hasta aquí acumula 7 de daño
- sufre 3 (recibe 5 de daño y absorbe 2) ← Hasta aquí acumula 10 de daño
- ** entra en postura en trance **

Dado que los bárbaros y derviches sólo difieren del humanoide (marcial) en el estilo de combate que siguen, ambos podrán ser equipados con armas y armaduras, al igual que un humanoide normal.

## Modalidad de trabajo
Nuestra tarea es modelar lo pedido mediante TDD y siguiendo las heurísticas de diseño vistas durante toda la cursada de la materia.

En su modelo final deben pasar todos los tests. Tanto los que agregue en su recorrido en TDD como los ya existentes en el código inicial. 

En el código inicial se agregó una clase de test BarbarosYDervichesTest que debe utilizar para hacer el recorrido de TDD.

## Ayudas:
- Para provocar los distintos daños sobre los bárbaros y derviches durante los tests, utilicen “recibirDaño:”, “recibirCuracion:”. No se la compliquen armando escenarios con combatientes. Supongan que “recibirDaño:” es semánticamente equivalente a “recibir un ataque”.
- Tests integradores: En la clase CombatesConBarbarosYDervichesTest van a encontrar dos tests integradores que prueban enfrentar a un bárbaro y a un derviche contra combatientes humanoides. Estos tests están deshabilitados y para hacerlos andar hay que completar los métodos en la categoría “para-completar”. Estos tests les pueden ser útiles para detectar algunas malas interpretaciones funcionales.

El código inicial, AlgoIII-2023-1C-1Recu-CombatientesFantasticos-P5.Inicial.st, es muy similar a la solución del segundo parcial, con cambios menores. 

Prioricen la calidad del trabajo en este orden:
- TDD (tener tests en un orden y granularidad acorde a TDD).
- Modelo (nombres, no repetir código, claridad, etc).
- Nombre de los tests (nombres claros de los tests).
- Correctitud de tests (repetición de código, claridad, etc).

