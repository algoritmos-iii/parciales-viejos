!classDefinition: #AtacarTest category: 'AlgoIII-2023-1C-1Parcial-CombatientesFantasticos-P3'!
TestCase subclass: #AtacarTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2023-1C-1Parcial-CombatientesFantasticos-P3'!

!AtacarTest methodsFor: 'tests' stamp: 'SF 10/17/2022 19:20:49'!
hacerQue: combatiente1 quedeMalDebidoA: combatiente2

	[combatiente1 puntosDeVida <= 0] whileFalse: [
		combatiente2 atacarA: combatiente1]! !

!AtacarTest methodsFor: 'tests' stamp: 'JMB 3/5/2023 21:55:28'!
nuevoCombatienteHumanoide

	^ Combatiente humanoide! !

!AtacarTest methodsFor: 'tests' stamp: 'JMB 3/5/2023 21:53:45'!
test01CuandoUnCombatienteNoTieneEnemigosNoAtacaANadie
	| combatiente alguien |
	combatiente := self nuevoCombatienteHumanoide.
	alguien := self nuevoCombatienteHumanoide.
	
	combatiente atacar.
	
	self assert: (alguien noEstaHerido).
	
	! !

!AtacarTest methodsFor: 'tests' stamp: 'JMB 3/5/2023 21:53:45'!
test02CuandoUnCombatienteTieneEnemigosAtacaAUno
	| combatiente enemigo1 enemigo2 enemigo1Herido enemigo2Herido |
	combatiente := self nuevoCombatienteHumanoide.
	enemigo1 := self nuevoCombatienteHumanoide.
	enemigo2 := self nuevoCombatienteHumanoide.
	combatiente enemigos: {enemigo1. enemigo2.}.
	
	combatiente atacar.
	
	enemigo1Herido := enemigo1 estaHerido and: [enemigo2 noEstaHerido].
	enemigo2Herido := enemigo2 estaHerido and: [enemigo1 noEstaHerido].
	self assert: (enemigo1Herido or: [enemigo2Herido]).
	
	! !

!AtacarTest methodsFor: 'tests' stamp: 'JMB 3/5/2023 21:53:45'!
test03UnCombatientePuedeTenerComoEstrategiaAtacarAlMasHerido
	| combatiente enemigo1 enemigo2 enemigo2HeridoDosVeces |
	combatiente := self nuevoCombatienteHumanoide.
	enemigo1 := self nuevoCombatienteHumanoide.
	enemigo2 := self nuevoCombatienteHumanoide.
	combatiente enemigos: {enemigo1. enemigo2.}.
	combatiente atacarA: enemigo2.
	
	combatiente focalizarEnElMasHerido.
	combatiente atacar.
	
	enemigo2HeridoDosVeces := enemigo2 tienePuntosDeVida: 16 * pv.
	self assert: enemigo2HeridoDosVeces.
	
	! !

!AtacarTest methodsFor: 'tests' stamp: 'JMB 3/5/2023 21:53:45'!
test04UnCombatientePuedeTenerComoEstrategiaAtacarAlMasSano
	| combatiente enemigo1 enemigo2 elEnemigo1EstaHerido |
	combatiente := self nuevoCombatienteHumanoide.
	enemigo1 := self nuevoCombatienteHumanoide.
	enemigo2 := self nuevoCombatienteHumanoide.
	combatiente enemigos: {enemigo1. enemigo2.}.
	combatiente atacarA: enemigo2.
	
	combatiente focalizarEnElMasSano.
	combatiente atacar.
	
	elEnemigo1EstaHerido := enemigo1 tienePuntosDeVida: 18*pv.
	self assert: elEnemigo1EstaHerido.
	
	! !

!AtacarTest methodsFor: 'tests' stamp: 'JMB 3/5/2023 21:53:45'!
test05ElEnemigoFocalizadoMasSanoCambiaDinamicamente
	| combatiente enemigo1 enemigo2 |
	combatiente := self nuevoCombatienteHumanoide.
	enemigo1 := self nuevoCombatienteHumanoide.
	enemigo2 := self nuevoCombatienteHumanoide.
	combatiente enemigos: {enemigo1. enemigo2.}.
	combatiente atacarA: enemigo2.

	combatiente equiparConUnaEspada.	
	combatiente focalizarEnElMasSano.
	combatiente atacar.
	combatiente atacar.
	
	self assert: (enemigo1 tienePuntosDeVida: 12*pv).
	self assert: (enemigo2 tienePuntosDeVida: 10*pv).
	
	! !

!AtacarTest methodsFor: 'tests' stamp: 'JMB 3/5/2023 21:53:45'!
test06ElEnemigoFocalizadoMasHeridoCambiaDinamicamente
	| combatiente enemigo1 enemigo2 |
	combatiente := self nuevoCombatienteHumanoide.
	enemigo1 := self nuevoCombatienteHumanoide.
	enemigo2 := self nuevoCombatienteHumanoide.
	combatiente enemigos: {enemigo1. enemigo2.}.
	combatiente atacarA: enemigo2.

	combatiente equiparConUnaEspada.	
	combatiente focalizarEnElMasHerido.
	combatiente atacar.
	combatiente atacarA: enemigo1.
	combatiente atacarA: enemigo1.
	combatiente atacar.
	
	self assert: (enemigo1 tienePuntosDeVida: -4*pv).
	self assert: (enemigo2 tienePuntosDeVida: 10*pv).
	
	! !

!AtacarTest methodsFor: 'tests' stamp: 'JMB 3/5/2023 21:53:45'!
test07CuandoUnEnemigoEstaVencidoNoEsAtacadoMas
	| combatiente enemigoVencido enemigo2 |
	combatiente := self nuevoCombatienteHumanoide.
	enemigoVencido := self nuevoCombatienteHumanoide.
	enemigo2 := self nuevoCombatienteHumanoide.
	combatiente enemigos: {enemigoVencido. enemigo2.}.
	combatiente equiparConUnaEspada.	
	combatiente atacarA: enemigoVencido.
	combatiente atacarA: enemigoVencido.
	combatiente atacarA: enemigoVencido.

	combatiente focalizarEnElMasHerido.
	combatiente atacar.
	
	self assert: (enemigo2 tienePuntosDeVida: 12*pv).
	
	! !

!AtacarTest methodsFor: 'tests' stamp: 'JMB 3/5/2023 21:53:45'!
test08CuandoUnCombatienteEstaVencidoNoAtaca
	| combatiente enemigo |
	combatiente := self nuevoCombatienteHumanoide.
	enemigo := self nuevoCombatienteHumanoide.
	combatiente enemigos: {enemigo}.
	self hacerQue: combatiente quedeMalDebidoA: enemigo.
	
	combatiente atacar.
	
	self assert: (enemigo tienePuntosDeVida: 20*pv).
	
	! !


!classDefinition: #CombatesFantasticosTest category: 'AlgoIII-2023-1C-1Parcial-CombatientesFantasticos-P3'!
TestCase subclass: #CombatesFantasticosTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2023-1C-1Parcial-CombatientesFantasticos-P3'!

!CombatesFantasticosTest methodsFor: 'tests' stamp: 'JMB 3/5/2023 21:52:13'!
test01UnDragonLeGanaA8CombatientesEn3Rondas
	| bandoCombatientes bandoDragon orquestador resultado |
	bandoDragon := {self nuevoCombatienteDragon}.
	bandoCombatientes := self ochoCombatientes.
	orquestador := OrquestadorDeCombates 	establecerCombateEntreBando1: bandoDragon contraBando2: bandoCombatientes.
	resultado := orquestador desarrollarDuranteRondas: 3.
	self assert: (resultado tieneDeGanadorAlBando1).! !

!CombatesFantasticosTest methodsFor: 'tests' stamp: 'JMB 3/5/2023 21:52:13'!
test02UnDragonLeGanaA8CombatientesArmados
	| bandoCombatientes bandoDragon orquestador resultado |
	bandoDragon := {self nuevoCombatienteDragon}.
	bandoCombatientes := self combatientesArmados: 8.
	orquestador := OrquestadorDeCombates 	establecerCombateEntreBando1: bandoDragon contraBando2: bandoCombatientes.
	resultado := orquestador desarrollarDuranteRondas: 10.
	self assert: (resultado tieneDeGanadorAlBando1).! !

