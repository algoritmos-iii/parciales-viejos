!classDefinition: #AtacarTest category: 'AlgoIII-2023-1C-2Parcial-CombatientesFantasticos-P4'!
TestCase subclass: #AtacarTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2023-1C-2Parcial-CombatientesFantasticos-P4'!

!AtacarTest methodsFor: 'tests' stamp: 'JMB 5/8/2023 21:08:43'!
hacerQue: combatiente1 quedeMalDebidoA: combatiente2

	[combatiente1 puntosDeVida <= 0] whileFalse: [
		combatiente2 actuarSobre: combatiente1]! !

!AtacarTest methodsFor: 'tests' stamp: 'JMB 5/7/2023 14:03:45'!
nuevoCombatienteHumanoide

	^CombatienteHumanoide new! !

!AtacarTest methodsFor: 'tests' stamp: 'JMB 5/8/2023 21:04:23'!
test01CuandoUnCombatienteNoTieneEnemigosNoAtacaANadie
	| combatiente alguien |
	combatiente := self nuevoCombatienteHumanoide.
	alguien := self nuevoCombatienteHumanoide.
	
	combatiente actuar.
	
	self assert: (alguien noEstaHerido).
	
	! !

!AtacarTest methodsFor: 'tests' stamp: 'JMB 5/8/2023 21:04:23'!
test02CuandoUnCombatienteTieneEnemigosAtacaAUno
	| combatiente enemigo1 enemigo2 enemigo1Herido enemigo2Herido |
	combatiente := self nuevoCombatienteHumanoide.
	enemigo1 := self nuevoCombatienteHumanoide.
	enemigo2 := self nuevoCombatienteHumanoide.
	combatiente enemigos: {enemigo1. enemigo2.}.
	
	combatiente actuar.
	
	enemigo1Herido := enemigo1 estaHerido and: [enemigo2 noEstaHerido].
	enemigo2Herido := enemigo2 estaHerido and: [enemigo1 noEstaHerido].
	self assert: (enemigo1Herido or: [enemigo2Herido]).
	
	! !

!AtacarTest methodsFor: 'tests' stamp: 'JMB 5/8/2023 21:08:43'!
test03UnCombatientePuedeTenerComoEstrategiaAtacarAlMasHerido
	| combatiente enemigo1 enemigo2 enemigo2HeridoDosVeces |
	combatiente := self nuevoCombatienteHumanoide.
	enemigo1 := self nuevoCombatienteHumanoide.
	enemigo2 := self nuevoCombatienteHumanoide.
	combatiente enemigos: {enemigo1. enemigo2.}.
	combatiente actuarSobre: enemigo2.
	
	combatiente focalizarEnElMasHerido.
	combatiente actuar.
	
	enemigo2HeridoDosVeces := enemigo2 tienePuntosDeVida: 16 * pv.
	self assert: enemigo2HeridoDosVeces.
	
	! !

!AtacarTest methodsFor: 'tests' stamp: 'JMB 5/8/2023 21:08:43'!
test04UnCombatientePuedeTenerComoEstrategiaAtacarAlMasSano
	| combatiente enemigo1 enemigo2 elEnemigo1EstaHerido |
	combatiente := self nuevoCombatienteHumanoide.
	enemigo1 := self nuevoCombatienteHumanoide.
	enemigo2 := self nuevoCombatienteHumanoide.
	combatiente enemigos: {enemigo1. enemigo2.}.
	combatiente actuarSobre: enemigo2.
	
	combatiente focalizarEnElMasSano.
	combatiente actuar.
	
	elEnemigo1EstaHerido := enemigo1 tienePuntosDeVida: 18*pv.
	self assert: elEnemigo1EstaHerido.
	
	! !

!AtacarTest methodsFor: 'tests' stamp: 'JMB 5/8/2023 21:08:43'!
test05ElEnemigoFocalizadoMasSanoCambiaDinamicamente
	| combatiente enemigo1 enemigo2 |
	combatiente := self nuevoCombatienteHumanoide.
	enemigo1 := self nuevoCombatienteHumanoide.
	enemigo2 := self nuevoCombatienteHumanoide.
	combatiente enemigos: {enemigo1. enemigo2.}.
	combatiente actuarSobre: enemigo2.

	combatiente equiparConUnaEspada.	
	combatiente focalizarEnElMasSano.
	combatiente actuar.
	combatiente actuar.
	
	self assert: (enemigo1 tienePuntosDeVida: 12*pv).
	self assert: (enemigo2 tienePuntosDeVida: 10*pv).
	
	! !

!AtacarTest methodsFor: 'tests' stamp: 'JMB 5/8/2023 21:08:43'!
test06ElEnemigoFocalizadoMasHeridoCambiaDinamicamente
	| combatiente enemigo1 enemigo2 |
	combatiente := self nuevoCombatienteHumanoide.
	enemigo1 := self nuevoCombatienteHumanoide.
	enemigo2 := self nuevoCombatienteHumanoide.
	combatiente enemigos: {enemigo1. enemigo2.}.
	combatiente actuarSobre: enemigo2.

	combatiente equiparConUnaEspada.	
	combatiente focalizarEnElMasHerido.
	combatiente actuar.
	combatiente actuarSobre: enemigo1.
	combatiente actuarSobre: enemigo1.
	combatiente actuar.
	
	self assert: (enemigo1 tienePuntosDeVida: -4*pv).
	self assert: (enemigo2 tienePuntosDeVida: 10*pv).
	
	! !

!AtacarTest methodsFor: 'tests' stamp: 'JMB 5/8/2023 21:08:43'!
test07CuandoUnEnemigoEstaVencidoNoEsAtacadoMas
	| combatiente enemigoVencido enemigo2 |
	combatiente := self nuevoCombatienteHumanoide.
	enemigoVencido := self nuevoCombatienteHumanoide.
	enemigo2 := self nuevoCombatienteHumanoide.
	combatiente enemigos: {enemigoVencido. enemigo2.}.
	combatiente equiparConUnaEspada.	
	combatiente actuarSobre: enemigoVencido.
	combatiente actuarSobre: enemigoVencido.
	combatiente actuarSobre: enemigoVencido.

	combatiente focalizarEnElMasHerido.
	combatiente actuar.
	
	self assert: (enemigo2 tienePuntosDeVida: 12*pv).
	
	! !

!AtacarTest methodsFor: 'tests' stamp: 'JMB 5/8/2023 21:04:23'!
test08CuandoUnCombatienteEstaVencidoNoAtaca
	| combatiente enemigo |
	combatiente := self nuevoCombatienteHumanoide.
	enemigo := self nuevoCombatienteHumanoide.
	combatiente enemigos: {enemigo}.
	self hacerQue: combatiente quedeMalDebidoA: enemigo.
	
	combatiente actuar.
	
	self assert: (enemigo tienePuntosDeVida: 20*pv).
	
	! !


!classDefinition: #CombatesFantasticosTest category: 'AlgoIII-2023-1C-2Parcial-CombatientesFantasticos-P4'!
TestCase subclass: #CombatesFantasticosTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2023-1C-2Parcial-CombatientesFantasticos-P4'!

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

!CombatesFantasticosTest methodsFor: 'test-objects' stamp: 'JMB 5/7/2023 14:03:24'!
nuevoCombatienteCurador

	^CombatienteCurador new! !

