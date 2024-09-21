# Primer Parcial 1c 2023 - Algoritmos 3 - FIUBA

Nuestros combates están resultando un tanto aburridos. “¡No tienen nada de fantásticos!”, se lamentó nuestro cliente. Por ello, en un rapto de ansiedad, mandó a otro equipo a programar varios nuevos combatientes. Y ahora lo tenemos una vez más en nuestras manos con el objetivo de mejorarlo aplicando las técnicas y herramientas que hemos visto en la materia.

En el episodio anterior solo contábamos con humanoides (humanos y orcos) como combatientes. Para agregarle fantasía a su producto el cliente decidió incluir un dragón, un ilusionista, un curador y un ogro. Estos nuevos combatientes difieren en los puntos de vida iniciales y en cómo “atacan”:

- Dragón: hace 8 de daño, al “atacar” daña a 8 enemigos a la vez e inicia con 200 puntos de vida.
- Ilusionista: al “atacar” engaña a uno de sus enemigos para que este ataque a un aliado propio. Inicia con 20 puntos de vida.
- Curador:  al “atacar” incrementa en 2 los puntos de vida de todos sus aliados. Inicia con 20 puntos de vida.
- Ogro: por su gran tamaño y lentitud, para atacar necesita dos turnos, uno para prepararse y el siguiente para perpetrar su ataque, donde hace 20 de daño.  Inicia con 60 puntos de vida. 

Como dijimos todo esto ya está resuelto y con sus tests (CombatientesFantasticosTest), pero debemos mejorar el modelo. El equipo que hizo las modificaciones dejó registrada las siguientes sugerencias de mejoras:

- La clase Combatiente tiene algunos IFs que deben ser reemplazados por polimorfismo.
- Mejorar algunos nombres de colaboradores en la clase Combatiente. En principio esperamos que mejoren 6 nombres de colaboradores (entre internos, externos y temporales).
- Quitar el código repetido en la clase Combatiente.
- Quitar código repetido en los tests 1 a 10 de la clase CombatientesFantasticosTest. Importante: a nivel código repetido de los tests sólo evaluaremos los tests 1 a 10. No será tenido en cuenta si lo hacen en otros tests de esta clase (tests 11 a 17) o cualquier otra clase de test.
- Finalmente, el nombre “atacar” del mensaje principal del Combatiente se nos está quedando corto. No parece expresar bien lo que está pasando. Es decir, no siempre que le enviamos el mensaje “atacar” a un combatiente, éste efectivamente ataca. A veces prepara un ataque, a veces cura, a veces engaña a otro combatiente para que ese sí ataque a un aliado, y podrían aparecer otros combatientes que hagan cosas diferentes. Entonces, lo que nos gustaría es que resuelvan este problema. ¿Hay un mejor nombre para este mensaje?. Deben cambiar el nombre de este mensaje, les recomendamos usar el refactor rename.

IMPORTANTE: Deben entregar el modelo con todos los tests del código inicial funcionando. Se descontarán varios puntos en caso que esto no suceda.