!CombatesFantasticosTest methodsFor: 'tests' stamp: 'JMB 3/5/2023 21:52:13'!
test03UnDragonPierdeContra9CombatientesArmados
	| bandoCombatientes bandoDragon orquestador resultado |
	bandoDragon := {self nuevoCombatienteDragon}.
	bandoCombatientes := self combatientesArmados: 9.
	orquestador := OrquestadorDeCombates 	establecerCombateEntreBando1: bandoDragon contraBando2: bandoCombatientes.
	resultado := orquestador desarrollarDuranteRondas: 10.
	self assert: (resultado tieneDeGanadorAlBando2).! !

!CombatesFantasticosTest methodsFor: 'tests' stamp: 'JMB 3/5/2023 21:52:13'!
test04UnDragonContra4CuradoresNoTermina
	| bandoCuradores bandoDragon orquestador resultado |
	bandoDragon := {self nuevoCombatienteDragon}.
	bandoCuradores := self cuatroCuradores.
	orquestador := OrquestadorDeCombates 	establecerCombateEntreBando1: bandoDragon contraBando2: bandoCuradores.
	resultado := orquestador desarrollarDuranteRondas: 1000.
	self assert: resultado finalizoSinGanadores.! !


!CombatesFantasticosTest methodsFor: 'test-objects' stamp: 'JMB 3/5/2023 21:53:00'!
combatientesArmados: cantidad
	^(1 to: cantidad) collect: [ :numero |
		| combatiente |
		combatiente := self nuevoCombatienteHumanoide.
		combatiente equiparConUnaArmaduraDeCuero.
		combatiente equiparConUnaLanza.
		combatiente.
	].! !

!CombatesFantasticosTest methodsFor: 'test-objects' stamp: 'JMB 3/5/2023 21:52:34'!
cuatroCuradores
	^(1 to: 4) collect: [ :numero | self nuevoCombatienteCurador ].! !

!CombatesFantasticosTest methodsFor: 'test-objects' stamp: 'JMB 3/5/2023 21:52:34'!
nuevoCombatienteCurador

	^ Combatiente curador! !

!CombatesFantasticosTest methodsFor: 'test-objects' stamp: 'JMB 3/5/2023 21:52:13'!
nuevoCombatienteDragon

	^ Combatiente dragon! !

!CombatesFantasticosTest methodsFor: 'test-objects' stamp: 'JMB 3/5/2023 21:55:38'!
nuevoCombatienteHumanoide

	^ Combatiente humanoide! !

!CombatesFantasticosTest methodsFor: 'test-objects' stamp: 'JMB 3/5/2023 21:53:00'!
ochoCombatientes
	^(1 to: 8) collect: [ :numero | self nuevoCombatienteHumanoide ].! !


!classDefinition: #CombatientesFantasticosTest category: 'AlgoIII-2023-1C-1Parcial-CombatientesFantasticos-P3'!
TestCase subclass: #CombatientesFantasticosTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2023-1C-1Parcial-CombatientesFantasticos-P3'!

!CombatientesFantasticosTest methodsFor: 'test-objects' stamp: 'SF 2/13/2023 19:38:59'!
nuevoCombatienteCurador
	^Combatiente curador.! !

!CombatientesFantasticosTest methodsFor: 'test-objects' stamp: 'NR 2/12/2023 19:21:28'!
nuevoCombatienteDragon
	^Combatiente dragon.! !

!CombatientesFantasticosTest methodsFor: 'test-objects' stamp: 'JMB 3/5/2023 21:55:47'!
nuevoCombatienteHumanoide

	^ Combatiente humanoide! !

!CombatientesFantasticosTest methodsFor: 'test-objects' stamp: 'NR 2/12/2023 19:21:22'!
nuevoCombatienteIlusionista
	^Combatiente ilusionista.! !

!CombatientesFantasticosTest methodsFor: 'test-objects' stamp: 'SF 2/16/2023 18:10:57'!
nuevoCombatienteOgro
	^Combatiente ogro.! !


!CombatientesFantasticosTest methodsFor: 'tests-01-puntos-de-vida-iniciales' stamp: 'JMB 3/4/2023 19:54:33'!
test01UnDragonComienzaCon200PuntosDeVida

	self assert: (self nuevoCombatienteDragon tienePuntosDeVida: 200 * pv).! !

!CombatientesFantasticosTest methodsFor: 'tests-01-puntos-de-vida-iniciales' stamp: 'JMB 3/4/2023 20:04:55'!
test02UnIlusionistaComienzaCon20PuntosDeVida

	| ilusionista |
	ilusionista := self nuevoCombatienteIlusionista.
	self assert: (ilusionista tienePuntosDeVida: 20 * pv).! !

!CombatientesFantasticosTest methodsFor: 'tests-01-puntos-de-vida-iniciales' stamp: 'JMB 3/4/2023 20:04:47'!
test03UnCuradorComienzaCon20PuntosDeVida

	| curador |
	curador := self nuevoCombatienteCurador.
	self assert: (curador tienePuntosDeVida: 20 * pv).! !

!CombatientesFantasticosTest methodsFor: 'tests-01-puntos-de-vida-iniciales' stamp: 'JMB 3/4/2023 20:04:40'!
test04UnOgroComienzaCon60PuntosDeVida

	| ogro |
	ogro := self nuevoCombatienteOgro.
	self assert: (ogro tienePuntosDeVida: 60 * pv).! !


!CombatientesFantasticosTest methodsFor: 'tests-02-dragon' stamp: 'JMB 3/4/2023 20:37:04'!
test05UnDragonHace8DeDaño

	| dragon victima enemigos |
	dragon := self nuevoCombatienteDragon.
	victima := self nuevoCombatienteHumanoide.
	enemigos := {victima}.
	dragon enemigos: enemigos.
	
	dragon atacar.
	
	self assert: 1 equals: (enemigos count: [: unEnemigo | victima tienePuntosDeVida: 12 * pv]).
	self assert: 0 equals: (enemigos count: [: unEnemigo | victima estaHerido not]).! !

!CombatientesFantasticosTest methodsFor: 'tests-02-dragon' stamp: 'JMB 3/4/2023 20:37:34'!
test06UnDragonAtacaAMasDeUnEnemigo

	| dragon victima1 victima2 enemigos |
	dragon := self nuevoCombatienteDragon.
	victima1 := self nuevoCombatienteHumanoide.
	victima2 := self nuevoCombatienteHumanoide.
	enemigos := {victima1. victima2}.
	dragon enemigos: enemigos.
	
	dragon atacar.
	
	self assert: 2 equals: (enemigos count: [: unEnemigo | unEnemigo tienePuntosDeVida: 12 * pv]).
	self assert: 0 equals: (enemigos count: [: unEnemigo | unEnemigo estaHerido not]).! !

!CombatientesFantasticosTest methodsFor: 'tests-02-dragon' stamp: 'jMB 4/2/2023 23:10:46'!
test07UnDragonAtacaHastaUnMaximoDe8Enemigos

	| dragon enemigos |
	dragon := self nuevoCombatienteDragon.
	enemigos := 	(1 to: 9) collect: [ : unNumero | self nuevoCombatienteHumanoide ]. 
	dragon enemigos: enemigos.
	
	dragon atacar.
	
	self assert: 8 equals: (enemigos count: [: unEnemigo | unEnemigo tienePuntosDeVida: 12 * pv]).
	self assert: 1 equals: (enemigos count: [: unEnemigo | unEnemigo estaHerido not]).! !


!CombatientesFantasticosTest methodsFor: 'tests-03-curador' stamp: 'JMB 5/6/2023 19:11:40'!
test08UnCuradorCura2DeDañoASusAliados
	| curador aliado enemigo aliados |
	aliado := self nuevoCombatienteHumanoide.	
	enemigo := self nuevoCombatienteHumanoide.
	enemigo enemigos: {aliado}.
	enemigo atacar.
	enemigo atacar.
	
	aliados := {aliado}.
	
	curador := self nuevoCombatienteCurador.
	curador aliados: aliados.
	
	curador atacar.

	self assert: (aliados allSatisfy: [ : unAliado | unAliado tienePuntosDeVida: 18*pv ]).! !