!CombatesFantasticosTest methodsFor: 'test-objects' stamp: 'JMB 5/7/2023 14:03:33'!
nuevoCombatienteDragon

	^CombatienteDragon new! !

!CombatesFantasticosTest methodsFor: 'test-objects' stamp: 'JMB 5/7/2023 14:03:45'!
nuevoCombatienteHumanoide

	^CombatienteHumanoide new! !

!CombatesFantasticosTest methodsFor: 'test-objects' stamp: 'JMB 3/5/2023 21:53:00'!
ochoCombatientes
	^(1 to: 8) collect: [ :numero | self nuevoCombatienteHumanoide ].! !


!classDefinition: #CombatientesFantasticosTest category: 'AlgoIII-2023-1C-2Parcial-CombatientesFantasticos-P4'!
TestCase subclass: #CombatientesFantasticosTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2023-1C-2Parcial-CombatientesFantasticos-P4'!

!CombatientesFantasticosTest methodsFor: 'test-objects' stamp: 'JMB 5/7/2023 14:03:24'!
nuevoCombatienteCurador
	^CombatienteCurador new! !

!CombatientesFantasticosTest methodsFor: 'test-objects' stamp: 'JMB 5/7/2023 14:03:33'!
nuevoCombatienteDragon
	^CombatienteDragon new! !

!CombatientesFantasticosTest methodsFor: 'test-objects' stamp: 'JMB 5/7/2023 14:03:45'!
nuevoCombatienteHumanoide

	^CombatienteHumanoide new! !

!CombatientesFantasticosTest methodsFor: 'test-objects' stamp: 'JMB 5/8/2023 21:04:23'!
unCombatienteHumanoideAtacado: unaCantidadDeVeces
	| victima atacante |	
	victima := self nuevoCombatienteHumanoide.
	atacante := self nuevoCombatienteHumanoide.
	atacante enemigos: {victima}.
	unaCantidadDeVeces timesRepeat: [ atacante actuar ].
	^ victima! !

!CombatientesFantasticosTest methodsFor: 'test-objects' stamp: 'JMB 3/5/2023 01:33:28'!
unCombatienteHumanoideCon2PuntosDeVidasMenos
	^ self unCombatienteHumanoideAtacado: 1! !

!CombatientesFantasticosTest methodsFor: 'test-objects' stamp: 'JMB 3/5/2023 01:33:22'!
unCombatienteHumanoideCon4PuntosDeVidasMenos
	^ self unCombatienteHumanoideAtacado: 2! !


!CombatientesFantasticosTest methodsFor: 'tests-01-puntos-de-vida-iniciales' stamp: 'JMB 5/6/2023 19:23:28'!
test01UnDragonComienzaCon200PuntosDeVida
	self assert: self nuevoCombatienteDragon tienePuntosDeVida: 200 * pv.! !

!CombatientesFantasticosTest methodsFor: 'tests-01-puntos-de-vida-iniciales' stamp: 'JMB 6/4/2023 15:24:39'!
test02UnCuradorComienzaCon20PuntosDeVida
	self assert: self nuevoCombatienteCurador tienePuntosDeVida: 20 * pv.! !


!CombatientesFantasticosTest methodsFor: 'tests-02-dragon' stamp: 'JMB 6/11/2023 20:23:47'!
test03UnDragonHace8DeDaño

	self assertUnDragonCon: 1 enemigosAlActuarSoloDañaEn8A: 1! !

!CombatientesFantasticosTest methodsFor: 'tests-02-dragon' stamp: 'JMB 6/11/2023 20:23:52'!
test04UnDragonAtacaAMasDeUnEnemigo

	self assertUnDragonCon: 2 enemigosAlActuarSoloDañaEn8A: 2! !

!CombatientesFantasticosTest methodsFor: 'tests-02-dragon' stamp: 'JMB 6/11/2023 20:23:58'!
test05UnDragonAtacaHastaUnMaximoDe8Enemigos

	self assertUnDragonCon: 9 enemigosAlActuarSoloDañaEn8A: 8! !


!CombatientesFantasticosTest methodsFor: 'assertions' stamp: 'JMB 5/6/2023 19:23:28'!
assert: unCombatiente tienePuntosDeVida: unaCantidadDePuntosDeVida
	self assert: (unCombatiente tienePuntosDeVida: unaCantidadDePuntosDeVida).! !

!CombatientesFantasticosTest methodsFor: 'assertions' stamp: 'JMB 5/8/2023 22:00:34'!
assertUnDragonCon: unaCantidadDeEnemigos enemigosAlActuarSoloDañaEn8A: unaCantidadDeEnemigosHeridos 

	| dragon enemigos unaCantidadDeEnemigosNoHeridos |
	dragon := self nuevoCombatienteDragon.
	enemigos := 	(1 to: unaCantidadDeEnemigos) collect: [ : unNumero | self nuevoCombatienteHumanoide ]. 
	dragon enemigos: enemigos.
	
	dragon actuar.
	
	unaCantidadDeEnemigosNoHeridos := unaCantidadDeEnemigos - unaCantidadDeEnemigosHeridos. 
	self assert: unaCantidadDeEnemigosHeridos equals: (enemigos count: [: unEnemigo | unEnemigo tienePuntosDeVida: 12 * pv]).
	self assert: unaCantidadDeEnemigosNoHeridos equals: (enemigos count: [: unEnemigo | unEnemigo estaHerido not]).! !


!classDefinition: #CombatientesTest category: 'AlgoIII-2023-1C-2Parcial-CombatientesFantasticos-P4'!
TestCase subclass: #CombatientesTest
	instanceVariableNames: 'atacante atacado'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2023-1C-2Parcial-CombatientesFantasticos-P4'!

!CombatientesTest methodsFor: 'tests' stamp: 'JMB 5/8/2023 21:08:43'!
test01LosPuñosHacen2DeDaño
	atacante actuarSobre: atacado.
	
	self assert: (atacado tienePuntosDeVida: 18*pv).! !

!CombatientesTest methodsFor: 'tests' stamp: 'JMB 5/8/2023 21:08:43'!
test02MultiplesAtaquesVanBajandoMasVida
	atacante actuarSobre: atacado.
	atacante actuarSobre: atacado.
	
	self assert: (atacado tienePuntosDeVida: 16*pv).! !

!CombatientesTest methodsFor: 'tests' stamp: 'JMB 5/8/2023 21:08:43'!
test03UnHachaHace10DeDaño
	atacante equiparConUnHacha.
	
	atacante actuarSobre: atacado.
	
	self assert: (atacado tienePuntosDeVida: 10*pv).! !

!CombatientesTest methodsFor: 'tests' stamp: 'JMB 5/8/2023 21:08:43'!
test04UnEspadaHace8DeDaño
	atacante equiparConUnaEspada.
	
	atacante actuarSobre: atacado.
	
	self assert: (atacado tienePuntosDeVida: 12*pv).! !

!CombatientesTest methodsFor: 'tests' stamp: 'JMB 5/8/2023 21:08:43'!
test05UnMartilloHace8DeDaño
	atacante equiparConUnMartillo.
	
	atacante actuarSobre: atacado.
	
	self assert: (atacado tienePuntosDeVida: 12*pv).! !

!CombatientesTest methodsFor: 'tests' stamp: 'JMB 5/8/2023 21:08:43'!
test06UnaDagaHace4DeDaño
	atacante equiparConUnaDaga.
	
	atacante actuarSobre: atacado.
	
	self assert: (atacado tienePuntosDeVida: 16*pv).! !