!CombatientesFantasticosTest methodsFor: 'tests-03-curador' stamp: 'JMB 5/6/2023 19:09:48'!
test09UnCuradorNoCuraMasDeLosPuntosDeVidaIniciales
	| curador aliados |
	aliados := {self nuevoCombatienteDragon}.
	
	curador := self nuevoCombatienteCurador.
	curador aliados: aliados.

	curador atacar.
		
	self assert: (aliados allSatisfy: [ : unAliado | unAliado tienePuntosDeVida: 200*pv ]).! !

!CombatientesFantasticosTest methodsFor: 'tests-03-curador' stamp: 'jMB 4/2/2023 23:17:57'!
test10UnCuradorCuraATodosSusAliados
	| curador aliados |
	aliados := (1 to: 10) collect: [ : unNumero | 
		| aliado enemigo |
		enemigo := self nuevoCombatienteHumanoide.
		aliado := self nuevoCombatienteHumanoide.
		enemigo enemigos: {aliado}.
		enemigo atacar.
		aliado.
	].

	curador := self nuevoCombatienteCurador.
	curador aliados: aliados.
	
	curador atacar.
	
	self assert: (aliados allSatisfy: [ : unAliado | unAliado tienePuntosDeVida: 20*pv ]).! !


!CombatientesFantasticosTest methodsFor: '[No hace falta quitar codigo repetido] tests-03-curador' stamp: 'JMB 3/5/2023 01:43:21'!
test11UnCuradorNoDañaAUnEnemigo
	| curador enemigo |
	curador := self nuevoCombatienteCurador.
	enemigo := self nuevoCombatienteHumanoide.
	curador enemigos: {enemigo}.

	curador atacar.
	
	self assert: enemigo noEstaHerido.! !


!CombatientesFantasticosTest methodsFor: '[No hace falta quitar codigo repetido] tests-04-ilusionista' stamp: 'JMB 3/5/2023 01:47:48'!
test12UnIlusionistaContraUnSoloEnemigoNoHaceNada

	|  ilusionista enemigo |
	ilusionista := self nuevoCombatienteIlusionista .
	enemigo := self nuevoCombatienteHumanoide.
	ilusionista enemigos: {enemigo}.
	
	ilusionista atacar.
	
	self assert: enemigo noEstaHerido.! !

!CombatientesFantasticosTest methodsFor: '[No hace falta quitar codigo repetido] tests-04-ilusionista' stamp: 'JMB 5/14/2023 12:50:02'!
test13UnIlusionistaAlAtacarEngañaASusVictimasParaQueAtaquenAOtroEnemigo

	|  ilusionista enemigoEngañado enemigoASerAtacadoPorElEngañado |
	ilusionista := self nuevoCombatienteIlusionista .
	enemigoEngañado := self nuevoCombatienteHumanoide.
	enemigoASerAtacadoPorElEngañado := self nuevoCombatienteHumanoide.
	ilusionista enemigos: {enemigoEngañado. enemigoASerAtacadoPorElEngañado}.
	
	ilusionista atacarA: enemigoEngañado.
	
	self assert: enemigoEngañado noEstaHerido. 
	self assert: enemigoASerAtacadoPorElEngañado estaHerido.! !


!CombatientesFantasticosTest methodsFor: '[No hace falta quitar codigo repetido] tests-05-ogro' stamp: 'JMB 5/14/2023 12:50:25'!
test14UnOgroNoDañaAUnEnemigoCuandoAtacaLaPrimeraVez
	| ogro enemigo |
	ogro := self nuevoCombatienteOgro.
	enemigo := self nuevoCombatienteHumanoide.
	ogro enemigos: {enemigo}.

	ogro atacar.
	
	self assert: enemigo noEstaHerido.! !

!CombatientesFantasticosTest methodsFor: '[No hace falta quitar codigo repetido] tests-05-ogro' stamp: 'JMB 5/14/2023 12:50:36'!
test15UnOgroDañaAUnEnemigoCuandoAtacaLuegoDePrepararse
	| ogro enemigo |
	ogro := self nuevoCombatienteOgro.
	enemigo := self nuevoCombatienteHumanoide.
	ogro enemigos: {enemigo}.
	ogro atacar.
	
	ogro atacar.
	
	self assert: enemigo estaHerido.! !

!CombatientesFantasticosTest methodsFor: '[No hace falta quitar codigo repetido] tests-05-ogro' stamp: 'JMB 5/14/2023 12:50:49'!
test16UnOgroHace20DeDañoCuandoAtacaLuegoDePrepararse
	| ogro enemigo |
	ogro := self nuevoCombatienteOgro.
	enemigo := self nuevoCombatienteHumanoide.
	enemigo equiparConUnaArmaduraDeCuero.
	ogro enemigos: {enemigo}.
	ogro atacar.
	
	ogro atacar.
	
	self assert: (enemigo tienePuntosDeVida: 2 * pv).! !

!CombatientesFantasticosTest methodsFor: '[No hace falta quitar codigo repetido] tests-05-ogro' stamp: 'JMB 5/14/2023 12:50:58'!
test17UnOgroLuegoDeAtacarTieneQueVolverAPrepararse
	| ogro enemigo |
	ogro := self nuevoCombatienteOgro.
	enemigo := self nuevoCombatienteHumanoide.
	enemigo equiparConUnaArmaduraDeCuero.
	ogro enemigos: {enemigo}.
	ogro atacar.
	ogro atacar.
	
	ogro atacar.
	
	self assert: enemigo estaFueraDeCombate not.! !


!classDefinition: #CombatientesTest category: 'AlgoIII-2023-1C-1Parcial-CombatientesFantasticos-P3'!
TestCase subclass: #CombatientesTest
	instanceVariableNames: 'atacante atacado'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2023-1C-1Parcial-CombatientesFantasticos-P3'!

!CombatientesTest methodsFor: 'tests' stamp: 'JMB 10/18/2022 21:08:35'!
test01LosPuñosHacen2DeDaño
	atacante atacarA: atacado.
	
	self assert: (atacado tienePuntosDeVida: 18*pv).! !

!CombatientesTest methodsFor: 'tests' stamp: 'JMB 10/18/2022 21:04:54'!
test02MultiplesAtaquesVanBajandoMasVida
	atacante atacarA: atacado.
	atacante atacarA: atacado.
	
	self assert: (atacado tienePuntosDeVida: 16*pv).! !

!CombatientesTest methodsFor: 'tests' stamp: 'JMB 3/4/2023 12:58:02'!
test03UnHachaHace10DeDaño
	atacante equiparConUnHacha.
	
	atacante atacarA: atacado.
	
	self assert: (atacado tienePuntosDeVida: 10*pv).! !

!CombatientesTest methodsFor: 'tests' stamp: 'JMB 3/4/2023 12:57:31'!
test04UnEspadaHace8DeDaño
	atacante equiparConUnaEspada.
	
	atacante atacarA: atacado.
	
	self assert: (atacado tienePuntosDeVida: 12*pv).! !

!CombatientesTest methodsFor: 'tests' stamp: 'JMB 3/4/2023 12:58:33'!
test05UnMartilloHace8DeDaño
	atacante equiparConUnMartillo.
	
	atacante atacarA: atacado.
	
	self assert: (atacado tienePuntosDeVida: 12*pv).! !

!CombatientesTest methodsFor: 'tests' stamp: 'JMB 3/4/2023 12:57:20'!
test06UnaDagaHace4DeDaño
	atacante equiparConUnaDaga.
	
	atacante atacarA: atacado.
	
	self assert: (atacado tienePuntosDeVida: 16*pv).! !

!CombatientesTest methodsFor: 'tests' stamp: 'JMB 3/4/2023 12:58:21'!
test07UnaLanzaHace8DeDaño
	atacante equiparConUnaLanza.
	
	atacante atacarA: atacado.
	
	self assert: (atacado tienePuntosDeVida: 12*pv).! !

!CombatientesTest methodsFor: 'tests' stamp: 'JMB 3/4/2023 12:58:48'!
test08UnPaloHace6DeDaño
	atacante equiparConUnPalo.
	
	atacante atacarA: atacado.
	
	self assert: (atacado tienePuntosDeVida: 14*pv).! !

!CombatientesTest methodsFor: 'tests' stamp: 'JMB 3/4/2023 12:58:02'!
test09LaArmaduraDeMetalAbsorve6DeDaño 
	atacante equiparConUnHacha.
	atacado equiparConUnaArmaduraDeMetal.
	
	atacante atacarA: atacado.
	
	self assert: (atacado tienePuntosDeVida: 16*pv).! !

!CombatientesTest methodsFor: 'tests' stamp: 'JMB 3/4/2023 12:58:02'!
test10LaArmaduraDeAnillosAbsorve4DeDaño 
	atacante equiparConUnHacha.
	atacado equiparConUnaArmaduraDeAnillos.
	
	atacante atacarA: atacado.
	
	self assert: (atacado tienePuntosDeVida: 14*pv).! !

!CombatientesTest methodsFor: 'tests' stamp: 'JMB 3/4/2023 12:58:02'!
test11LaArmaduraDeCueroAbsorve2DeDaño 
	atacante equiparConUnHacha.
	atacado equiparConUnaArmaduraDeCuero.
	
	atacante atacarA: atacado.
	
	self assert: (atacado tienePuntosDeVida: 12*pv).! !


!CombatientesTest methodsFor: 'setUp/tearDown' stamp: 'JMB 3/5/2023 21:56:02'!
setUp
	atacante := Combatiente humanoide.
	atacado := Combatiente humanoide.

	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CombatientesTest class' category: 'AlgoIII-2023-1C-1Parcial-CombatientesFantasticos-P3'!
CombatientesTest class
	instanceVariableNames: ''!

!CombatientesTest class methodsFor: 'class initialization' stamp: 'JMB 10/16/2022 11:11:15'!
initialize

	"Este método está para crear unidades. No se debe tocar"

	| puntosDeVida |
	super initialize.
	puntosDeVida := BaseUnit named: 'puntosDeVida' sign: 'pv'.

	Smalltalk at: #pv put: puntosDeVida.
	Smalltalk at: #puntosDeVida put: puntosDeVida.! !


!classDefinition: #EstrategiasTest category: 'AlgoIII-2023-1C-1Parcial-CombatientesFantasticos-P3'!
TestCase subclass: #EstrategiasTest
	instanceVariableNames: 'arthas mankrik olgra'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2023-1C-1Parcial-CombatientesFantasticos-P3'!

!EstrategiasTest methodsFor: 'combatientes' stamp: 'SF 10/11/2022 22:03:48'!
combatienteHumanoArthas
	^arthas! !

!EstrategiasTest methodsFor: 'combatientes' stamp: 'SF 10/11/2022 22:04:48'!
combatienteOrcoMankrik
	^mankrik! !

!EstrategiasTest methodsFor: 'combatientes' stamp: 'SF 10/11/2022 22:04:54'!
combatienteOrcoOlgra
	^olgra! !


!EstrategiasTest methodsFor: 'tests' stamp: 'JMB 10/18/2022 21:34:26'!
test01FocalizarEnElMasHeridoEsMejorQueEnElMasSano
	
	self assert: self puntosDeVidaDelGanadorFocalizandoEnElMasHerido > self puntosDeVidaDelGanadorFocalizandoEnElMasSano.! !


!EstrategiasTest methodsFor: 'combates' stamp: 'JMB 3/4/2023 12:58:02'!
orquestadorParaArthasUsandoUnHachaYConFocoEnElMasHeridoVsOrcos
	
	self prepararCombatientes.
	self combatienteHumanoArthas focalizarEnElMasHerido. 
	self combatienteHumanoArthas equiparConUnHacha.
	^OrquestadorDeCombates
		establecerCombateEntreBando1: {self combatienteHumanoArthas } contraBando2: { self combatienteOrcoOlgra. self combatienteOrcoMankrik }.
! !

!EstrategiasTest methodsFor: 'combates' stamp: 'JMB 3/4/2023 12:58:02'!
orquestadorParaArthasUsandoUnHachaYConFocoEnElMasSanoVsOrcos
	
	self prepararCombatientes.
	self combatienteHumanoArthas focalizarEnElMasSano. 
	self combatienteHumanoArthas equiparConUnHacha.
	^OrquestadorDeCombates
			establecerCombateEntreBando1: {self combatienteHumanoArthas } contraBando2: { self combatienteOrcoOlgra. self combatienteOrcoMankrik }.
! !

!EstrategiasTest methodsFor: 'combates' stamp: 'SF 10/10/2022 18:32:49'!
puntosDeVidaDelGanadorFocalizandoEnElMasHerido
	| orquestadorDeCombates |
	orquestadorDeCombates := self orquestadorParaArthasUsandoUnHachaYConFocoEnElMasHeridoVsOrcos.
	orquestadorDeCombates desarrollarDuranteRondas: 100.
	^ self combatienteHumanoArthas puntosDeVida! !

!EstrategiasTest methodsFor: 'combates' stamp: 'SF 10/10/2022 18:32:49'!
puntosDeVidaDelGanadorFocalizandoEnElMasSano
	| orquestadorDeCombates |
	orquestadorDeCombates := self orquestadorParaArthasUsandoUnHachaYConFocoEnElMasSanoVsOrcos.
	orquestadorDeCombates desarrollarDuranteRondas: 100.
	^ self combatienteHumanoArthas puntosDeVida! !


!EstrategiasTest methodsFor: 'private' stamp: 'JMB 3/5/2023 21:59:55'!
prepararCombatientes
	arthas := Combatiente humanoide.
	olgra := Combatiente humanoide.
	mankrik := Combatiente humanoide.! !


!classDefinition: #OrquestadorDeCombatesTest category: 'AlgoIII-2023-1C-1Parcial-CombatientesFantasticos-P3'!
TestCase subclass: #OrquestadorDeCombatesTest
	instanceVariableNames: 'arthas olgra mankrik'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2023-1C-1Parcial-CombatientesFantasticos-P3'!

!OrquestadorDeCombatesTest methodsFor: 'combates' stamp: 'SF 10/10/2022 19:37:28'!
orquestadorParaCombateArthasConFocoEnElMasSanoVsOrcos	
	
	self prepararCombatientes.
	self combatienteHumanoArthas focalizarEnElMasSano. 
	^self establecerCombateEntreBando1: {self combatienteHumanoArthas } contraBando2: { self combatienteOrcoOlgra. self combatienteOrcoMankrik }.
! !

!OrquestadorDeCombatesTest methodsFor: 'combates' stamp: 'JMB 3/4/2023 12:56:47'!
orquestadorParaCombateArthasInmuneYFocoEnElMasHeridoVsOrcos	
	
	self prepararCombatientes.
	self combatienteHumanoArthas atacarA: self combatienteOrcoOlgra.
	self combatienteHumanoArthas equiparConUnaArmaduraDeMetal. 
	self combatienteHumanoArthas focalizarEnElMasHerido. 
	^self establecerCombateEntreBando1:  {self combatienteHumanoArthas } contraBando2: { self combatienteOrcoOlgra. self combatienteOrcoMankrik }.
! !

!OrquestadorDeCombatesTest methodsFor: 'combates' stamp: 'SF 10/9/2022 12:55:39'!
orquestadorParaCombateArthasVsOlgra	
	
	self prepararCombatientes. 
	^OrquestadorDeCombates establecerCombateEntreBando1: {self combatienteHumanoArthas } contraBando2: { self combatienteOrcoOlgra }.
! !