!CombatientesTest methodsFor: 'tests' stamp: 'JMB 5/8/2023 21:08:43'!
test07UnaLanzaHace8DeDaño
	atacante equiparConUnaLanza.
	
	atacante actuarSobre: atacado.
	
	self assert: (atacado tienePuntosDeVida: 12*pv).! !

!CombatientesTest methodsFor: 'tests' stamp: 'JMB 5/8/2023 21:08:43'!
test08UnPaloHace6DeDaño
	atacante equiparConUnPalo.
	
	atacante actuarSobre: atacado.
	
	self assert: (atacado tienePuntosDeVida: 14*pv).! !

!CombatientesTest methodsFor: 'tests' stamp: 'JMB 5/8/2023 21:08:43'!
test09LaArmaduraDeMetalAbsorve6DeDaño 
	atacante equiparConUnHacha.
	atacado equiparConUnaArmaduraDeMetal.
	
	atacante actuarSobre: atacado.
	
	self assert: (atacado tienePuntosDeVida: 16*pv).! !

!CombatientesTest methodsFor: 'tests' stamp: 'JMB 5/8/2023 21:08:43'!
test10LaArmaduraDeAnillosAbsorve4DeDaño 
	atacante equiparConUnHacha.
	atacado equiparConUnaArmaduraDeAnillos.
	
	atacante actuarSobre: atacado.
	
	self assert: (atacado tienePuntosDeVida: 14*pv).! !

!CombatientesTest methodsFor: 'tests' stamp: 'JMB 5/8/2023 21:08:43'!
test11LaArmaduraDeCueroAbsorve2DeDaño 
	atacante equiparConUnHacha.
	atacado equiparConUnaArmaduraDeCuero.
	
	atacante actuarSobre: atacado.
	
	self assert: (atacado tienePuntosDeVida: 12*pv).! !


!CombatientesTest methodsFor: 'setUp/tearDown' stamp: 'JMB 5/7/2023 14:03:45'!
setUp
	atacante := CombatienteHumanoide new.
	atacado := CombatienteHumanoide new.

	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CombatientesTest class' category: 'AlgoIII-2023-1C-2Parcial-CombatientesFantasticos-P4'!
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


!classDefinition: #CuradoresFantasticosTest category: 'AlgoIII-2023-1C-2Parcial-CombatientesFantasticos-P4'!
TestCase subclass: #CuradoresFantasticosTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2023-1C-2Parcial-CombatientesFantasticos-P4'!

!CuradoresFantasticosTest methodsFor: 'tests-efectos' stamp: 'JMB 6/14/2023 21:23:50'!
test01UnaDosisConCristalMisticoSobreUnCuradorLoCuraEnUnPuntoDeVida
	
	| aliado |
	aliado := self curadorDañadoEn: 2*pv.
	self assertElCuradorEquipadoConCristalMisticoCon: aliado alActuarLoCuraEn: 1*pv! !

!CuradoresFantasticosTest methodsFor: 'tests-efectos' stamp: 'JMB 6/14/2023 21:23:50'!
test02UnaDosisConCristalMisticoSobreUnHumanoideLoCuraEnDosPuntosDeVida
	| aliado |
	aliado := self humanoideDañadoEn: 3*pv.
	self assertElCuradorEquipadoConCristalMisticoCon: aliado alActuarLoCuraEn: 2*pv.! !

!CuradoresFantasticosTest methodsFor: 'tests-efectos' stamp: 'JMB 6/14/2023 21:23:50'!
test03UnaDosisConCristalMisticoSobreUnDragonLoCuraEnCincoPuntosDeVida
	| aliado |
	aliado := self dragonDañadoEn: 6*pv.	
	self assertElCuradorEquipadoConCristalMisticoCon: aliado alActuarLoCuraEn: 5*pv.! !

!CuradoresFantasticosTest methodsFor: 'tests-efectos' stamp: 'JMB 6/14/2023 21:26:56'!
test04UnaDosisConBalsamoEsencialSobreUnDragonLoCuraEnDosPuntosDeVida
	| aliado |
	aliado := self dragonDañadoEn: 3*pv.
	self assertUnCuradorEquipadoConBalsamoEsencialCon: aliado alActuarLoCuraEn: 2*pv! !

!CuradoresFantasticosTest methodsFor: 'tests-efectos' stamp: 'JMB 6/14/2023 21:27:26'!
test05UnaDosisConBalsamoEsencialSobreUnCuradorLoCuraEnUnPuntoDeVida
	| aliado |
	aliado := self curadorDañadoEn: 2*pv.
	self assertUnCuradorEquipadoConBalsamoEsencialCon: aliado alActuarLoCuraEn: 1*pv! !

!CuradoresFantasticosTest methodsFor: 'tests-efectos' stamp: 'JMB 6/14/2023 21:30:01'!
test06UnaDosisConBalsamoEsencialSobreUnHumanoideLoCuraElVeinteParcientoDeSusPuntosDeVidaPerdidos
	| aliado puntosDeVidaPerdidos |
	puntosDeVidaPerdidos := 8*pv.
	aliado := self humanoideDañadoEn: puntosDeVidaPerdidos.	
	self assertUnCuradorEquipadoConBalsamoEsencialCon: aliado alActuarLoCuraEn:  (0.2*puntosDeVidaPerdidos) ceiling! !

!CuradoresFantasticosTest methodsFor: 'tests-efectos' stamp: 'JMB 6/14/2023 21:30:55'!
test06_BORRAR_MISMO_CASO_DE_TEST
	| aliado puntosDeVidaPerdidos |
	puntosDeVidaPerdidos := 12*pv.
	aliado := self humanoideDañadoEn: puntosDeVidaPerdidos.
	self assertUnCuradorEquipadoConBalsamoEsencialCon: aliado alActuarLoCuraEn:  (0.2*puntosDeVidaPerdidos) ceiling! !


!CuradoresFantasticosTest methodsFor: 'combatientes' stamp: 'JMB 6/14/2023 21:31:44'!
curadorDañadoEn: unaCantidadDePuntosDeVida

	^ self curadorEquipadoConBalsamoEsencialSiguiendoEstrategiaSanarALaMayorCantidadPosible 
		recibirDaño: unaCantidadDePuntosDeVida;
		yourself! !

!CuradoresFantasticosTest methodsFor: 'combatientes' stamp: 'JMB 6/13/2023 21:36:45'!
curadorEquipadoConBalsamoEsencialSiguiendoEstrategiaSanarALaMayorCantidadPosible

	^ CombatienteCurador con: BalsamoEsencial new siguiendo: EstrategiaDeAplicacion sanarALaMayorCantidadPosible ! !

!CuradoresFantasticosTest methodsFor: 'combatientes' stamp: 'JMB 6/27/2023 01:05:15'!
curadorEquipadoConBalsamoEsencialSiguiendoEstrategiaSanarLoMaximoPosible
	^ CombatienteCurador con: BalsamoEsencial new siguiendo: EstrategiaDeAplicacion sanarLoMaximoPosible! !

!CuradoresFantasticosTest methodsFor: 'combatientes' stamp: 'JMB 6/13/2023 21:37:00'!
curadorEquipadoConCristalMisticoSiguiendoEstrategiaSanarALaMayorCantidadPosible

	^ CombatienteCurador con: CristalMistico new siguiendo: EstrategiaDeAplicacion sanarALaMayorCantidadPosible! !