!OrquestadorDeCombatesTest methodsFor: 'combates' stamp: 'SF 10/11/2022 21:54:06'!
orquestadorParaCombateArthasVsOrcos
	self prepararCombatientes.
	^self establecerCombateEntreBando1: { self combatienteHumanoArthas } contraBando2: {self combatienteOrcoOlgra. self combatienteOrcoMankrik }.
! !

!OrquestadorDeCombatesTest methodsFor: 'combates' stamp: 'JMB 3/4/2023 12:57:31'!
orquestadorParaCombateManoAManoConBando2Inmune	
	
	self prepararCombatientes.
	self combatienteOrcoOlgra equiparConUnaEspada.
	^self establecerCombateEntreBando1: {self combatienteHumanoArthas } contraBando2: { self combatienteOrcoOlgra }.
! !

!OrquestadorDeCombatesTest methodsFor: 'combates' stamp: 'SF 10/10/2022 19:46:34'!
orquestadorParaCombateOrcosVsArthas
	self prepararCombatientes.
	^self establecerCombateEntreBando1: {self combatienteOrcoOlgra. self combatienteOrcoMankrik } contraBando2: { self combatienteHumanoArthas }.
! !

!OrquestadorDeCombatesTest methodsFor: 'combates' stamp: 'SF 10/11/2022 21:53:53'!
orquestadorParaCombateOrcosVsArthasConFocoEnElMasSano	
	
	self prepararCombatientes.
	self combatienteHumanoArthas focalizarEnElMasSano. 
	^self establecerCombateEntreBando1: { self combatienteOrcoOlgra. self combatienteOrcoMankrik } contraBando2: {self combatienteHumanoArthas }. 
! !

!OrquestadorDeCombatesTest methodsFor: 'combates' stamp: 'JMB 3/4/2023 12:56:47'!
orquestadorParaCombateOrcosVsArthasInmuneYFocoEnElMasHerido	
	
	self prepararCombatientes.
	self combatienteHumanoArthas atacarA: self combatienteOrcoOlgra.
	self combatienteHumanoArthas equiparConUnaArmaduraDeMetal. 
	self combatienteHumanoArthas focalizarEnElMasHerido. 
	^self establecerCombateEntreBando1: { self combatienteOrcoOlgra. self combatienteOrcoMankrik } contraBando2: {self combatienteHumanoArthas }.
! !

!OrquestadorDeCombatesTest methodsFor: 'combates' stamp: 'JMB 3/5/2023 21:58:31'!
prepararCombatientes

	arthas := Combatiente humanoide. 
	olgra := Combatiente humanoide. 
	mankrik := Combatiente humanoide. ! !


!OrquestadorDeCombatesTest methodsFor: 'tests - mano a mano' stamp: 'JMB 10/18/2022 21:35:14'!
test01AlDesarrollarUnCombateSinRondasLosCombatientesNoSeAtacan
	
	| orquestadorDeCombates |
	orquestadorDeCombates := self orquestadorParaCombateArthasVsOlgra.
	
	orquestadorDeCombates desarrollarDuranteRondas: 0.
	
	self assert: self combatienteHumanoArthas noEstaHerido.
	self assert: self combatienteOrcoOlgra noEstaHerido.! !

!OrquestadorDeCombatesTest methodsFor: 'tests - mano a mano' stamp: 'JMB 10/18/2022 21:35:32'!
test02AlDesarrollarUnCombateManoAManoDeUnaRondaLosBandosSeAtacanUnaVez
	
	| orquestadorDeCombates |
	orquestadorDeCombates := self orquestadorParaCombateArthasVsOlgra.
	
	orquestadorDeCombates desarrollarDuranteRondas: 1.
	
	self assert: (self combatienteHumanoArthas tienePuntosDeVida: 18*pv) description: 'Arthas debe recibir un puñetazo (2 de daño)'.
	self assert: (self combatienteOrcoOlgra tienePuntosDeVida: 18*pv) description: 'Olgra debe recibir un puñetazo (2 de daño)'.! !

!OrquestadorDeCombatesTest methodsFor: 'tests - mano a mano' stamp: 'JMB 10/18/2022 21:35:47'!
test03AlDesarrollarUnCombateManoAManoConMasDeUnaRondaLosBandosSeAtacanCadaVez
	
	| orquestadorDeCombates |
	orquestadorDeCombates := self orquestadorParaCombateArthasVsOlgra.
	
	orquestadorDeCombates desarrollarDuranteRondas: 2.
	
	self assert: (self combatienteHumanoArthas tienePuntosDeVida: 16*pv) description: 'Arthas debe recibir dos puñetazos (4 de daño)'.
	self assert: (self combatienteOrcoOlgra tienePuntosDeVida: 16*pv) description: 'Olgra debe recibir dos puñetazos (4 de daño)'.! !

!OrquestadorDeCombatesTest methodsFor: 'tests - mano a mano' stamp: 'SF 10/9/2022 12:33:46'!
test04AlDesarrollarUnCombateManoAManoSinGanadoresElResultadoEsIndeterminado
	
	| orquestadorDeCombates resultado |
	orquestadorDeCombates := self orquestadorParaCombateArthasVsOlgra.
	
	resultado := orquestadorDeCombates desarrollarDuranteRondas: 0.
	
	self assertElResultadoIndicaQueNoHayGanador: resultado alcanzadaLaRonda: 0.! !

!OrquestadorDeCombatesTest methodsFor: 'tests - mano a mano' stamp: 'SF 10/9/2022 12:33:45'!
test05AlDesarrollarUnCombateManoAManoGanaElBando1CuandoDejaFueraDeCombateASuRival
	
	| orquestadorDeCombates resultado |
	orquestadorDeCombates := self orquestadorParaCombateArthasVsOlgra.
	
	resultado := orquestadorDeCombates desarrollarDuranteRondas: 10.
	
	self assertElResultadoIndicaQueGanoElBando1: resultado alcanzadaLaRonda: 10.! !

!OrquestadorDeCombatesTest methodsFor: 'tests - mano a mano' stamp: 'SF 10/9/2022 12:33:45'!
test06AlDesarrollarUnCombateCuandoHayUnGanadorFinalizaEnLaRondaQueElPerdedorQuedoFueraDeCombate
	
	| orquestadorDeCombates resultado |
	orquestadorDeCombates := self orquestadorParaCombateArthasVsOlgra.
	
	resultado := orquestadorDeCombates desarrollarDuranteRondas: 11.
	
	self assertElResultadoIndicaQueGanoElBando1: resultado alcanzadaLaRonda: 10.! !

!OrquestadorDeCombatesTest methodsFor: 'tests - mano a mano' stamp: 'SF 10/9/2022 12:33:46'!
test07AlDesarrollarUnCombateManoAManoGanaElBando2CuandoDejaFueraDeCombateASuRival
	
	| orquestadorDeCombates resultado |
	orquestadorDeCombates := self orquestadorParaCombateManoAManoConBando2Inmune.
	
	resultado := orquestadorDeCombates desarrollarDuranteRondas: 100.
	
	self assertElResultadoIndicaQueGanoElBando2: resultado alcanzadaLaRonda: 3.! !


!OrquestadorDeCombatesTest methodsFor: 'tests - muches vs muches' stamp: 'JMB 10/18/2022 21:36:08'!
test08AlDesarrollarUnCombateLosDelBando1PuedenAtacarACualquieraDelBando2
	
	| orquestadorDeCombates |
	orquestadorDeCombates := self orquestadorParaCombateArthasConFocoEnElMasSanoVsOrcos.
	
	orquestadorDeCombates desarrollarDuranteRondas: 2.
	
	self assert: self combatienteOrcoOlgra estaHerido. 
	self assert: self combatienteOrcoMankrik estaHerido. ! !

!OrquestadorDeCombatesTest methodsFor: 'tests - muches vs muches' stamp: 'SF 10/11/2022 21:53:23'!
test09AlDesarrollarUnCombateAtacanTodesLosDelBando1EnCadaRonda
	"
		En cada ronda cada combatiente daña al que esta solo por 2 de daño cada uno
	"
	| orquestadorDeCombates resultado |
	orquestadorDeCombates := self orquestadorParaCombateOrcosVsArthas.
	
	resultado := orquestadorDeCombates desarrollarDuranteRondas: 5.
	
	self assertElResultadoIndicaQueGanoElBando1: resultado alcanzadaLaRonda: 5.! !

!OrquestadorDeCombatesTest methodsFor: 'tests - muches vs muches' stamp: 'JMB 10/18/2022 21:36:18'!
test10AlDesarrollarUnCombateLosDelBando2PuedenAtacarACualquieraDelBando1
	
	| orquestadorDeCombates |
	orquestadorDeCombates := self orquestadorParaCombateOrcosVsArthasConFocoEnElMasSano.
	
	orquestadorDeCombates desarrollarDuranteRondas: 2.
	
	self assert: self combatienteOrcoOlgra estaHerido. 
	self assert: self combatienteOrcoMankrik estaHerido. ! !

!OrquestadorDeCombatesTest methodsFor: 'tests - muches vs muches' stamp: 'SF 10/11/2022 21:55:18'!
test11AlDesarrollarUnCombateAtacanTodesLosDelBando2EnCadaRonda
	"
		En cada ronda cada combatiente daña en 2 al del otro bando. 4 de daño en total por turno.
	"
	| orquestadorDeCombates resultado |
	orquestadorDeCombates := self orquestadorParaCombateArthasVsOrcos.
	
	resultado := orquestadorDeCombates desarrollarDuranteRondas: 5.
	
	self assertElResultadoIndicaQueGanoElBando2: resultado alcanzadaLaRonda: 5.! !

!OrquestadorDeCombatesTest methodsFor: 'tests - muches vs muches' stamp: 'SF 10/9/2022 12:33:46'!
test12AlDesarrollarUnCombateLosDelBando1NoGananSiTodosLosDelBando2NoEstanFueraDeCombate
	
	| orquestadorDeCombates resultado |
	orquestadorDeCombates := self orquestadorParaCombateArthasInmuneYFocoEnElMasHeridoVsOrcos.
	
	resultado := orquestadorDeCombates desarrollarDuranteRondas: 10.
	
	self assertElResultadoIndicaQueNoHayGanador: resultado alcanzadaLaRonda: 10.! !

!OrquestadorDeCombatesTest methodsFor: 'tests - muches vs muches' stamp: 'SF 10/9/2022 12:33:46'!
test13AlDesarrollarUnCombateLosDelBando2NoGananSiTodosLosDelBando1NoEstanFueraDeCombate
	
	| orquestadorDeCombates resultado |
	orquestadorDeCombates := self orquestadorParaCombateOrcosVsArthasInmuneYFocoEnElMasHerido.
	
	resultado := orquestadorDeCombates desarrollarDuranteRondas: 10.
	
	self assertElResultadoIndicaQueNoHayGanador: resultado alcanzadaLaRonda: 10.! !


!OrquestadorDeCombatesTest methodsFor: 'para completar' stamp: 'JMB 10/18/2022 21:36:30'!
assertElResultadoIndicaQueGanoElBando1: resultadoDeUnCombate alcanzadaLaRonda: unNumeroDeRondaEsperado

	self assert: (resultadoDeUnCombate tieneDeGanadorAlBando1Realizando: unNumeroDeRondaEsperado)! !

!OrquestadorDeCombatesTest methodsFor: 'para completar' stamp: 'JMB 10/18/2022 21:36:36'!
assertElResultadoIndicaQueGanoElBando2: resultadoDeUnCombate alcanzadaLaRonda: unNumeroDeRondaEsperado

	self assert: (resultadoDeUnCombate tieneDeGanadorAlBando2Realizando: unNumeroDeRondaEsperado)! !

!OrquestadorDeCombatesTest methodsFor: 'para completar' stamp: 'JMB 10/18/2022 21:36:41'!
assertElResultadoIndicaQueNoHayGanador: resultadoDeUnCombate  alcanzadaLaRonda: unNumeroDeRondaEsperado

	self assert:  (resultadoDeUnCombate finalizoSinGanadoresRealizando: unNumeroDeRondaEsperado)! !

!OrquestadorDeCombatesTest methodsFor: 'para completar' stamp: 'SF 10/10/2022 18:42:57'!
establecerCombateEntreBando1: unBando1 contraBando2: unBando2

	^OrquestadorDeCombates establecerCombateEntreBando1: unBando1 contraBando2: unBando2.! !


!OrquestadorDeCombatesTest methodsFor: 'combatientes' stamp: 'SF 10/10/2022 19:26:44'!
combatienteHumanoArthas

	^arthas.! !

!OrquestadorDeCombatesTest methodsFor: 'combatientes' stamp: 'SF 10/10/2022 19:26:34'!
combatienteOrcoMankrik

	^mankrik.! !

!OrquestadorDeCombatesTest methodsFor: 'combatientes' stamp: 'SF 10/10/2022 19:26:39'!
combatienteOrcoOlgra

	^olgra.! !


!classDefinition: #Combatiente category: 'AlgoIII-2023-1C-1Parcial-CombatientesFantasticos-P3'!
Object subclass: #Combatiente
	instanceVariableNames: 'puntosDeVida enemigos estrategia dañoAAbsorber dañoAInfligirPorArma tipo aliados ogroYaAtaco'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2023-1C-1Parcial-CombatientesFantasticos-P3'!

!Combatiente methodsFor: 'equipo' stamp: 'JMB 3/4/2023 13:23:58'!
equiparConUnHacha
	dañoAInfligirPorArma := 10 * pv.! !

!Combatiente methodsFor: 'equipo' stamp: 'JMB 3/4/2023 13:23:58'!
equiparConUnMartillo
	dañoAInfligirPorArma := 8 * pv.! !

!Combatiente methodsFor: 'equipo' stamp: 'JMB 3/4/2023 13:23:58'!
equiparConUnPalo
	dañoAInfligirPorArma _ 6 * pv.! !

!Combatiente methodsFor: 'equipo' stamp: 'JMB 3/4/2023 12:56:21'!
equiparConUnaArmaduraDeAnillos
	dañoAAbsorber _ 4 * pv.! !

!Combatiente methodsFor: 'equipo' stamp: 'JMB 3/4/2023 12:56:34'!
equiparConUnaArmaduraDeCuero
	dañoAAbsorber _ 2 * pv.! !

!Combatiente methodsFor: 'equipo' stamp: 'JMB 3/4/2023 12:56:47'!
equiparConUnaArmaduraDeMetal
	dañoAAbsorber := 6 * pv.! !

!Combatiente methodsFor: 'equipo' stamp: 'JMB 3/4/2023 13:23:58'!
equiparConUnaDaga
	dañoAInfligirPorArma _ 4 * pv.! !

!Combatiente methodsFor: 'equipo' stamp: 'JMB 3/4/2023 13:23:58'!
equiparConUnaEspada
	dañoAInfligirPorArma := 8 * pv.! !

!Combatiente methodsFor: 'equipo' stamp: 'JMB 3/4/2023 13:23:58'!
equiparConUnaLanza
	dañoAInfligirPorArma := 8 * pv.! !


!Combatiente methodsFor: 'private' stamp: 'JMB 5/8/2023 20:53:16'!
dañoAInfligir

	tipo = #humanoide ifTrue: [ ^ dañoAInfligirPorArma ].
	tipo = #dragon ifTrue: [ ^ 8*pv ].
	tipo = #ogro ifTrue: [ ^ 20*pv ].
	tipo = #curador ifTrue: [ ^ dañoAInfligirPorArma ].
	
	self error: 'tipo desconocido: ', tipo asString.! !

!Combatiente methodsFor: 'private' stamp: 'SF 7/13/2022 22:24:44'!
puntosDeVida
	^puntosDeVida! !

!Combatiente methodsFor: 'private' stamp: 'JMB 3/4/2023 20:17:50'!
puntosDeVidaIniciales
	tipo = #dragon ifTrue: [^ 200 * pv].
	tipo = #ogro ifTrue: [^ 60 * pv].
	tipo = #ilusionista ifTrue: [^ 20 * pv].
	tipo = #curador ifTrue: [^ 20 * pv].
	tipo = #humanoide ifTrue: [^ 20 * pv].
	
	self error: 'tipo desconocido: ', tipo asString.! !