!CuradoresFantasticosTest methodsFor: 'combatientes' stamp: 'JMB 6/13/2023 21:38:23'!
curadorEquipadoConCristalMisticoSiguiendoEstrategiaSanarLoMaximoPosible
	^ CombatienteCurador con: CristalMistico new siguiendo: EstrategiaDeAplicacion sanarLoMaximoPosible! !

!CuradoresFantasticosTest methodsFor: 'combatientes' stamp: 'JMB 6/14/2023 18:51:46'!
dragonDañadoEn: unaCantidadDePuntosDeVida

	^ CombatienteDragon new 
		recibirDaño: unaCantidadDePuntosDeVida;
		yourself! !

!CuradoresFantasticosTest methodsFor: 'combatientes' stamp: 'JMB 6/14/2023 18:53:53'!
humanoideDañadoEn: unaCantidadDePuntosDeVida

	^ CombatienteHumanoide new 
		recibirDaño: unaCantidadDePuntosDeVida;
		yourself! !


!CuradoresFantasticosTest methodsFor: 'assertions' stamp: 'JMB 6/14/2023 22:33:08'!
assert: unCurador conDragonesAliados: unaCantidadDeAliados dañadosEn: unaCantidadDePuntosDeVidaDeDaño luegoDeActuarSusAliadosCumplenCon: unaCondicionSobreLosAliados

	| aliados |
	aliados := (1 to: unaCantidadDeAliados) collect: [ : indice | self dragonDañadoEn:unaCantidadDePuntosDeVidaDeDaño ].
	unCurador aliados: aliados.
	
	unCurador actuar.
	
	unaCondicionSobreLosAliados value: aliados. ! !

!CuradoresFantasticosTest methodsFor: 'assertions' stamp: 'JMB 6/14/2023 21:22:03'!
assertElCurador: unCurador con: unAliado alActuarloCuraEn: unosPuntosDeVidaCurados
	| puntosDeVidaPerdidos |
	unCurador aliados: {unAliado}.
	puntosDeVidaPerdidos := unAliado puntosDeVidaPerdidos.
	
	unCurador actuar.
	
	self assert: (unAliado estaHeridoCon: puntosDeVidaPerdidos - unosPuntosDeVidaCurados).! !

!CuradoresFantasticosTest methodsFor: 'assertions' stamp: 'JMB 6/14/2023 21:23:50'!
assertElCuradorEquipadoConCristalMisticoCon: unAliado alActuarLoCuraEn: unosPuntosDeVidaCurados
	| curador |
	curador := self curadorEquipadoConCristalMisticoSiguiendoEstrategiaSanarALaMayorCantidadPosible.
	self assertElCurador: curador con: unAliado  alActuarloCuraEn: unosPuntosDeVidaCurados ! !

!CuradoresFantasticosTest methodsFor: 'assertions' stamp: 'JMB 6/14/2023 22:32:41'!
assertQue: unaCantidadEsperada de: unosAliados estanHeridosCon: unaCantidadDePuntosDeVidaPerdidos

	self 
		assert: unaCantidadEsperada 
		equals: (unosAliados count: [ :unAliado | unAliado estaHeridoCon: unaCantidadDePuntosDeVidaPerdidos])! !

!CuradoresFantasticosTest methodsFor: 'assertions' stamp: 'JMB 6/14/2023 21:24:02'!
assertUnCuradorEquipadoConBalsamoEsencialCon: unAliado alActuarLoCuraEn: unosPuntosDeVidaCurados
	| curador |
	curador := self curadorEquipadoConBalsamoEsencialSiguiendoEstrategiaSanarALaMayorCantidadPosible.
	self assertElCurador: curador con: unAliado alActuarloCuraEn: unosPuntosDeVidaCurados! !


!CuradoresFantasticosTest methodsFor: 'tests-estrategias' stamp: 'JMB 6/14/2023 22:27:57'!
test07SiguiendoUnaEstrategiaDeSanarALaMayorCantidadPosibleAlActuarSeAplicaSoloUnaDosisALosAliados

	self 
		assert: self curadorEquipadoConCristalMisticoSiguiendoEstrategiaSanarALaMayorCantidadPosible 
		conDragonesAliados: 5 
		dañadosEn: 6*pv 
		luegoDeActuarSusAliadosCumplenCon: [ : unosAliados |			self assertQue: 5 de: unosAliados estanHeridosCon: 1*pv		]! !

!CuradoresFantasticosTest methodsFor: 'tests-estrategias' stamp: 'JMB 6/14/2023 22:26:38'!
test08ConUnEquipoCristalMisticoAlActuarAplicaCincoDosis

	self 
		assert: self curadorEquipadoConCristalMisticoSiguiendoEstrategiaSanarALaMayorCantidadPosible 
		conDragonesAliados: 6 
		dañadosEn: 6*pv 
		luegoDeActuarSusAliadosCumplenCon: [ : unosAliados |
			self assertQue: 1 de: unosAliados estanHeridosCon: 6*pv.
			self assertQue: 5 de: unosAliados estanHeridosCon: 1*pv.
		]! !

!CuradoresFantasticosTest methodsFor: 'tests-estrategias' stamp: 'JMB 6/14/2023 22:26:24'!
test09ConUnEquipoBalsamoEsencialAlActuarAplicaTresDosis
	
	self 
		assert: self curadorEquipadoConBalsamoEsencialSiguiendoEstrategiaSanarALaMayorCantidadPosible 
		conDragonesAliados: 4 
		dañadosEn: 3*pv 
		luegoDeActuarSusAliadosCumplenCon: [ : unosAliados |
			self assertQue: 3 de: unosAliados estanHeridosCon: 1*pv.
			self assertQue: 1 de: unosAliados estanHeridosCon: 3*pv.
		]! !

!CuradoresFantasticosTest methodsFor: 'tests-estrategias' stamp: 'JMB 6/27/2023 00:56:50'!
test10SiguiendoUnaEstrategiaDeSanarALaMayorCantidadPosibleSePriorizaCurarAAliadosConMenorPuntosDeVida
	| curador aliados aliadoConMasPuntosDeVida |
	curador := self curadorEquipadoConCristalMisticoSiguiendoEstrategiaSanarALaMayorCantidadPosible.
	aliados := (1 to: 6) collect: [ : indice | CombatienteDragon new recibirDaño: 6*pv;yourself ].
	aliadoConMasPuntosDeVida := aliados at: 3.
	aliadoConMasPuntosDeVida recibirCuracion: 1*pv.
	curador aliados: aliados.
	
	curador actuar.
	
	self assertQue: 5 de: aliados estanHeridosCon: 1*pv.
	self assert:(aliadoConMasPuntosDeVida estaHeridoCon: 5*pv).! !

!CuradoresFantasticosTest methodsFor: 'tests-estrategias' stamp: 'JMB 6/14/2023 22:31:52'!
test11SiguiendoUnaEstrategiaDeSanarLoMaximoPosibleAlActuarSeLeAplicaAlAliadoLasDosisHastaQueDejeDeEstarHerido

	self 
		assert: self curadorEquipadoConCristalMisticoSiguiendoEstrategiaSanarLoMaximoPosible 
		conDragonesAliados: 2 
		dañadosEn: 5*5*pv 
		luegoDeActuarSusAliadosCumplenCon: [ : unosAliados |
			self assertQue: 1 de: unosAliados estanHeridosCon: 0*pv.
			self assertQue: 1 de: unosAliados estanHeridosCon: 5*5*pv.
		]! !