!Combatiente methodsFor: 'estrategia' stamp: 'SF 10/15/2022 18:28:31'!
estrategiaACualquiera

	^ [:candidatos | candidatos anyOne]! !

!Combatiente methodsFor: 'estrategia' stamp: 'SF 8/21/2022 10:33:13'!
focalizarEnElMasHerido
	estrategia := [:candidatos | candidatos detectMin: [:enemigo | enemigo puntosDeVida]].! !

!Combatiente methodsFor: 'estrategia' stamp: 'SF 8/21/2022 10:39:02'!
focalizarEnElMasSano
	estrategia := [:candidatos | candidatos detectMax: [:enemigo | enemigo puntosDeVida]].! !


!Combatiente methodsFor: 'combate' stamp: 'JMB 5/14/2023 13:11:30'!
aliados: luchadores 
	aliados := luchadores.! !

!Combatiente methodsFor: 'combate' stamp: 'JMB 5/14/2023 13:18:20'!
atacar
	| contrincanteSeleccionado enemigosActivos |
	self estaFueraDeCombate ifTrue: [^self].

	tipo = #curador ifTrue: [
		| indice compañero |
		indice := 1.
		[ indice <= aliados size ] whileTrue: [
			compañero := aliados at: indice. 
			compañero recibirCuracion: 2*pv.
			indice := indice + 1.
		].
		^self.
	].

	enemigosActivos := enemigos select: [:enemigo | enemigo estaFueraDeCombate not].
	enemigosActivos isEmpty ifTrue: [^self].
	
	tipo = #humanoide ifTrue: [
		contrincanteSeleccionado := estrategia value: enemigosActivos.
		self atacarA: contrincanteSeleccionado.
		^self.
	].
	
	tipo = #dragon ifTrue: [
		| indice enemigoAAtacar enemigosParaElWhile | 
		enemigosParaElWhile := enemigosActivos firstAvailable: 8.
		indice := 1.
		[ indice <= enemigosParaElWhile size ] whileTrue: [
			enemigoAAtacar := enemigosParaElWhile at: indice. 
			self atacarA: enemigoAAtacar.
			indice := indice + 1.
		].
		^self.
	].

	tipo = #ilusionista ifTrue: [
		contrincanteSeleccionado := estrategia value: enemigosActivos.
		self atacarA: contrincanteSeleccionado.
		^self.
	].


	tipo = #ogro ifTrue: [
		ogroYaAtaco ifTrue: [
			contrincanteSeleccionado := estrategia value: enemigosActivos.
			self atacarA: contrincanteSeleccionado.
			ogroYaAtaco := false.
			^self.
			].
		ogroYaAtaco := true.
		^self.
	].
	
	self error: 'tipo desconocido: ', tipo asString.
	! !

!Combatiente methodsFor: 'combate' stamp: 'JMB 5/14/2023 13:12:04'!
atacarA: unCombatiente

	self estaFueraDeCombate ifTrue: [^self].
	tipo = #ilusionista ifTrue: [
		| indice enemigo victima aliadosDeUnCombatienteASerAtacado |
		aliadosDeUnCombatienteASerAtacado := OrderedCollection new.
		indice := 1.
		[ indice <= enemigos size ] whileTrue: [
			enemigo := enemigos at: indice. 
			indice := indice + 1.
			enemigo = unCombatiente ifFalse: [
				aliadosDeUnCombatienteASerAtacado add: enemigo
			]. 
			
		].
		aliadosDeUnCombatienteASerAtacado isEmpty ifTrue: [^ self].
		victima :=  aliadosDeUnCombatienteASerAtacado anyOne.
		unCombatiente atacarA: victima.
		^ self
	].
	unCombatiente recibirDaño: self dañoAInfligir.! !

!Combatiente methodsFor: 'combate' stamp: 'SF 8/20/2022 11:56:44'!
enemigos: unConjuntoDeEnemigos
	enemigos := unConjuntoDeEnemigos! !

!Combatiente methodsFor: 'combate' stamp: 'SF 10/10/2022 11:06:47'!
estaFueraDeCombate
	^puntosDeVida <= (0*pv).! !

!Combatiente methodsFor: 'combate' stamp: 'JMB 3/4/2023 20:27:11'!
estaHerido
	^puntosDeVida < self puntosDeVidaIniciales! !

!Combatiente methodsFor: 'combate' stamp: 'SF 10/9/2022 19:18:00'!
noEstaHerido
	^self estaHerido not.! !

!Combatiente methodsFor: 'combate' stamp: 'JMB 5/14/2023 13:11:41'!
recibirCuracion: unEntero
	
	puntosDeVida := puntosDeVida + unEntero.
	puntosDeVida := puntosDeVida min: self puntosDeVidaIniciales.! !

!Combatiente methodsFor: 'combate' stamp: 'JMB 3/4/2023 13:32:21'!
recibirDaño: unaCantidadDeDaño  
	| dañoADescontar |
	dañoADescontar := (unaCantidadDeDaño - dañoAAbsorber) max: 0*pv.
	puntosDeVida := puntosDeVida - dañoADescontar.! !

!Combatiente methodsFor: 'combate' stamp: 'SF 10/9/2022 12:56:52'!
tienePuntosDeVida: unaCantidadDePuntosDeVida
	^puntosDeVida = unaCantidadDePuntosDeVida.! !


!Combatiente methodsFor: 'initialization' stamp: 'JMB 5/8/2023 20:48:39'!
initializeConTipo: unTipoDeCombatiente 
	tipo _ unTipoDeCombatiente.
	puntosDeVida := self puntosDeVidaIniciales.
	enemigos := OrderedCollection new.
	estrategia := self estrategiaACualquiera.
	dañoAInfligirPorArma _ 2*pv.
	dañoAAbsorber _ 0.	
	aliados := #().
	ogroYaAtaco := false.! !


!Combatiente methodsFor: 'printing' stamp: 'JMB 3/4/2023 13:42:41'!
printOn: aStream
	aStream 
		nextPutAll: 'un'; 
		space;
		nextPutAll: self class name;
		nextPutAll: ' ('.
	
	puntosDeVida printOn: aStream.
	aStream nextPut: $/.
	self puntosDeVidaIniciales printOn: aStream.
	aStream nextPut: $).! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Combatiente class' category: 'AlgoIII-2023-1C-1Parcial-CombatientesFantasticos-P3'!
Combatiente class
	instanceVariableNames: ''!

!Combatiente class methodsFor: 'instance creation' stamp: 'JMB 3/5/2023 21:55:15'!
conTipo: aSymbol 
	^self new initializeConTipo: aSymbol ! !

!Combatiente class methodsFor: 'instance creation' stamp: 'JMB 2/23/2023 21:57:27'!
curador
	^self conTipo: #curador.! !

!Combatiente class methodsFor: 'instance creation' stamp: 'JMB 2/23/2023 21:57:34'!
dragon
	^self conTipo: #dragon! !

!Combatiente class methodsFor: 'instance creation' stamp: 'JMB 3/4/2023 13:50:20'!
humanoide
	^ self conTipo: #humanoide.! !

!Combatiente class methodsFor: 'instance creation' stamp: 'JMB 2/23/2023 21:57:39'!
ilusionista
	^self conTipo: #ilusionista! !

!Combatiente class methodsFor: 'instance creation' stamp: 'JMB 2/23/2023 21:57:45'!
ogro
	^ self conTipo: #ogro.! !


!classDefinition: #OrquestadorDeCombates category: 'AlgoIII-2023-1C-1Parcial-CombatientesFantasticos-P3'!
Object subclass: #OrquestadorDeCombates
	instanceVariableNames: 'bando1 bando2'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2023-1C-1Parcial-CombatientesFantasticos-P3'!

!OrquestadorDeCombates methodsFor: 'initializing' stamp: 'SF 10/9/2022 12:50:01'!
initializeEstablecerCombateEntreBando1: unConjuntoDeCombatientes contraBando2: otroConjuntoDeCombatientes
	bando1 := unConjuntoDeCombatientes.
	bando2 := otroConjuntoDeCombatientes.! !