!CuradoresFantasticosTest methodsFor: 'tests-estrategias' stamp: 'JMB 6/14/2023 22:26:24'!
test11_BORRAR_MISMO_CASO_DE_TEST

	self 
		assert: self curadorEquipadoConCristalMisticoSiguiendoEstrategiaSanarLoMaximoPosible 
		conDragonesAliados: 2 
		dañadosEn: 5*5*pv 
		luegoDeActuarSusAliadosCumplenCon: [ : unosAliados |
			self assertQue: 1 de: unosAliados estanHeridosCon: 0*pv.
			self assertQue: 1 de: unosAliados estanHeridosCon: 5*5*pv.
		]! !

!CuradoresFantasticosTest methodsFor: 'tests-estrategias' stamp: 'JMB 6/14/2023 22:26:24'!
test12SiguiendoUnaEstrategiaDeSanarLoMaximoPosibleAlActuarContinuaConElSiguienteAliadoSoloCuandoElAnteriorDejoDeEstarHerido

	self 
		assert: self curadorEquipadoConCristalMisticoSiguiendoEstrategiaSanarLoMaximoPosible 
		conDragonesAliados: 2 
		dañadosEn: 4*5*pv 
		luegoDeActuarSusAliadosCumplenCon: [ : unosAliados |
			self assertQue: 1 de: unosAliados estanHeridosCon: 0*pv. "Se le aplicaron 4 dosis"
			self assertQue: 1 de: unosAliados estanHeridosCon: 3*5*pv. "Se le aplico 1 dosis restante"
		]! !

!CuradoresFantasticosTest methodsFor: 'tests-estrategias' stamp: 'JMB 6/27/2023 01:05:15'!
test12_BORRAR_MISMO_CASO_DE_TEST
	| curador aliados |
	curador := self curadorEquipadoConBalsamoEsencialSiguiendoEstrategiaSanarLoMaximoPosible.
	aliados:= (1 to: 2) collect: [ :indice | self dragonDañadoEn: 3*2*pv ].
	curador aliados: aliados.
	
	curador actuar.
	
	self assert: 1 equals: (aliados count: [ :unAliado | unAliado noEstaHerido]).
	self assert: 1 equals: (aliados count: [ :unAliado | unAliado estaHeridoCon: 3*2*pv ]).! !

!CuradoresFantasticosTest methodsFor: 'tests-estrategias' stamp: 'JMB 6/27/2023 01:05:15'!
test13SiguiendoUnaEstrategiaDeSanarLoMaximoPosibleSePriorizaCurarAAliadosConMenorPuntosDeVida
	| curador aliados aliadoConMasPuntosDeVida |
	curador := self curadorEquipadoConBalsamoEsencialSiguiendoEstrategiaSanarLoMaximoPosible.
	aliados := (1 to: 4) collect: [ : indice | CombatienteDragon new recibirDaño: 2*pv;yourself ].
	aliadoConMasPuntosDeVida := aliados at: 2.
	aliadoConMasPuntosDeVida recibirCuracion: 1*pv.
	curador aliados: aliados.
	
	curador actuar.
	
	self assertQue: 3 de: aliados estanHeridosCon: 0*pv.
	self assert:(aliadoConMasPuntosDeVida estaHeridoCon: 1*pv).! !


!classDefinition: #EstrategiasTest category: 'AlgoIII-2023-1C-2Parcial-CombatientesFantasticos-P4'!
TestCase subclass: #EstrategiasTest
	instanceVariableNames: 'arthas mankrik olgra'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2023-1C-2Parcial-CombatientesFantasticos-P4'!

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


!EstrategiasTest methodsFor: 'private' stamp: 'JMB 5/7/2023 14:03:45'!
prepararCombatientes
	arthas := CombatienteHumanoide new.
	olgra := CombatienteHumanoide new.
	mankrik := CombatienteHumanoide new.! !


!classDefinition: #OrquestadorDeCombatesTest category: 'AlgoIII-2023-1C-2Parcial-CombatientesFantasticos-P4'!
TestCase subclass: #OrquestadorDeCombatesTest
	instanceVariableNames: 'arthas olgra mankrik'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2023-1C-2Parcial-CombatientesFantasticos-P4'!

!OrquestadorDeCombatesTest methodsFor: 'combates' stamp: 'SF 10/10/2022 19:37:28'!
orquestadorParaCombateArthasConFocoEnElMasSanoVsOrcos	
	
	self prepararCombatientes.
	self combatienteHumanoArthas focalizarEnElMasSano. 
	^self establecerCombateEntreBando1: {self combatienteHumanoArthas } contraBando2: { self combatienteOrcoOlgra. self combatienteOrcoMankrik }.
! !

!OrquestadorDeCombatesTest methodsFor: 'combates' stamp: 'JMB 5/8/2023 21:08:43'!
orquestadorParaCombateArthasInmuneYFocoEnElMasHeridoVsOrcos	
	
	self prepararCombatientes.
	self combatienteHumanoArthas actuarSobre: self combatienteOrcoOlgra.
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

!OrquestadorDeCombatesTest methodsFor: 'combates' stamp: 'JMB 5/8/2023 21:08:43'!
orquestadorParaCombateOrcosVsArthasInmuneYFocoEnElMasHerido	
	
	self prepararCombatientes.
	self combatienteHumanoArthas actuarSobre: self combatienteOrcoOlgra.
	self combatienteHumanoArthas equiparConUnaArmaduraDeMetal. 
	self combatienteHumanoArthas focalizarEnElMasHerido. 
	^self establecerCombateEntreBando1: { self combatienteOrcoOlgra. self combatienteOrcoMankrik } contraBando2: {self combatienteHumanoArthas }.
! !

!OrquestadorDeCombatesTest methodsFor: 'combates' stamp: 'JMB 5/7/2023 14:03:45'!
prepararCombatientes

	arthas := CombatienteHumanoide new. 
	olgra := CombatienteHumanoide new. 
	mankrik := CombatienteHumanoide new. ! !


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


!classDefinition: #Combatiente category: 'AlgoIII-2023-1C-2Parcial-CombatientesFantasticos-P4'!
Object subclass: #Combatiente
	instanceVariableNames: 'puntosDeVida enemigos aliados'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2023-1C-2Parcial-CombatientesFantasticos-P4'!

!Combatiente methodsFor: 'private' stamp: 'JMB 5/8/2023 21:09:10'!
actuarEstandoEnCombate
	self subclassResponsibility ! !

!Combatiente methodsFor: 'private' stamp: 'JMB 5/19/2023 14:12:20'!
dañoAAbsorber

	^ 0! !

!Combatiente methodsFor: 'private' stamp: 'JMB 5/8/2023 22:15:26'!
enemigosEnCombate

	^ enemigos select: [:enemigo | enemigo estaFueraDeCombate not]! !

!Combatiente methodsFor: 'private' stamp: 'JMB 5/6/2023 19:41:55'!
puntosDeVidaIniciales
	self subclassResponsibility ! !


!Combatiente methodsFor: 'combate' stamp: 'JMB 5/8/2023 21:09:10'!
actuar
	self estaFueraDeCombate ifTrue: [^self].
	self actuarEstandoEnCombate.! !

!Combatiente methodsFor: 'combate' stamp: 'JMB 5/8/2023 21:14:16'!
actuarSobre: unCombatiente
	
	self subclassResponsibility ! !

!Combatiente methodsFor: 'combate' stamp: 'SF 2/13/2023 19:51:54'!
aliados: combatientes 
	aliados := combatientes.! !

!Combatiente methodsFor: 'combate' stamp: 'MB 6/8/2023 22:50:20'!
efectoDeCuracionCon: unEquipoDeCuracion
	self subclassResponsibility ! !

!Combatiente methodsFor: 'combate' stamp: 'SF 8/20/2022 11:56:44'!
enemigos: unConjuntoDeEnemigos
	enemigos := unConjuntoDeEnemigos! !

!Combatiente methodsFor: 'combate' stamp: 'SF 7/13/2022 22:24:44'!
puntosDeVida
	^puntosDeVida! !

!Combatiente methodsFor: 'combate' stamp: 'JMB 6/11/2023 23:54:25'!
puntosDeVidaPerdidos
	^ self puntosDeVidaIniciales - self puntosDeVida ! !

!Combatiente methodsFor: 'combate' stamp: 'JMB 3/4/2023 20:28:12'!
recibirCuracion: unaCantidadDePuntosDeVidaACurar
	
	puntosDeVida := puntosDeVida + unaCantidadDePuntosDeVidaACurar.
	puntosDeVida := puntosDeVida min: self puntosDeVidaIniciales.! !

!Combatiente methodsFor: 'combate' stamp: 'JMB 5/19/2023 14:11:47'!
recibirDaño: unaCantidadDeDaño  
	| dañoADescontar |
	dañoADescontar := (unaCantidadDeDaño - self dañoAAbsorber) max: 0*pv.
	puntosDeVida := puntosDeVida - dañoADescontar.! !


!Combatiente methodsFor: 'initialization' stamp: 'JMB 6/15/2023 01:22:54'!
initialize
	puntosDeVida := self puntosDeVidaIniciales.
	enemigos := OrderedCollection new.
	aliados := #().! !


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


!Combatiente methodsFor: 'testing' stamp: 'SF 10/10/2022 11:06:47'!
estaFueraDeCombate
	^puntosDeVida <= (0*pv).! !

!Combatiente methodsFor: 'testing' stamp: 'JMB 3/4/2023 20:27:11'!
estaHerido
	^puntosDeVida < self puntosDeVidaIniciales! !

!Combatiente methodsFor: 'testing' stamp: 'JMB 6/4/2023 15:53:39'!
estaHeridoCon: unaCantidadDePuntosDeVida 
	^ self tienePuntosDeVida: (self puntosDeVidaIniciales - unaCantidadDePuntosDeVida)! !

!Combatiente methodsFor: 'testing' stamp: 'SF 10/9/2022 19:18:00'!
noEstaHerido
	^self estaHerido not.! !

!Combatiente methodsFor: 'testing' stamp: 'SF 10/9/2022 12:56:52'!
tienePuntosDeVida: unaCantidadDePuntosDeVida
	^puntosDeVida = unaCantidadDePuntosDeVida.! !


!classDefinition: #CombatienteCurador category: 'AlgoIII-2023-1C-2Parcial-CombatientesFantasticos-P4'!
Combatiente subclass: #CombatienteCurador
	instanceVariableNames: 'equipoDeCuracion estrategiaDeCuracion'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2023-1C-2Parcial-CombatientesFantasticos-P4'!

!CombatienteCurador methodsFor: 'private' stamp: 'JMB 6/13/2023 21:05:35'!
actuarEstandoEnCombate
	estrategiaDeCuracion curarA: aliados utilizando: equipoDeCuracion ! !

!CombatienteCurador methodsFor: 'private' stamp: 'JMB 6/4/2023 15:28:38'!
dañoAInfligir
	^ 0*pv! !

!CombatienteCurador methodsFor: 'private' stamp: 'JMB 5/6/2023 19:40:37'!
puntosDeVidaIniciales
	^ 20 * pv! !


!CombatienteCurador methodsFor: 'combate' stamp: 'JMB 5/8/2023 21:16:24'!
actuarSobre: unCombatiente
	
	self estaFueraDeCombate ifTrue: [^self].
	unCombatiente recibirDaño: self dañoAInfligir.! !

!CombatienteCurador methodsFor: 'combate' stamp: 'MB 6/8/2023 22:58:13'!
efectoDeCuracionCon: unEquipoDeCuracion
	^ unEquipoDeCuracion efectoSobreUnCurador: self
	! !


!CombatienteCurador methodsFor: 'initialization' stamp: 'JMB 6/13/2023 21:37:13'!
initialize
	super initialize.
	equipoDeCuracion := CristalMistico new.
	estrategiaDeCuracion := EstrategiaDeAplicacion sanarALaMayorCantidadPosible! !

!CombatienteCurador methodsFor: 'initialization' stamp: 'JMB 6/11/2023 22:08:49'!
initializeCon: unEquipoDeCuracion siguiendo: unaEstrategiaDeCuracion 
	equipoDeCuracion := unEquipoDeCuracion.
	estrategiaDeCuracion := unaEstrategiaDeCuracion.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CombatienteCurador class' category: 'AlgoIII-2023-1C-2Parcial-CombatientesFantasticos-P4'!
CombatienteCurador class
	instanceVariableNames: ''!

!CombatienteCurador class methodsFor: 'instance creation' stamp: 'JMB 6/11/2023 22:08:37'!
con: unEquipoDeCuracion siguiendo: unaEstrategiaDeCuracion
	^self new initializeCon: unEquipoDeCuracion siguiendo: unaEstrategiaDeCuracion ! !


!classDefinition: #CombatienteDragon category: 'AlgoIII-2023-1C-2Parcial-CombatientesFantasticos-P4'!
Combatiente subclass: #CombatienteDragon
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2023-1C-2Parcial-CombatientesFantasticos-P4'!

!CombatienteDragon methodsFor: 'private' stamp: 'JMB 5/8/2023 22:15:13'!
actuarEstandoEnCombate
	| enemigosElegidos enemigosActivos | 
	enemigosActivos := self enemigosEnCombate.
	enemigosActivos isEmpty ifTrue: [^self].
	enemigosElegidos := enemigosActivos firstAvailable: 8.
	enemigosElegidos do: [ : unEnemigo |		self actuarSobre: unEnemigo ].! !

!CombatienteDragon methodsFor: 'private' stamp: 'JMB 5/7/2023 11:06:23'!
dañoAInfligir

	^ 8*pv! !

!CombatienteDragon methodsFor: 'private' stamp: 'JMB 5/6/2023 19:41:04'!
puntosDeVidaIniciales
	^ 200 * pv! !


!CombatienteDragon methodsFor: 'combate' stamp: 'JMB 5/8/2023 21:16:29'!
actuarSobre: unCombatiente
	
	self estaFueraDeCombate ifTrue: [^self].
	unCombatiente recibirDaño: self dañoAInfligir.! !

!CombatienteDragon methodsFor: 'combate' stamp: 'MB 6/8/2023 22:58:18'!
efectoDeCuracionCon: unEquipoDeCuracion
	^ unEquipoDeCuracion efectoSobreUnDragon: self! !


!classDefinition: #CombatienteHumanoide category: 'AlgoIII-2023-1C-2Parcial-CombatientesFantasticos-P4'!
Combatiente subclass: #CombatienteHumanoide
	instanceVariableNames: 'dañoAInfligirPorArma dañoAAbsorber estrategia'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2023-1C-2Parcial-CombatientesFantasticos-P4'!