!OrquestadorDeCombates methodsFor: 'public' stamp: 'SF 10/10/2022 18:51:38'!
desarrollarDuranteRondas: maximoDeRondas
	| rondaActual |
	rondaActual := 1.
	[rondaActual <= maximoDeRondas and: [self noHayGanador]] whileTrue: [
		bando1 do: [ :combatiente | combatiente atacar].
		bando2 do: [ :combatiente | combatiente atacar].
		rondaActual := rondaActual + 1.
	].
	rondaActual := rondaActual - 1.
	self esBando1Ganador ifTrue: [^ResultadoDeCombate conGanadorBando1EnRonda: rondaActual].
	self esBando2Ganador ifTrue: [^ResultadoDeCombate conGanadorBando2EnRonda: rondaActual].
	^ResultadoDeCombate indeterminadoEnRonda: rondaActual.! !


!OrquestadorDeCombates methodsFor: 'private' stamp: 'SF 10/10/2022 11:02:11'!
esBando1Ganador
	^(self hayAlMenosUnCombatienteEnCombateEn: bando1) and: [self todosEstanFueraDeCombateEn: bando2].
	! !

!OrquestadorDeCombates methodsFor: 'private' stamp: 'SF 10/10/2022 11:19:32'!
esBando2Ganador
	^(self hayAlMenosUnCombatienteEnCombateEn: bando2) and: [self todosEstanFueraDeCombateEn: bando1].! !

!OrquestadorDeCombates methodsFor: 'private' stamp: 'SF 10/10/2022 11:03:52'!
hayAlMenosUnCombatienteEnCombateEn: unConjuntoDeCombatientes
	^unConjuntoDeCombatientes anySatisfy: [:combatiente | combatiente estaFueraDeCombate not].! !

!OrquestadorDeCombates methodsFor: 'private' stamp: 'SF 10/10/2022 11:18:59'!
noHayGanador
	^self esBando1Ganador not and: [self esBando2Ganador not].! !

!OrquestadorDeCombates methodsFor: 'private' stamp: 'SF 10/10/2022 11:07:32'!
todosEstanFueraDeCombateEn: unConjuntoDeCombatientes
	^unConjuntoDeCombatientes allSatisfy: [:combatiente | combatiente estaFueraDeCombate].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OrquestadorDeCombates class' category: 'AlgoIII-2023-1C-1Parcial-CombatientesFantasticos-P3'!
OrquestadorDeCombates class
	instanceVariableNames: ''!

!OrquestadorDeCombates class methodsFor: 'instance creation' stamp: 'SF 2/24/2023 21:20:26'!
establecerCombateEntreBando1: bando1 contraBando2: bando2
	self relacionar: bando1 con: bando2.
	^self new initializeEstablecerCombateEntreBando1: bando1 contraBando2: bando2 ! !


!OrquestadorDeCombates class methodsFor: 'as yet unclassified' stamp: 'SF 10/9/2022 19:29:24'!
enemistar: unBandoDeCombatientes con: otroBandoDeCombatientes
	unBandoDeCombatientes do: [ :combatiente | combatiente enemigos: otroBandoDeCombatientes ].
	otroBandoDeCombatientes do: [ :combatiente | combatiente enemigos: unBandoDeCombatientes ].! !

!OrquestadorDeCombates class methodsFor: 'as yet unclassified' stamp: 'SF 2/24/2023 21:20:26'!
relacionar: unBandoDeCombatientes con: otroBandoDeCombatientes
	unBandoDeCombatientes do: [ :combatiente | 
		combatiente enemigos: otroBandoDeCombatientes.
		combatiente aliados: unBandoDeCombatientes.].
	otroBandoDeCombatientes do: [ :combatiente | 
		combatiente enemigos: unBandoDeCombatientes.
		combatiente aliados: otroBandoDeCombatientes].! !


!classDefinition: #ResultadoDeCombate category: 'AlgoIII-2023-1C-1Parcial-CombatientesFantasticos-P3'!
Object subclass: #ResultadoDeCombate
	instanceVariableNames: 'numeroDeRonda ganador'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2023-1C-1Parcial-CombatientesFantasticos-P3'!

!ResultadoDeCombate methodsFor: 'public' stamp: 'JMB 3/4/2023 13:03:59'!
finalizoSinGanadores

	^ ganador = self elGanadorEsIndeterminado! !

!ResultadoDeCombate methodsFor: 'public' stamp: 'JMB 3/4/2023 13:03:59'!
finalizoSinGanadoresRealizando: unaCantidadDeRondas
	^self finalizoSinGanadores and: [numeroDeRonda = unaCantidadDeRondas].! !

!ResultadoDeCombate methodsFor: 'public' stamp: 'SF 2/21/2023 13:51:09'!
tieneDeGanadorAlBando1
	^self elBando1Ganó = ganador.! !

!ResultadoDeCombate methodsFor: 'public' stamp: 'SF 2/21/2023 13:51:45'!
tieneDeGanadorAlBando1Realizando: unaCantidadDeRondas
	^self tieneDeGanadorAlBando1 and: [numeroDeRonda = unaCantidadDeRondas].! !

!ResultadoDeCombate methodsFor: 'public' stamp: 'SF 2/21/2023 14:49:32'!
tieneDeGanadorAlBando2
	^self elBando2Ganó = ganador.! !

!ResultadoDeCombate methodsFor: 'public' stamp: 'SF 2/21/2023 14:50:12'!
tieneDeGanadorAlBando2Realizando: unaCantidadDeRondas
	^self tieneDeGanadorAlBando2 and: [numeroDeRonda = unaCantidadDeRondas].! !


!ResultadoDeCombate methodsFor: 'initialization' stamp: 'SF 10/10/2022 11:10:22'!
initializeConGanadorBando1EnRonda: unNumeroDeRonda 
	ganador := self elBando1Ganó.
	numeroDeRonda := unNumeroDeRonda.! !

!ResultadoDeCombate methodsFor: 'initialization' stamp: 'SF 10/10/2022 19:02:08'!
initializeConGanadorBando2EnRonda: unNumeroDeRonda 
	ganador := self elBando2Ganó.
	numeroDeRonda := unNumeroDeRonda.! !

!ResultadoDeCombate methodsFor: 'initialization' stamp: 'SF 10/10/2022 11:15:24'!
initializeIndeterminadoEnRonda: unaCantidadDeRondas
	ganador := self elGanadorEsIndeterminado.
	numeroDeRonda := unaCantidadDeRondas.! !


!ResultadoDeCombate methodsFor: 'private' stamp: 'SF 10/10/2022 11:10:22'!
elBando1Ganó

	^ 'bando1'! !

!ResultadoDeCombate methodsFor: 'private' stamp: 'SF 10/10/2022 18:50:09'!
elBando2Ganó

	^ 'bando2'! !

!ResultadoDeCombate methodsFor: 'private' stamp: 'SF 10/10/2022 11:13:38'!
elGanadorEsIndeterminado
	^'indeterminado'.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ResultadoDeCombate class' category: 'AlgoIII-2023-1C-1Parcial-CombatientesFantasticos-P3'!
ResultadoDeCombate class
	instanceVariableNames: ''!

!ResultadoDeCombate class methodsFor: 'instance creation' stamp: 'SF 10/10/2022 11:08:18'!
conGanadorBando1EnRonda: unNumeroDeRonda
	^self new initializeConGanadorBando1EnRonda: unNumeroDeRonda! !

!ResultadoDeCombate class methodsFor: 'instance creation' stamp: 'SF 10/10/2022 18:57:31'!
conGanadorBando2EnRonda: aSmallInteger 
	^self new initializeConGanadorBando2EnRonda: aSmallInteger ! !

!ResultadoDeCombate class methodsFor: 'instance creation' stamp: 'SF 10/10/2022 11:12:29'!
indeterminadoEnRonda: unaCantidadDeRondas
	^self new initializeIndeterminadoEnRonda: unaCantidadDeRondas! !

CombatientesTest initialize!