!CombatienteHumanoide methodsFor: 'private' stamp: 'JMB 5/8/2023 22:15:40'!
actuarEstandoEnCombate
	| enemigoElegido enemigosActivos |	
	enemigosActivos := self enemigosEnCombate.
	enemigosActivos isEmpty ifTrue: [^self].
	enemigoElegido := estrategia value: enemigosActivos.
	self actuarSobre: enemigoElegido.

! !

!CombatienteHumanoide methodsFor: 'private' stamp: 'JMB 5/19/2023 14:12:09'!
dañoAAbsorber

	^ dañoAAbsorber! !

!CombatienteHumanoide methodsFor: 'private' stamp: 'JMB 5/7/2023 11:06:45'!
dañoAInfligir

	^ dañoAInfligirPorArma! !

!CombatienteHumanoide methodsFor: 'private' stamp: 'JMB 5/6/2023 19:41:04'!
puntosDeVidaIniciales
	^ 20 * pv! !


!CombatienteHumanoide methodsFor: 'combate' stamp: 'JMB 5/8/2023 21:16:34'!
actuarSobre: unCombatiente
	
	self estaFueraDeCombate ifTrue: [^self].
	unCombatiente recibirDaño: self dañoAInfligir.! !

!CombatienteHumanoide methodsFor: 'combate' stamp: 'MB 6/8/2023 22:57:49'!
efectoDeCuracionCon: unEquipoDeCuracion
	^ unEquipoDeCuracion efectoSobreUnHumanoide: self! !


!CombatienteHumanoide methodsFor: 'equipo' stamp: 'JMB 5/19/2023 13:06:15'!
equiparConUnHacha
	dañoAInfligirPorArma := 10 * pv.! !

!CombatienteHumanoide methodsFor: 'equipo' stamp: 'JMB 5/19/2023 13:06:40'!
equiparConUnMartillo
	dañoAInfligirPorArma := 8 * pv.! !

!CombatienteHumanoide methodsFor: 'equipo' stamp: 'JMB 5/19/2023 13:07:26'!
equiparConUnPalo
	dañoAInfligirPorArma _ 6 * pv.! !

!CombatienteHumanoide methodsFor: 'equipo' stamp: 'JMB 5/19/2023 14:07:45'!
equiparConUnaArmaduraDeAnillos
	dañoAAbsorber _ 4 * pv.! !

!CombatienteHumanoide methodsFor: 'equipo' stamp: 'JMB 5/19/2023 14:08:03'!
equiparConUnaArmaduraDeCuero
	dañoAAbsorber _ 2 * pv.! !

!CombatienteHumanoide methodsFor: 'equipo' stamp: 'JMB 5/19/2023 14:08:23'!
equiparConUnaArmaduraDeMetal
	dañoAAbsorber := 6 * pv.! !

!CombatienteHumanoide methodsFor: 'equipo' stamp: 'JMB 5/19/2023 14:06:21'!
equiparConUnaDaga
	dañoAInfligirPorArma _ 4 * pv.! !

!CombatienteHumanoide methodsFor: 'equipo' stamp: 'JMB 5/19/2023 14:06:42'!
equiparConUnaEspada
	dañoAInfligirPorArma := 8 * pv.! !

!CombatienteHumanoide methodsFor: 'equipo' stamp: 'JMB 5/19/2023 14:06:59'!
equiparConUnaLanza
	dañoAInfligirPorArma := 8 * pv.! !


!CombatienteHumanoide methodsFor: 'initialization' stamp: 'JMB 6/15/2023 01:23:03'!
initialize
	super initialize.
	estrategia := self estrategiaACualquiera.	
	dañoAInfligirPorArma := 2*pv.
	dañoAAbsorber := 0.	! !


!CombatienteHumanoide methodsFor: 'estrategia' stamp: 'JMB 6/15/2023 01:23:56'!
estrategiaACualquiera

	^ [:candidatos | candidatos anyOne]! !

!CombatienteHumanoide methodsFor: 'estrategia' stamp: 'JMB 6/15/2023 01:23:46'!
focalizarEnElMasHerido
	estrategia := [:candidatos | candidatos detectMin: [:enemigo | enemigo puntosDeVida]].! !

!CombatienteHumanoide methodsFor: 'estrategia' stamp: 'JMB 6/15/2023 01:22:43'!
focalizarEnElMasSano
	estrategia := [:candidatos | candidatos detectMax: [:enemigo | enemigo puntosDeVida]].! !


!classDefinition: #EquipoDeCuracion category: 'AlgoIII-2023-1C-2Parcial-CombatientesFantasticos-P4'!
Object subclass: #EquipoDeCuracion
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2023-1C-2Parcial-CombatientesFantasticos-P4'!

!EquipoDeCuracion methodsFor: 'aplicaciones' stamp: 'MB 6/8/2023 22:46:24'!
aplicarDosisA: unCombatienteACurar
	| cantidadACurar |
	cantidadACurar := unCombatienteACurar efectoDeCuracionCon: self.
	^ unCombatienteACurar recibirCuracion: cantidadACurar! !

!EquipoDeCuracion methodsFor: 'aplicaciones' stamp: 'JMB 6/6/2023 16:44:34'!
cantidadDeDosisAAplicar
	self subclassResponsibility ! !


!EquipoDeCuracion methodsFor: 'efectos' stamp: 'MB 6/8/2023 22:49:45'!
efectoSobreUnCurador: unCombatiente
	self subclassResponsibility ! !

!EquipoDeCuracion methodsFor: 'efectos' stamp: 'MB 6/8/2023 22:49:08'!
efectoSobreUnDragon: unCombatiente
	self subclassResponsibility ! !

!EquipoDeCuracion methodsFor: 'efectos' stamp: 'MB 6/8/2023 22:49:22'!
efectoSobreUnHumanoide: unCombatiente
	self subclassResponsibility ! !


!classDefinition: #BalsamoEsencial category: 'AlgoIII-2023-1C-2Parcial-CombatientesFantasticos-P4'!
EquipoDeCuracion subclass: #BalsamoEsencial
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2023-1C-2Parcial-CombatientesFantasticos-P4'!

!BalsamoEsencial methodsFor: 'efectos' stamp: 'MB 6/8/2023 22:53:21'!
efectoSobreUnCurador: unCombatiente
	^ 1*pv! !

!BalsamoEsencial methodsFor: 'efectos' stamp: 'JMB 6/12/2023 00:50:03'!
efectoSobreUnDragon: unCombatiente
	^ 2*pv! !

!BalsamoEsencial methodsFor: 'efectos' stamp: 'JMB 6/12/2023 00:50:22'!
efectoSobreUnHumanoide: unCombatiente
	^ (unCombatiente puntosDeVidaPerdidos*0.2) ceiling! !


!BalsamoEsencial methodsFor: 'aplicaciones' stamp: 'JMB 6/12/2023 00:28:50'!
cantidadDeDosisAAplicar
	^ 3! !


!classDefinition: #CristalMistico category: 'AlgoIII-2023-1C-2Parcial-CombatientesFantasticos-P4'!
EquipoDeCuracion subclass: #CristalMistico
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2023-1C-2Parcial-CombatientesFantasticos-P4'!

!CristalMistico methodsFor: 'aplicaciones' stamp: 'JMB 6/12/2023 00:28:56'!
cantidadDeDosisAAplicar
	^ 5! !


!CristalMistico methodsFor: 'efectos' stamp: 'MB 6/8/2023 22:55:34'!
efectoSobreUnCurador: unCombatiente
	^ 1*pv! !

!CristalMistico methodsFor: 'efectos' stamp: 'MB 6/8/2023 22:55:19'!
efectoSobreUnDragon: unCombatiente
	^ 5*pv! !

!CristalMistico methodsFor: 'efectos' stamp: 'JMB 6/12/2023 00:51:21'!
efectoSobreUnHumanoide: unCombatiente
	^ 2*pv! !


!classDefinition: #EstrategiaDeAplicacion category: 'AlgoIII-2023-1C-2Parcial-CombatientesFantasticos-P4'!
Object subclass: #EstrategiaDeAplicacion
	instanceVariableNames: 'cantidadDeDosisAplicadas indiceDelCombatienteACurar combatienesConMayorPrioridadDeCuracion equipoDeCuracion criterioDeCambioDeCombatiente'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2023-1C-2Parcial-CombatientesFantasticos-P4'!

!EstrategiaDeAplicacion methodsFor: 'private' stamp: 'JMB 6/13/2023 21:30:38'!
aplicarDosis	 
	self aplicarDosisACombatiente.
	self debePasarAlSiguienteCombatiente ifTrue: [ self pasarAlSiguienteCombatiente ].
! !

!EstrategiaDeAplicacion methodsFor: 'private' stamp: 'JMB 6/13/2023 21:34:53'!
aplicarDosisACombatiente
	equipoDeCuracion aplicarDosisA: self combatienteSeleccionadoParaLaDosis.
	cantidadDeDosisAplicadas := cantidadDeDosisAplicadas + 1! !

!EstrategiaDeAplicacion methodsFor: 'private' stamp: 'JMB 6/13/2023 21:34:53'!
combatienteSeleccionadoParaLaDosis
	^ combatienesConMayorPrioridadDeCuracion at: indiceDelCombatienteACurar ! !

!EstrategiaDeAplicacion methodsFor: 'private' stamp: 'JMB 6/13/2023 21:24:34'!
debeAplicarSiguienteDosis
	^ self hayMasCombatientesPorCurar and: [ self hayDosisPorAplicar ]! !

!EstrategiaDeAplicacion methodsFor: 'private' stamp: 'JMB 6/13/2023 21:34:53'!
debePasarAlSiguienteCombatiente
	^ criterioDeCambioDeCombatiente value: self combatienteSeleccionadoParaLaDosis ! !

!EstrategiaDeAplicacion methodsFor: 'private' stamp: 'JMB 6/13/2023 21:24:15'!
hayDosisPorAplicar

	^ cantidadDeDosisAplicadas < equipoDeCuracion cantidadDeDosisAAplicar! !

!EstrategiaDeAplicacion methodsFor: 'private' stamp: 'JMB 6/13/2023 21:23:21'!
hayMasCombatientesPorCurar

	^ indiceDelCombatienteACurar <= combatienesConMayorPrioridadDeCuracion size! !

!EstrategiaDeAplicacion methodsFor: 'private' stamp: 'JMB 6/13/2023 21:25:48'!
inicializarCuracionPara: unEquipoDeCuracion utilizando: unosCombatientesACurar
	cantidadDeDosisAplicadas := 0.			
	indiceDelCombatienteACurar := 1.
	equipoDeCuracion := unEquipoDeCuracion.
	combatienesConMayorPrioridadDeCuracion := self priorizarCombatientesACurar: unosCombatientesACurar.! !

!EstrategiaDeAplicacion methodsFor: 'private' stamp: 'JMB 6/13/2023 21:30:59'!
pasarAlSiguienteCombatiente
	indiceDelCombatienteACurar := indiceDelCombatienteACurar + 1
! !

!EstrategiaDeAplicacion methodsFor: 'private' stamp: 'JMB 6/13/2023 21:25:59'!
priorizarCombatientesACurar: unosCombatientesACurar

	^ unosCombatientesACurar sorted: [ :unCombatiente :otroCombatiente | 
		unCombatiente puntosDeVida < otroCombatiente puntosDeVida 
	]! !


!EstrategiaDeAplicacion methodsFor: 'initialization' stamp: 'JMB 6/13/2023 21:33:07'!
initializeCon: unCriterioDeCambioDeCombatiente
	criterioDeCambioDeCombatiente := unCriterioDeCambioDeCombatiente! !


!EstrategiaDeAplicacion methodsFor: 'curacion' stamp: 'JMB 6/13/2023 21:31:29'!
curarA: unosCombatientesACurar utilizando: unEquipoDeCuracion

	self inicializarCuracionPara: unEquipoDeCuracion utilizando: unosCombatientesACurar.
	[ self debeAplicarSiguienteDosis ] 		whileTrue: [	 self aplicarDosis ].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EstrategiaDeAplicacion class' category: 'AlgoIII-2023-1C-2Parcial-CombatientesFantasticos-P4'!
EstrategiaDeAplicacion class
	instanceVariableNames: ''!

!EstrategiaDeAplicacion class methodsFor: 'instance creation' stamp: 'JMB 6/13/2023 21:33:27'!
sanarALaMayorCantidadPosible
	^ self new initializeCon: [: unCombatiente | true ]! !

!EstrategiaDeAplicacion class methodsFor: 'instance creation' stamp: 'JMB 6/13/2023 21:33:37'!
sanarLoMaximoPosible
	^ self new initializeCon: [: unCombatiente | unCombatiente noEstaHerido ]! !


!classDefinition: #OrquestadorDeCombates category: 'AlgoIII-2023-1C-2Parcial-CombatientesFantasticos-P4'!
Object subclass: #OrquestadorDeCombates
	instanceVariableNames: 'bando1 bando2'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2023-1C-2Parcial-CombatientesFantasticos-P4'!

!OrquestadorDeCombates methodsFor: 'initializing' stamp: 'SF 10/9/2022 12:50:01'!
initializeEstablecerCombateEntreBando1: unConjuntoDeCombatientes contraBando2: otroConjuntoDeCombatientes
	bando1 := unConjuntoDeCombatientes.
	bando2 := otroConjuntoDeCombatientes.! !


!OrquestadorDeCombates methodsFor: 'public' stamp: 'JMB 5/8/2023 21:04:23'!
desarrollarDuranteRondas: maximoDeRondas
	| rondaActual |
	rondaActual := 1.
	[rondaActual <= maximoDeRondas and: [self noHayGanador]] whileTrue: [
		bando1 do: [ :combatiente | combatiente actuar].
		bando2 do: [ :combatiente | combatiente actuar].
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

!classDefinition: 'OrquestadorDeCombates class' category: 'AlgoIII-2023-1C-2Parcial-CombatientesFantasticos-P4'!
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


!classDefinition: #ResultadoDeCombate category: 'AlgoIII-2023-1C-2Parcial-CombatientesFantasticos-P4'!
Object subclass: #ResultadoDeCombate
	instanceVariableNames: 'numeroDeRonda ganador'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2023-1C-2Parcial-CombatientesFantasticos-P4'!

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

!classDefinition: 'ResultadoDeCombate class' category: 'AlgoIII-2023-1C-2Parcial-CombatientesFantasticos-P4'!
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