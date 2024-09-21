!classDefinition: #AtacarTest category: 'AlgoIII-2023-1C-1Recu-CombatientesFantasticos'!
TestCase subclass: #AtacarTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2023-1C-1Recu-CombatientesFantasticos'!

!AtacarTest methodsFor: 'tests' stamp: 'SF 10/17/2022 19:20:49'!
hacerQue: combatiente1 quedeMalDebidoA: combatiente2

	[combatiente1 puntosDeVida <= 0] whileFalse: [
		combatiente2 atacarA: combatiente1]! !

!AtacarTest methodsFor: 'tests' stamp: 'JMB 6/29/2023 17:28:59'!
nuevoCombatienteHumanoide

	^ CombatienteConEstiloMarcial new! !

!AtacarTest methodsFor: 'tests' stamp: 'JMB 3/5/2023 21:41:09'!
test01CuandoUnCombatienteNoTieneEnemigosNoAtacaANadie
	| combatiente alguien |
	combatiente := self nuevoCombatienteHumanoide.
	alguien := self nuevoCombatienteHumanoide.
	
	combatiente actuar.
	
	self assert: (alguien noEstaHerido).
	
	! !

!AtacarTest methodsFor: 'tests' stamp: 'JMB 3/5/2023 21:41:09'!
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

!AtacarTest methodsFor: 'tests' stamp: 'JMB 3/5/2023 21:41:09'!
test03UnCombatientePuedeTenerComoEstrategiaAtacarAlMasHerido
	| combatiente enemigo1 enemigo2 enemigo2HeridoDosVeces |
	combatiente := self nuevoCombatienteHumanoide.
	enemigo1 := self nuevoCombatienteHumanoide.
	enemigo2 := self nuevoCombatienteHumanoide.
	combatiente enemigos: {enemigo1. enemigo2.}.
	combatiente atacarA: enemigo2.
	
	combatiente focalizarEnElMasHerido.
	combatiente actuar.
	
	enemigo2HeridoDosVeces := enemigo2 tienePuntosDeVida: 16 * pv.
	self assert: enemigo2HeridoDosVeces.
	
	! !

!AtacarTest methodsFor: 'tests' stamp: 'JMB 3/5/2023 21:41:09'!
test04UnCombatientePuedeTenerComoEstrategiaAtacarAlMasSano
	| combatiente enemigo1 enemigo2 elEnemigo1EstaHerido |
	combatiente := self nuevoCombatienteHumanoide.
	enemigo1 := self nuevoCombatienteHumanoide.
	enemigo2 := self nuevoCombatienteHumanoide.
	combatiente enemigos: {enemigo1. enemigo2.}.
	combatiente atacarA: enemigo2.
	
	combatiente focalizarEnElMasSano.
	combatiente actuar.
	
	elEnemigo1EstaHerido := enemigo1 tienePuntosDeVida: 18*pv.
	self assert: elEnemigo1EstaHerido.
	
	! !

!AtacarTest methodsFor: 'tests' stamp: 'JMB 3/5/2023 21:41:09'!
test05ElEnemigoFocalizadoMasSanoCambiaDinamicamente
	| combatiente enemigo1 enemigo2 |
	combatiente := self nuevoCombatienteHumanoide.
	enemigo1 := self nuevoCombatienteHumanoide.
	enemigo2 := self nuevoCombatienteHumanoide.
	combatiente enemigos: {enemigo1. enemigo2.}.
	combatiente atacarA: enemigo2.

	combatiente equiparConUnaEspada.	
	combatiente focalizarEnElMasSano.
	combatiente actuar.
	combatiente actuar.
	
	self assert: (enemigo1 tienePuntosDeVida: 12*pv).
	self assert: (enemigo2 tienePuntosDeVida: 10*pv).
	
	! !

!AtacarTest methodsFor: 'tests' stamp: 'JMB 3/5/2023 21:41:09'!
test06ElEnemigoFocalizadoMasHeridoCambiaDinamicamente
	| combatiente enemigo1 enemigo2 |
	combatiente := self nuevoCombatienteHumanoide.
	enemigo1 := self nuevoCombatienteHumanoide.
	enemigo2 := self nuevoCombatienteHumanoide.
	combatiente enemigos: {enemigo1. enemigo2.}.
	combatiente atacarA: enemigo2.

	combatiente equiparConUnaEspada.	
	combatiente focalizarEnElMasHerido.
	combatiente actuar.
	combatiente atacarA: enemigo1.
	combatiente atacarA: enemigo1.
	combatiente actuar.
	
	self assert: (enemigo1 tienePuntosDeVida: -4*pv).
	self assert: (enemigo2 tienePuntosDeVida: 10*pv).
	
	! !

!AtacarTest methodsFor: 'tests' stamp: 'JMB 3/5/2023 21:41:09'!
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
	combatiente actuar.
	
	self assert: (enemigo2 tienePuntosDeVida: 12*pv).
	
	! !

!AtacarTest methodsFor: 'tests' stamp: 'JMB 3/5/2023 21:41:09'!
test08CuandoUnCombatienteEstaVencidoNoAtaca
	| combatiente enemigo |
	combatiente := self nuevoCombatienteHumanoide.
	enemigo := self nuevoCombatienteHumanoide.
	combatiente enemigos: {enemigo}.
	self hacerQue: combatiente quedeMalDebidoA: enemigo.
	
	combatiente actuar.
	
	self assert: (enemigo tienePuntosDeVida: 20*pv).
	
	! !


!classDefinition: #BarbarosYDervichesTest category: 'AlgoIII-2023-1C-1Recu-CombatientesFantasticos'!
TestCase subclass: #BarbarosYDervichesTest
	instanceVariableNames: 'barbaro derviche victima'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2023-1C-1Recu-CombatientesFantasticos'!

!BarbarosYDervichesTest methodsFor: 'barbaro' stamp: 'SF 6/29/2023 19:23:34'!
barbaroAtacaYCuramosALaVictima

	barbaro actuar.
	victima recibirCuracion: 8 * pv! !

!BarbarosYDervichesTest methodsFor: 'barbaro' stamp: 'SF 6/29/2023 19:30:00'!
ponerFuriosoAlBarbaro

	^ barbaro recibirDaño: 8 * pv! !

!BarbarosYDervichesTest methodsFor: 'barbaro' stamp: 'SF 6/29/2023 19:18:10'!
test01UnBarbaroHaceMasDanioAlEstarFurioso
	barbaro recibirDaño: 8 * pv.
	
	barbaro actuar.
	
	self assert: victima sufrio: 6 * pv. ! !

!BarbarosYDervichesTest methodsFor: 'barbaro' stamp: 'SF 6/29/2023 19:18:26'!
test02UnBarbaroNoHaceMasDanioHastaNoEstarFurioso
	barbaro recibirDaño: 7 * pv.
	
	barbaro actuar.
	
	self assert: victima sufrio: 2 * pv. ! !

!BarbarosYDervichesTest methodsFor: 'barbaro' stamp: 'SF 6/29/2023 19:18:43'!
test03UnBarbaroPuedeEstarFuriosoLuegoDeMultiplesAtaques
	barbaro recibirDaño: 4 * pv.
	barbaro recibirDaño: 4 * pv.
	
	barbaro actuar.
	
	self assert: victima sufrio: 6 * pv. ! !

!BarbarosYDervichesTest methodsFor: 'barbaro' stamp: 'SF 6/29/2023 19:30:00'!
test04UnBarbaroPasaAEstarLevementeCansadoLuegoDeRealizar4Ataques
	barbaro equiparConUnaDaga.
	self ponerFuriosoAlBarbaro.
	4 timesRepeat: [self barbaroAtacaYCuramosALaVictima].

	barbaro actuar.
	
	self assert: victima sufrio: 2 * pv. ! !

!BarbarosYDervichesTest methodsFor: 'barbaro' stamp: 'SF 6/29/2023 19:30:00'!
test05UnBarbaroNoPasaAEstarLevementeCansadoLuegoDeRealizar3Ataques
	barbaro equiparConUnaDaga.
	self ponerFuriosoAlBarbaro.
	3 timesRepeat: [self barbaroAtacaYCuramosALaVictima].

	barbaro actuar.
	
	self assert: victima sufrio: 8 * pv. ! !

!BarbarosYDervichesTest methodsFor: 'barbaro' stamp: 'SF 6/29/2023 19:30:00'!
test06UnBarbaroSoloPasaAEstarLevementeCansadoLuegoDeRealizar3AtaquesEstandoFurioso
	barbaro equiparConUnaDaga.
	self barbaroAtacaYCuramosALaVictima.
	self ponerFuriosoAlBarbaro.
	3 timesRepeat: [self barbaroAtacaYCuramosALaVictima].

	barbaro actuar.
	
	self assert: victima sufrio: 8 * pv. ! !


!BarbarosYDervichesTest methodsFor: 'assertions' stamp: 'SF 6/14/2023 09:57:47'!
assert: unCombatiente sufrio: unaCantidadDePuntosDeVida
	self
		assert: (unCombatiente tienePuntosDeVida: unCombatiente puntosDeVidaIniciales - unaCantidadDePuntosDeVida)
		description:
			'Se esperaba que sufra ',
			unaCantidadDePuntosDeVida printString,
			' pero recibió ',
			(unCombatiente puntosDeVidaIniciales - unCombatiente puntosDeVida) printString.! !


!BarbarosYDervichesTest methodsFor: 'derviche' stamp: 'SF 6/29/2023 19:37:14'!
ponerEnTranceAlDerviche

	^ derviche recibirDaño: 8 * pv! !

!BarbarosYDervichesTest methodsFor: 'derviche' stamp: 'SF 6/29/2023 19:38:17'!
recibir4ataquesYSalirDelTrance

	derviche recibirDaño: 2 * pv.
	derviche recibirDaño: 2 * pv.
	derviche recibirDaño: 2 * pv.
	derviche recibirDaño: 2 * pv! !

!BarbarosYDervichesTest methodsFor: 'derviche' stamp: 'SF 6/29/2023 19:32:48'!
test01UnDervicheRecibeMenosDanioAlEstarEnTrance
	derviche recibirDaño: 8 * pv.
	
	derviche recibirDaño: 3 * pv.
	
	self assert: derviche sufrio: 8 * pv. ! !

!BarbarosYDervichesTest methodsFor: 'derviche' stamp: 'SF 6/29/2023 19:33:05'!
test02UnDervicheCambiaAEstarEnTranceInclusoSiEsCurado
	derviche recibirDaño: 8 * pv.
	derviche recibirCuracion: 2 * pv.
	
	derviche recibirDaño: 3 * pv.
	
	self assert: derviche sufrio: 6 * pv. ! !

!BarbarosYDervichesTest methodsFor: 'derviche' stamp: 'SF 6/29/2023 19:33:17'!
test03UnDervicheCambiaAEstarEnTranceConMuchosAtaques
	derviche recibirDaño: 4 * pv.
	derviche recibirDaño: 4 * pv.
	
	derviche recibirDaño: 3 * pv.
	
	self assert: derviche sufrio: 8 * pv. ! !

!BarbarosYDervichesTest methodsFor: 'derviche' stamp: 'SF 6/29/2023 19:36:21'!
test04UnDervicheEnTranceReduceElDañoRecibidoEn4
	self ponerEnTranceAlDerviche.
	
	derviche recibirDaño: 5 * pv.
	
	self assert: derviche sufrio: 9 * pv. ! !

!BarbarosYDervichesTest methodsFor: 'derviche' stamp: 'SF 6/29/2023 19:38:17'!
test05UnDervicheFuertementeCansadoLuegoDeRecibir4AtaquesNoAbsorbeDañoExtra
	self ponerEnTranceAlDerviche.
	self recibir4ataquesYSalirDelTrance.
	derviche recibirCuracion: 20 * pv.

	derviche recibirDaño: 2 * pv.
		
	self assert: derviche sufrio: 2 * pv.! !

!BarbarosYDervichesTest methodsFor: 'derviche' stamp: 'SF 6/29/2023 19:40:14'!
test06UnDervicheFuertementeCansadoLuegoDeRecibir4AtaquesVuelveANoReducirDaño
	self ponerEnTranceAlDerviche.
	self recibir4ataquesYSalirDelTrance.

	derviche recibirDaño: 2 * pv.
		
	self assert: derviche sufrio: 10 * pv.! !

!BarbarosYDervichesTest methodsFor: 'derviche' stamp: 'SF 6/29/2023 19:38:17'!
test07UnDervicheFuertementeCansadoHaceMenosDaño
	self ponerEnTranceAlDerviche.
	self recibir4ataquesYSalirDelTrance.

	derviche actuar.
		
	self assert: victima sufrio: 0 * pv.
! !

!BarbarosYDervichesTest methodsFor: 'derviche' stamp: 'SF 6/29/2023 19:34:56'!
test08UnDervicheNormalHaceDañoNormal

	derviche actuar.
		
	self assert: victima sufrio: 2 * pv.
! !

!BarbarosYDervichesTest methodsFor: 'derviche' stamp: 'SF 6/29/2023 19:37:14'!
test09UnDervicheEnTranceHaceDañoNormal
	self ponerEnTranceAlDerviche.

	derviche actuar.
		
	self assert: victima sufrio: 2 * pv.
! !


!BarbarosYDervichesTest methodsFor: 'setup' stamp: 'SF 6/29/2023 19:32:17'!
setUp
	victima := CombatienteConEstiloMarcial new.
	barbaro := CombatienteConEstiloBarbaro new.
	barbaro enemigos: {victima}.
	derviche := CombatienteConEstiloDerviche new.
	derviche enemigos: {victima}.
! !


!classDefinition: #CombatesFantasticosTest category: 'AlgoIII-2023-1C-1Recu-CombatientesFantasticos'!
TestCase subclass: #CombatesFantasticosTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2023-1C-1Recu-CombatientesFantasticos'!

!CombatesFantasticosTest methodsFor: 'tests' stamp: 'JMB 3/5/2023 20:55:22'!
test01UnDragonLeGanaA8CombatientesEn3Rondas
	| bandoCombatientes bandoDragon orquestador resultado |
	bandoDragon := {CombatienteDragon new }.
	bandoCombatientes := self ochoCombatientes.
	orquestador := OrquestadorDeCombates 	establecerCombateEntreBando1: bandoDragon contraBando2: bandoCombatientes.
	resultado := orquestador desarrollarDuranteRondas: 3.
	self assert: (resultado tieneDeGanadorAlBando1).! !

!CombatesFantasticosTest methodsFor: 'tests' stamp: 'JMB 3/5/2023 20:55:22'!
test02UnDragonLeGanaA8CombatientesArmados
	| bandoCombatientes bandoDragon orquestador resultado |
	bandoDragon := {CombatienteDragon new }.
	bandoCombatientes := self combatientesArmados: 8.
	orquestador := OrquestadorDeCombates 	establecerCombateEntreBando1: bandoDragon contraBando2: bandoCombatientes.
	resultado := orquestador desarrollarDuranteRondas: 10.
	self assert: (resultado tieneDeGanadorAlBando1).! !

!CombatesFantasticosTest methodsFor: 'tests' stamp: 'JMB 3/5/2023 20:55:22'!
test03UnDragonPierdeContra9CombatientesArmados
	| bandoCombatientes bandoDragon orquestador resultado |
	bandoDragon := {CombatienteDragon new }.
	bandoCombatientes := self combatientesArmados: 9.
	orquestador := OrquestadorDeCombates 	establecerCombateEntreBando1: bandoDragon contraBando2: bandoCombatientes.
	resultado := orquestador desarrollarDuranteRondas: 10.
	self assert: (resultado tieneDeGanadorAlBando2).! !

!CombatesFantasticosTest methodsFor: 'tests' stamp: 'JMB 3/5/2023 20:55:22'!
test04UnDragonContra4CuradoresNoTermina
	| bandoCuradores bandoDragon orquestador resultado |
	bandoDragon := {CombatienteDragon new }.
	bandoCuradores := self cuatroCuradores.
	orquestador := OrquestadorDeCombates 	establecerCombateEntreBando1: bandoDragon contraBando2: bandoCuradores.
	resultado := orquestador desarrollarDuranteRondas: 1000.
	self assert: resultado finalizoSinGanadores.! !


!CombatesFantasticosTest methodsFor: 'test-objects' stamp: 'JMB 3/5/2023 20:53:11'!
combatientesArmados: cantidad
	^(1 to: cantidad) collect: [ :numero |
		| combatiente |
		combatiente := self nuevoCombatienteHumanoide.
		combatiente equiparConUnaArmaduraDeCuero.
		combatiente equiparConUnaLanza.
		combatiente.
	].! !

!CombatesFantasticosTest methodsFor: 'test-objects' stamp: 'JMB 3/5/2023 20:54:36'!
cuatroCuradores
	^(1 to: 4) collect: [ :numero | CombatienteCurador new ].! !

!CombatesFantasticosTest methodsFor: 'test-objects' stamp: 'JMB 6/29/2023 17:29:00'!
nuevoCombatienteHumanoide

	^ CombatienteConEstiloMarcial new! !

!CombatesFantasticosTest methodsFor: 'test-objects' stamp: 'JMB 3/5/2023 20:53:11'!
ochoCombatientes
	^(1 to: 8) collect: [ :numero | self nuevoCombatienteHumanoide ].! !


!classDefinition: #CombatientesFantasticosTest category: 'AlgoIII-2023-1C-1Recu-CombatientesFantasticos'!
TestCase subclass: #CombatientesFantasticosTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2023-1C-1Recu-CombatientesFantasticos'!

!CombatientesFantasticosTest methodsFor: 'test-objects' stamp: 'JMB 3/5/2023 20:55:03'!
nuevoCombatienteCurador
	^CombatienteCurador new ! !

!CombatientesFantasticosTest methodsFor: 'test-objects' stamp: 'JMB 3/5/2023 20:55:22'!
nuevoCombatienteDragon
	^CombatienteDragon new ! !

!CombatientesFantasticosTest methodsFor: 'test-objects' stamp: 'JMB 6/29/2023 17:28:59'!
nuevoCombatienteHumanoide

	^ CombatienteConEstiloMarcial new! !

!CombatientesFantasticosTest methodsFor: 'test-objects' stamp: 'JMB 3/5/2023 20:55:38'!
nuevoCombatienteIlusionista
	^CombatienteIlusionista new ! !

!CombatientesFantasticosTest methodsFor: 'test-objects' stamp: 'JMB 3/5/2023 20:55:52'!
nuevoCombatienteOgro
	^CombatienteOgro new ! !

!CombatientesFantasticosTest methodsFor: 'test-objects' stamp: 'JMB 3/5/2023 21:41:09'!
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


!CombatientesFantasticosTest methodsFor: 'tests-01-puntos-de-vida-iniciales' stamp: 'JMB 3/4/2023 20:32:24'!
test01UnDragonComienzaCon200PuntosDeVida
	self assert: self nuevoCombatienteDragon comienzaCon: 200 * pv.! !

!CombatientesFantasticosTest methodsFor: 'tests-01-puntos-de-vida-iniciales' stamp: 'JMB 3/4/2023 20:32:56'!
test02UnIlusionistaComienzaCon20PuntosDeVida
	self assert: self nuevoCombatienteIlusionista comienzaCon: 20 * pv.! !

!CombatientesFantasticosTest methodsFor: 'tests-01-puntos-de-vida-iniciales' stamp: 'JMB 3/4/2023 20:33:19'!
test03UnCuradorComienzaCon20PuntosDeVida
	self assert: self nuevoCombatienteCurador comienzaCon: 20 * pv.! !

!CombatientesFantasticosTest methodsFor: 'tests-01-puntos-de-vida-iniciales' stamp: 'JMB 3/4/2023 20:33:38'!
test04UnOgroComienzaCon60PuntosDeVida
	self assert: self nuevoCombatienteOgro comienzaCon: 60 * pv.! !


!CombatientesFantasticosTest methodsFor: 'tests-02-dragon' stamp: 'JMB 3/4/2023 20:48:02'!
test05UnDragonHace8DeDaño

	self assertUnDragonCon: 1 enemigosAlAtacarSoloDañaEn8A: 1! !

!CombatientesFantasticosTest methodsFor: 'tests-02-dragon' stamp: 'JMB 3/4/2023 20:49:28'!
test06UnDragonAtacaAMasDeUnEnemigo
	self assertUnDragonCon: 2 enemigosAlAtacarSoloDañaEn8A: 2! !

!CombatientesFantasticosTest methodsFor: 'tests-02-dragon' stamp: 'JMB 3/4/2023 20:49:50'!
test07UnDragonAtacaHastaUnMaximoDe8Enemigos

	self assertUnDragonCon: 9 enemigosAlAtacarSoloDañaEn8A: 8! !


!CombatientesFantasticosTest methodsFor: 'tests-03-curador' stamp: 'JMB 3/5/2023 01:31:37'!
test08UnCuradorCura2DeDañoASusAliados
	self assertUnCuradorCon: {self unCombatienteHumanoideCon4PuntosDeVidasMenos} alAtacarLosDejaCon: 18*pv! !

!CombatientesFantasticosTest methodsFor: 'tests-03-curador' stamp: 'JMB 3/4/2023 21:31:47'!
test09UnCuradorNoCuraMasDeLosPuntosDeVidaIniciales
	self assertUnCuradorCon: {self nuevoCombatienteDragon } alAtacarLosDejaCon: 200*pv! !

!CombatientesFantasticosTest methodsFor: 'tests-03-curador' stamp: 'JMB 3/5/2023 01:24:55'!
test10UnCuradorCuraATodosSusAliados
	| aliados |
	aliados _ 	(1 to: 10) collect: [ : unNumero | self unCombatienteHumanoideCon2PuntosDeVidasMenos ]. 	
	self assertUnCuradorCon: aliados alAtacarLosDejaCon: 20*pv! !

!CombatientesFantasticosTest methodsFor: 'tests-03-curador' stamp: 'JMB 3/5/2023 21:41:09'!
test11UnCuradorNoDañaAUnEnemigo
	| curador enemigo |
	curador := self nuevoCombatienteCurador.
	enemigo := self nuevoCombatienteHumanoide.
	curador enemigos: {enemigo}.

	curador actuar.
	
	self assert: enemigo noEstaHerido.! !


!CombatientesFantasticosTest methodsFor: '[No hace falta quitar codigo repetido] tests-04-ilusionista' stamp: 'JMB 3/5/2023 21:41:09'!
test12UnIlusionistaContraUnSoloEnemigoNoHaceNada

	|  ilusionista enemigo |
	ilusionista := self nuevoCombatienteIlusionista .
	enemigo := self nuevoCombatienteHumanoide.
	ilusionista enemigos: {enemigo}.
	
	ilusionista actuar.
	
	self assert: enemigo noEstaHerido.! !

!CombatientesFantasticosTest methodsFor: '[No hace falta quitar codigo repetido] tests-04-ilusionista' stamp: 'JMB 3/5/2023 01:37:46'!
test13UnIlusionistaEngañaASusVictimasAlAtacar

	|  ilusionista victimaEngañada victimaAtacada |
	ilusionista := self nuevoCombatienteIlusionista .
	victimaEngañada := self nuevoCombatienteHumanoide.
	victimaAtacada := self nuevoCombatienteHumanoide.
	ilusionista enemigos: {victimaEngañada. victimaAtacada}.
	
	ilusionista atacarA: victimaEngañada.
	
	self assert: victimaEngañada noEstaHerido. 
	self assert: victimaAtacada estaHerido.! !


!CombatientesFantasticosTest methodsFor: '[No hace falta quitar codigo repetido] tests-05-ogro' stamp: 'JMB 3/5/2023 21:41:09'!
test14UnOgroNoDañaAUnEnemigoCuandoAtacaLaPrimeraVez
	| curador enemigo |
	curador := self nuevoCombatienteOgro.
	enemigo := self nuevoCombatienteHumanoide.
	curador enemigos: {enemigo}.

	curador actuar.
	
	self assert: enemigo noEstaHerido.! !

!CombatientesFantasticosTest methodsFor: '[No hace falta quitar codigo repetido] tests-05-ogro' stamp: 'JMB 3/5/2023 21:41:09'!
test15UnOgroDañaAUnEnemigoCuandoAtacaLuegoDePrepararse
	| curador enemigo |
	curador := self nuevoCombatienteOgro.
	enemigo := self nuevoCombatienteHumanoide.
	curador enemigos: {enemigo}.
	curador actuar.
	
	curador actuar.
	
	self assert: enemigo estaHerido.! !

!CombatientesFantasticosTest methodsFor: '[No hace falta quitar codigo repetido] tests-05-ogro' stamp: 'JMB 3/5/2023 21:41:09'!
test16UnOgroHace20DeDañoCuandoAtacaLuegoDePrepararse
	| curador enemigo |
	curador := self nuevoCombatienteOgro.
	enemigo := self nuevoCombatienteHumanoide.
	enemigo equiparConUnaArmaduraDeCuero.
	curador enemigos: {enemigo}.
	curador actuar.
	
	curador actuar.
	
	self assert: (enemigo tienePuntosDeVida: 2 * pv).! !

!CombatientesFantasticosTest methodsFor: '[No hace falta quitar codigo repetido] tests-05-ogro' stamp: 'JMB 3/5/2023 21:41:09'!
test17UnOgroLuegoDeAtacarTieneQueVolverAPrepararse
	| curador enemigo |
	curador := self nuevoCombatienteOgro.
	enemigo := self nuevoCombatienteHumanoide.
	enemigo equiparConUnaArmaduraDeCuero.
	curador enemigos: {enemigo}.
	curador actuar.
	curador actuar.
	
	curador actuar.
	
	self assert: enemigo estaFueraDeCombate not.! !


!CombatientesFantasticosTest methodsFor: 'assertions' stamp: 'JMB 3/4/2023 20:32:00'!
assert: unCombatiente comienzaCon: unaCantidadDePuntosDeVida
	self assert: (unCombatiente tienePuntosDeVida: unaCantidadDePuntosDeVida).! !

!CombatientesFantasticosTest methodsFor: 'assertions' stamp: 'JMB 3/5/2023 21:41:09'!
assertUnCuradorCon: unosAliados alAtacarLosDejaCon: unaCantidadDePuntosDeVidaEsperada
	| curador |
	curador := self nuevoCombatienteCurador.
	curador aliados: unosAliados.
	
	curador actuar.
	
	self assert: (unosAliados allSatisfy: [ : unAliado | unAliado tienePuntosDeVida: unaCantidadDePuntosDeVidaEsperada ]).! !

!CombatientesFantasticosTest methodsFor: 'assertions' stamp: 'JMB 3/5/2023 21:41:09'!
assertUnDragonCon: unaCantidadDeEnemigos enemigosAlAtacarSoloDañaEn8A: unaCantidadDeEnemigosHeridos 

	| dragon enemigos unaCantidadDeEnemigosNoHeridos |
	dragon := self nuevoCombatienteDragon.
	enemigos := 	(1 to: unaCantidadDeEnemigos) collect: [ : unNumero | self nuevoCombatienteHumanoide ]. 
	dragon enemigos: enemigos.
	
	dragon actuar.
	
	unaCantidadDeEnemigosNoHeridos := unaCantidadDeEnemigos - unaCantidadDeEnemigosHeridos. 
	self assert: unaCantidadDeEnemigosHeridos equals: (enemigos count: [: unEnemigo | unEnemigo tienePuntosDeVida: 12 * pv]).
	self assert: unaCantidadDeEnemigosNoHeridos equals: (enemigos count: [: unEnemigo | unEnemigo estaHerido not]).! !


!classDefinition: #CombatientesTest category: 'AlgoIII-2023-1C-1Recu-CombatientesFantasticos'!
TestCase subclass: #CombatientesTest
	instanceVariableNames: 'atacante atacado'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2023-1C-1Recu-CombatientesFantasticos'!

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


!CombatientesTest methodsFor: 'setUp/tearDown' stamp: 'JMB 6/29/2023 17:29:00'!
setUp
	atacante := CombatienteConEstiloMarcial new.
	atacado := CombatienteConEstiloMarcial new.

	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CombatientesTest class' category: 'AlgoIII-2023-1C-1Recu-CombatientesFantasticos'!
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


!classDefinition: #EstrategiasTest category: 'AlgoIII-2023-1C-1Recu-CombatientesFantasticos'!
TestCase subclass: #EstrategiasTest
	instanceVariableNames: 'arthas mankrik olgra'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2023-1C-1Recu-CombatientesFantasticos'!

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


!EstrategiasTest methodsFor: 'private' stamp: 'JMB 6/29/2023 17:28:59'!
prepararCombatientes
	arthas := CombatienteConEstiloMarcial new.
	olgra := CombatienteConEstiloMarcial new.
	mankrik := CombatienteConEstiloMarcial new.! !


!classDefinition: #OrquestadorDeCombatesTest category: 'AlgoIII-2023-1C-1Recu-CombatientesFantasticos'!
TestCase subclass: #OrquestadorDeCombatesTest
	instanceVariableNames: 'arthas olgra mankrik'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2023-1C-1Recu-CombatientesFantasticos'!

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

!OrquestadorDeCombatesTest methodsFor: 'combates' stamp: 'JMB 6/29/2023 17:28:59'!
prepararCombatientes

	arthas := CombatienteConEstiloMarcial new. 
	olgra := CombatienteConEstiloMarcial new. 
	mankrik := CombatienteConEstiloMarcial new. ! !


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


!classDefinition: #Combatiente category: 'AlgoIII-2023-1C-1Recu-CombatientesFantasticos'!
Object subclass: #Combatiente
	instanceVariableNames: 'puntosDeVida enemigos estrategia aliados'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2023-1C-1Recu-CombatientesFantasticos'!

!Combatiente methodsFor: 'private' stamp: 'JMB 6/29/2023 17:05:12'!
dañoAAbsorber

	^ 0! !

!Combatiente methodsFor: 'private' stamp: 'JMB 6/29/2023 17:11:06'!
dañoAInfligir

	^ 0! !

!Combatiente methodsFor: 'private' stamp: 'SF 7/13/2022 22:24:44'!
puntosDeVida
	^puntosDeVida! !

!Combatiente methodsFor: 'private' stamp: 'JMB 3/5/2023 20:27:39'!
puntosDeVidaIniciales
	self subclassResponsibility ! !


!Combatiente methodsFor: 'combate' stamp: 'JMB 3/5/2023 21:41:09'!
actuar
	self subclassResponsibility 
	! !

!Combatiente methodsFor: 'combate' stamp: 'SF 2/13/2023 19:51:54'!
aliados: combatientes 
	aliados := combatientes.! !

!Combatiente methodsFor: 'combate' stamp: 'JMB 3/5/2023 20:32:21'!
atacarA: unCombatienteASerAtacado

	self estaFueraDeCombate ifTrue: [^self].
	unCombatienteASerAtacado recibirDaño: self dañoAInfligir.! !

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

!Combatiente methodsFor: 'combate' stamp: 'JMB 3/4/2023 20:28:12'!
recibirCuracion: unaCantidadDePuntosDeVidaACurar
	
	puntosDeVida := puntosDeVida + unaCantidadDePuntosDeVidaACurar.
	puntosDeVida := puntosDeVida min: self puntosDeVidaIniciales.! !

!Combatiente methodsFor: 'combate' stamp: 'JMB 6/29/2023 17:05:22'!
recibirDaño: unaCantidadDeDaño  
	| dañoADescontar |
	dañoADescontar := (unaCantidadDeDaño - self dañoAAbsorber) max: 0*pv.
	puntosDeVida := puntosDeVida - dañoADescontar.! !

!Combatiente methodsFor: 'combate' stamp: 'SF 10/9/2022 12:56:52'!
tienePuntosDeVida: unaCantidadDePuntosDeVida
	^puntosDeVida = unaCantidadDePuntosDeVida.! !


!Combatiente methodsFor: 'initialization' stamp: 'JMB 6/29/2023 17:07:45'!
initialize
	puntosDeVida := self puntosDeVidaIniciales.
	enemigos := OrderedCollection new.
	aliados := #().
	estrategia := self estrategiaACualquiera.! !


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


!Combatiente methodsFor: 'estrategia' stamp: 'JMB 6/29/2023 17:07:15'!
estrategiaACualquiera

	^ [:candidatos | candidatos anyOne]! !

!Combatiente methodsFor: 'estrategia' stamp: 'JMB 6/29/2023 17:07:21'!
focalizarEnElMasHerido
	estrategia := [:candidatos | candidatos detectMin: [:enemigo | enemigo puntosDeVida]].! !

!Combatiente methodsFor: 'estrategia' stamp: 'JMB 6/29/2023 17:07:27'!
focalizarEnElMasSano
	estrategia := [:candidatos | candidatos detectMax: [:enemigo | enemigo puntosDeVida]].! !


!classDefinition: #CombatienteConEstiloDeCombate category: 'AlgoIII-2023-1C-1Recu-CombatientesFantasticos'!
Combatiente subclass: #CombatienteConEstiloDeCombate
	instanceVariableNames: 'dañoAAbsorberPorArmadura dañoAInfligirPorArma'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2023-1C-1Recu-CombatientesFantasticos'!

!CombatienteConEstiloDeCombate methodsFor: 'equipo' stamp: 'JMB 6/29/2023 16:58:44'!
equiparConUnHacha
	dañoAInfligirPorArma := 10 * pv.! !

!CombatienteConEstiloDeCombate methodsFor: 'equipo' stamp: 'JMB 6/29/2023 16:58:57'!
equiparConUnMartillo
	dañoAInfligirPorArma := 8 * pv.! !

!CombatienteConEstiloDeCombate methodsFor: 'equipo' stamp: 'JMB 6/29/2023 16:59:08'!
equiparConUnPalo
	dañoAInfligirPorArma _ 6 * pv.! !

!CombatienteConEstiloDeCombate methodsFor: 'equipo' stamp: 'JMB 6/29/2023 16:59:19'!
equiparConUnaArmaduraDeAnillos
	dañoAAbsorberPorArmadura _ 4 * pv.! !

!CombatienteConEstiloDeCombate methodsFor: 'equipo' stamp: 'JMB 6/29/2023 16:59:28'!
equiparConUnaArmaduraDeCuero
	dañoAAbsorberPorArmadura _ 2 * pv.! !

!CombatienteConEstiloDeCombate methodsFor: 'equipo' stamp: 'JMB 6/29/2023 16:59:38'!
equiparConUnaArmaduraDeMetal
	dañoAAbsorberPorArmadura := 6 * pv.! !

!CombatienteConEstiloDeCombate methodsFor: 'equipo' stamp: 'JMB 6/29/2023 16:59:48'!
equiparConUnaDaga
	dañoAInfligirPorArma _ 4 * pv.! !

!CombatienteConEstiloDeCombate methodsFor: 'equipo' stamp: 'JMB 6/29/2023 16:59:58'!
equiparConUnaEspada
	dañoAInfligirPorArma := 8 * pv.! !

!CombatienteConEstiloDeCombate methodsFor: 'equipo' stamp: 'JMB 6/29/2023 17:00:06'!
equiparConUnaLanza
	dañoAInfligirPorArma := 8 * pv.! !

!CombatienteConEstiloDeCombate methodsFor: 'equipo' stamp: 'SF 6/29/2023 20:07:05'!
posturaDeCombate: unaPosturaDeCombate
	self subclassResponsibility.! !


!CombatienteConEstiloDeCombate methodsFor: 'combate' stamp: 'JMB 6/29/2023 16:57:03'!
actuar
	| enemigoElegido enemigosActivos |
	self estaFueraDeCombate ifTrue: [^self].
	enemigosActivos := enemigos select: [:enemigo | enemigo estaFueraDeCombate not].
	enemigosActivos isEmpty ifTrue: [^self].
	
	enemigoElegido := estrategia value: enemigosActivos.
	self atacarA: enemigoElegido.! !

!CombatienteConEstiloDeCombate methodsFor: 'combate' stamp: 'JMB 6/29/2023 17:03:24'!
dañoAInfligir
	^ dañoAInfligirPorArma! !


!CombatienteConEstiloDeCombate methodsFor: 'initialization' stamp: 'JMB 6/29/2023 17:07:35'!
initialize
	super initialize.
	dañoAInfligirPorArma := 2*pv.
	dañoAAbsorberPorArmadura := 0.	! !


!CombatienteConEstiloDeCombate methodsFor: 'private' stamp: 'JMB 6/29/2023 17:05:40'!
dañoAAbsorber

	^ dañoAAbsorberPorArmadura ! !

!CombatienteConEstiloDeCombate methodsFor: 'private' stamp: 'JMB 6/29/2023 16:57:16'!
puntosDeVidaIniciales
	^ 20 * pv! !


!classDefinition: #CombatienteConEstiloBarbaro category: 'AlgoIII-2023-1C-1Recu-CombatientesFantasticos'!
CombatienteConEstiloDeCombate subclass: #CombatienteConEstiloBarbaro
	instanceVariableNames: 'posturaDeCombate'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2023-1C-1Recu-CombatientesFantasticos'!

!CombatienteConEstiloBarbaro methodsFor: 'private' stamp: 'JMB 6/29/2023 16:49:55'!
posturaDeCombate: unaPosturaDeCombate
	posturaDeCombate := unaPosturaDeCombate.! !


!CombatienteConEstiloBarbaro methodsFor: 'combate' stamp: 'JMB 6/29/2023 16:48:54'!
atacarA: unCombatienteASerAtacado

	self estaFueraDeCombate ifTrue: [^self].
	unCombatienteASerAtacado recibirDaño: self dañoAInfligir.
	posturaDeCombate haAtacadoElCombatiente: self.! !

!CombatienteConEstiloBarbaro methodsFor: 'combate' stamp: 'JMB 6/29/2023 17:14:52'!
dañoAInfligir
	^ super dañoAInfligir + posturaDeCombate dañoExtra.! !

!CombatienteConEstiloBarbaro methodsFor: 'combate' stamp: 'SF 6/29/2023 20:11:43'!
recibirDaño: unaCantidadDeDaño  
	| dañoADescontar dañoAAbsorber |
	dañoAAbsorber := dañoAAbsorberPorArmadura + posturaDeCombate dañoAAbsorber.
	dañoADescontar := (unaCantidadDeDaño - dañoAAbsorber) max: 0*pv.
	posturaDeCombate combatiente: self vaARecibirDaño: dañoADescontar.
	puntosDeVida := puntosDeVida - dañoADescontar.
! !


!CombatienteConEstiloBarbaro methodsFor: 'initialization' stamp: 'SF 6/29/2023 19:59:22'!
initialize
	super initialize.
	self posturaDeCombate: NormalBarbaro new.
! !


!classDefinition: #CombatienteConEstiloDerviche category: 'AlgoIII-2023-1C-1Recu-CombatientesFantasticos'!
CombatienteConEstiloDeCombate subclass: #CombatienteConEstiloDerviche
	instanceVariableNames: 'posturaDeCombate'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2023-1C-1Recu-CombatientesFantasticos'!

!CombatienteConEstiloDerviche methodsFor: 'initialization' stamp: 'SF 6/29/2023 19:58:53'!
initialize
	super initialize.
	self posturaDeCombate: NormalDerviche new.
! !


!CombatienteConEstiloDerviche methodsFor: 'combate' stamp: 'SF 6/29/2023 20:01:49'!
atacarA: unCombatienteASerAtacado

	self estaFueraDeCombate ifTrue: [^self].
	unCombatienteASerAtacado recibirDaño: self dañoAInfligir.
	posturaDeCombate haAtacadoElCombatiente: self.! !

!CombatienteConEstiloDerviche methodsFor: 'combate' stamp: 'JMB 6/29/2023 17:15:16'!
dañoAInfligir
	^ super dañoAInfligir + posturaDeCombate dañoExtra.! !

!CombatienteConEstiloDerviche methodsFor: 'combate' stamp: 'JMB 6/29/2023 16:49:29'!
recibirDaño: unaCantidadDeDaño  
	| dañoADescontar dañoAAbsorber |
	dañoAAbsorber := dañoAAbsorberPorArmadura + posturaDeCombate dañoAAbsorber.
	dañoADescontar := (unaCantidadDeDaño - dañoAAbsorber) max: 0*pv.
	posturaDeCombate combatiente: self vaARecibirDaño: dañoADescontar.
	puntosDeVida := puntosDeVida - dañoADescontar.
! !


!CombatienteConEstiloDerviche methodsFor: 'private' stamp: 'JMB 6/29/2023 16:49:45'!
posturaDeCombate: unaPosturaDeCombate
	posturaDeCombate := unaPosturaDeCombate.! !


!classDefinition: #CombatienteConEstiloMarcial category: 'AlgoIII-2023-1C-1Recu-CombatientesFantasticos'!
CombatienteConEstiloDeCombate subclass: #CombatienteConEstiloMarcial
	instanceVariableNames: 'posturaDeCombate'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2023-1C-1Recu-CombatientesFantasticos'!

!CombatienteConEstiloMarcial methodsFor: 'as yet unclassified' stamp: 'SF 6/29/2023 19:57:34'!
posturaDeCombate: unaPosturaDeCombate
	posturaDeCombate := unaPosturaDeCombate.! !


!CombatienteConEstiloMarcial methodsFor: 'combate' stamp: 'SF 6/29/2023 20:02:38'!
atacarA: unCombatienteASerAtacado

	self estaFueraDeCombate ifTrue: [^self].
	unCombatienteASerAtacado recibirDaño: self dañoAInfligir.
	posturaDeCombate haAtacadoElCombatiente: self.! !

!CombatienteConEstiloMarcial methodsFor: 'combate' stamp: 'SF 6/29/2023 19:56:50'!
dañoAInfligir
	^ super dañoAInfligir + posturaDeCombate dañoExtra.! !

!CombatienteConEstiloMarcial methodsFor: 'combate' stamp: 'SF 6/29/2023 20:00:03'!
recibirDaño: unaCantidadDeDaño  
	| dañoADescontar dañoAAbsorber |
	dañoAAbsorber := dañoAAbsorberPorArmadura + posturaDeCombate dañoAAbsorber.
	dañoADescontar := (unaCantidadDeDaño - dañoAAbsorber) max: 0*pv.
	posturaDeCombate combatiente: self vaARecibirDaño: dañoADescontar.
	puntosDeVida := puntosDeVida - dañoADescontar.
! !


!CombatienteConEstiloMarcial methodsFor: 'initialization' stamp: 'SF 6/29/2023 19:59:04'!
initialize
	super initialize.
	self posturaDeCombate: NormalMarcial new.
! !


!classDefinition: #CombatienteCurador category: 'AlgoIII-2023-1C-1Recu-CombatientesFantasticos'!
Combatiente subclass: #CombatienteCurador
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2023-1C-1Recu-CombatientesFantasticos'!

!CombatienteCurador methodsFor: 'as yet unclassified' stamp: 'JMB 3/5/2023 21:41:09'!
actuar
	
	self estaFueraDeCombate ifTrue: [^self].	
	aliados do: [ : unAliado | unAliado recibirCuracion: 2*pv ].! !

!CombatienteCurador methodsFor: 'as yet unclassified' stamp: 'JMB 3/5/2023 20:26:02'!
puntosDeVidaIniciales
	^ 20*pv! !


!classDefinition: #CombatienteDragon category: 'AlgoIII-2023-1C-1Recu-CombatientesFantasticos'!
Combatiente subclass: #CombatienteDragon
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2023-1C-1Recu-CombatientesFantasticos'!

!CombatienteDragon methodsFor: 'as yet unclassified' stamp: 'JMB 3/5/2023 21:41:09'!
actuar
	| enemigosActivos enemigosElegidos |
	self estaFueraDeCombate ifTrue: [^self].
	enemigosActivos := enemigos select: [:enemigo | enemigo estaFueraDeCombate not].
	enemigosActivos isEmpty ifTrue: [^self].
	
	enemigosElegidos _ enemigosActivos firstAvailable: 8.
	enemigosElegidos do: [ : unEnemigoAAtacar | self atacarA: unEnemigoAAtacar ].! !

!CombatienteDragon methodsFor: 'as yet unclassified' stamp: 'JMB 3/5/2023 20:46:38'!
dañoAInfligir
	^ 8*pv! !

!CombatienteDragon methodsFor: 'as yet unclassified' stamp: 'JMB 3/5/2023 20:25:06'!
puntosDeVidaIniciales
	^ 200*pv! !


!classDefinition: #CombatienteIlusionista category: 'AlgoIII-2023-1C-1Recu-CombatientesFantasticos'!
Combatiente subclass: #CombatienteIlusionista
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2023-1C-1Recu-CombatientesFantasticos'!

!CombatienteIlusionista methodsFor: 'as yet unclassified' stamp: 'JMB 3/5/2023 21:41:09'!
actuar
	| enemigoElegido enemigosActivos |
	self estaFueraDeCombate ifTrue: [^self].
	enemigosActivos := enemigos select: [:enemigo | enemigo estaFueraDeCombate not].
	enemigosActivos isEmpty ifTrue: [^self].
	
	enemigoElegido := estrategia value: enemigosActivos.
	self atacarA: enemigoElegido.! !

!CombatienteIlusionista methodsFor: 'as yet unclassified' stamp: 'JMB 3/5/2023 21:28:14'!
atacarA: unCombatienteASerAtacado
	| victima aliadosDeUnCombatienteASerAtacado |
	self estaFueraDeCombate ifTrue: [^self].		
	aliadosDeUnCombatienteASerAtacado := enemigos reject: [ : unEnemigo | unEnemigo = unCombatienteASerAtacado ].
	aliadosDeUnCombatienteASerAtacado isEmpty ifTrue: [^ self].
	victima :=  aliadosDeUnCombatienteASerAtacado anyOne.
	unCombatienteASerAtacado atacarA: victima.! !

!CombatienteIlusionista methodsFor: 'as yet unclassified' stamp: 'JMB 3/5/2023 20:25:30'!
puntosDeVidaIniciales
	^ 20*pv! !


!classDefinition: #CombatienteOgro category: 'AlgoIII-2023-1C-1Recu-CombatientesFantasticos'!
Combatiente subclass: #CombatienteOgro
	instanceVariableNames: 'tieneElAtaquePreparado'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2023-1C-1Recu-CombatientesFantasticos'!

!CombatienteOgro methodsFor: 'as yet unclassified' stamp: 'JMB 3/5/2023 21:41:09'!
actuar
	| enemigoElegido enemigosActivos |
	self estaFueraDeCombate ifTrue: [^self].
	enemigosActivos := enemigos select: [:enemigo | enemigo estaFueraDeCombate not].
	enemigosActivos isEmpty ifTrue: [^self].
	
	tieneElAtaquePreparado ifTrue: [
		enemigoElegido := estrategia value: enemigosActivos.
		self atacarA: enemigoElegido.
		tieneElAtaquePreparado := false.
		^self.
	].
	tieneElAtaquePreparado := true.! !

!CombatienteOgro methodsFor: 'as yet unclassified' stamp: 'JMB 3/5/2023 20:47:13'!
dañoAInfligir
	^ 20*pv! !

!CombatienteOgro methodsFor: 'as yet unclassified' stamp: 'JMB 3/5/2023 21:00:37'!
initialize
	super initialize.
	tieneElAtaquePreparado := false.
	! !

!CombatienteOgro methodsFor: 'as yet unclassified' stamp: 'JMB 3/5/2023 20:25:40'!
puntosDeVidaIniciales
	^ 60*pv! !


!classDefinition: #OrquestadorDeCombates category: 'AlgoIII-2023-1C-1Recu-CombatientesFantasticos'!
Object subclass: #OrquestadorDeCombates
	instanceVariableNames: 'bando1 bando2'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2023-1C-1Recu-CombatientesFantasticos'!

!OrquestadorDeCombates methodsFor: 'initializing' stamp: 'SF 10/9/2022 12:50:01'!
initializeEstablecerCombateEntreBando1: unConjuntoDeCombatientes contraBando2: otroConjuntoDeCombatientes
	bando1 := unConjuntoDeCombatientes.
	bando2 := otroConjuntoDeCombatientes.! !


!OrquestadorDeCombates methodsFor: 'public' stamp: 'JMB 3/5/2023 21:41:09'!
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

!classDefinition: 'OrquestadorDeCombates class' category: 'AlgoIII-2023-1C-1Recu-CombatientesFantasticos'!
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


!classDefinition: #PosturaDeCombate category: 'AlgoIII-2023-1C-1Recu-CombatientesFantasticos'!
Object subclass: #PosturaDeCombate
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2023-1C-1Recu-CombatientesFantasticos'!

!PosturaDeCombate methodsFor: 'public' stamp: 'SF 6/29/2023 20:00:53'!
combatiente: unCombatiente vaARecibirDaño: dañoADescontar
	^self.! !

!PosturaDeCombate methodsFor: 'public' stamp: 'SF 6/18/2023 12:48:07'!
dañoExtra
	self subclassResponsibility.! !

!PosturaDeCombate methodsFor: 'public' stamp: 'SF 6/29/2023 20:03:07'!
haAtacadoElCombatiente: unCombatiente
	self subclassResponsibility.! !


!classDefinition: #EnTrance category: 'AlgoIII-2023-1C-1Recu-CombatientesFantasticos'!
PosturaDeCombate subclass: #EnTrance
	instanceVariableNames: 'ataquesRecibidosEnTrance'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2023-1C-1Recu-CombatientesFantasticos'!

!EnTrance methodsFor: 'public' stamp: 'JMB 6/29/2023 16:49:10'!
combatiente: unCombatiente vaARecibirDaño: dañoADescontar
	ataquesRecibidosEnTrance := ataquesRecibidosEnTrance + 1.
	ataquesRecibidosEnTrance >= 4 ifTrue: [	unCombatiente posturaDeCombate: FuertementeCansado new].
! !

!EnTrance methodsFor: 'public' stamp: 'SF 6/18/2023 14:13:04'!
dañoAAbsorber
	^4 * pv.! !

!EnTrance methodsFor: 'public' stamp: 'SF 6/18/2023 13:52:30'!
dañoExtra
	^0 * pv.! !


!EnTrance methodsFor: 'initialization' stamp: 'SF 6/18/2023 14:31:41'!
initialize
	ataquesRecibidosEnTrance := 0.! !


!EnTrance methodsFor: 'as yet unclassified' stamp: 'SF 6/29/2023 20:04:54'!
haAtacadoElCombatiente: unCombatiente
	^self.! !


!classDefinition: #FuertementeCansado category: 'AlgoIII-2023-1C-1Recu-CombatientesFantasticos'!
PosturaDeCombate subclass: #FuertementeCansado
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2023-1C-1Recu-CombatientesFantasticos'!

!FuertementeCansado methodsFor: 'public' stamp: 'SF 6/18/2023 14:25:51'!
combatiente: unCombatiente vaARecibirDaño: dañoADescontar! !

!FuertementeCansado methodsFor: 'public' stamp: 'SF 6/18/2023 14:13:22'!
dañoAAbsorber
	^0 * pv.! !

!FuertementeCansado methodsFor: 'public' stamp: 'SF 6/18/2023 13:50:35'!
dañoExtra
	^-2 * pv.! !


!FuertementeCansado methodsFor: 'as yet unclassified' stamp: 'SF 6/29/2023 20:04:28'!
haAtacadoElCombatiente: unCombatiente
	^self.! !


!classDefinition: #Furioso category: 'AlgoIII-2023-1C-1Recu-CombatientesFantasticos'!
PosturaDeCombate subclass: #Furioso
	instanceVariableNames: 'ataquesRealizadosEstandoFurioso'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2023-1C-1Recu-CombatientesFantasticos'!

!Furioso methodsFor: 'public' stamp: 'SF 6/18/2023 12:53:28'!
combatiente: unCombatiente vaARecibirDaño: dañoADescontar
	^self.! !

!Furioso methodsFor: 'public' stamp: 'SF 6/18/2023 12:36:21'!
dañoExtra
	^4 * pv.! !


!Furioso methodsFor: 'as yet unclassified' stamp: 'JMB 6/29/2023 16:49:10'!
haAtacadoElCombatiente: unCombatiente

	ataquesRealizadosEstandoFurioso := ataquesRealizadosEstandoFurioso + 1.
	ataquesRealizadosEstandoFurioso > 3 ifTrue: [unCombatiente posturaDeCombate: LevementeCansado new].! !


!Furioso methodsFor: 'initialization' stamp: 'SF 6/18/2023 13:02:30'!
initialize
	ataquesRealizadosEstandoFurioso := 0.! !


!classDefinition: #LevementeCansado category: 'AlgoIII-2023-1C-1Recu-CombatientesFantasticos'!
PosturaDeCombate subclass: #LevementeCansado
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2023-1C-1Recu-CombatientesFantasticos'!

!LevementeCansado methodsFor: 'public' stamp: 'SF 6/18/2023 12:53:19'!
combatiente: unCombatiente vaARecibirDaño: dañoADescontar
	^self.! !

!LevementeCansado methodsFor: 'public' stamp: 'SF 6/18/2023 12:37:47'!
dañoExtra
	^-2 * pv.! !

!LevementeCansado methodsFor: 'public' stamp: 'SF 6/18/2023 13:08:17'!
haAtacadoElCombatiente: unCombatiente
	^self.! !


!classDefinition: #NormalBarbaro category: 'AlgoIII-2023-1C-1Recu-CombatientesFantasticos'!
PosturaDeCombate subclass: #NormalBarbaro
	instanceVariableNames: 'dañoSufrido'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2023-1C-1Recu-CombatientesFantasticos'!

!NormalBarbaro methodsFor: 'public' stamp: 'JMB 6/29/2023 16:49:10'!
combatiente: unCombatiente vaARecibirDaño: dañoADescontar
	dañoSufrido := dañoSufrido + dañoADescontar.
	dañoSufrido >= (8 * pv) ifTrue: [unCombatiente posturaDeCombate: Furioso new]! !

!NormalBarbaro methodsFor: 'public' stamp: 'SF 6/18/2023 12:35:55'!
dañoExtra
	^0 * pv.! !

!NormalBarbaro methodsFor: 'public' stamp: 'SF 6/18/2023 13:07:51'!
haAtacadoElCombatiente: unCombatiente
	^self.! !


!NormalBarbaro methodsFor: 'initialization' stamp: 'SF 6/18/2023 12:50:20'!
initialize
	dañoSufrido := 0 * pv.! !


!NormalBarbaro methodsFor: 'as yet unclassified' stamp: 'SF 6/29/2023 20:12:17'!
dañoAAbsorber
	^0 * pv.! !


!classDefinition: #NormalDerviche category: 'AlgoIII-2023-1C-1Recu-CombatientesFantasticos'!
PosturaDeCombate subclass: #NormalDerviche
	instanceVariableNames: 'dañoSufrido'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2023-1C-1Recu-CombatientesFantasticos'!

!NormalDerviche methodsFor: 'public' stamp: 'JMB 6/29/2023 16:49:10'!
combatiente: unCombatiente vaARecibirDaño: dañoADescontar
	dañoSufrido := dañoSufrido + dañoADescontar.
	dañoSufrido >= (8 * pv) ifTrue: [unCombatiente posturaDeCombate: EnTrance new].
! !

!NormalDerviche methodsFor: 'public' stamp: 'SF 6/18/2023 14:12:41'!
dañoAAbsorber
	^0 * pv.! !

!NormalDerviche methodsFor: 'public' stamp: 'SF 6/18/2023 13:52:10'!
dañoExtra
	^0 * pv.! !


!NormalDerviche methodsFor: 'initialization' stamp: 'SF 6/18/2023 14:26:46'!
initialize
	dañoSufrido := 0 * pv.! !


!NormalDerviche methodsFor: 'as yet unclassified' stamp: 'SF 6/29/2023 20:04:08'!
haAtacadoElCombatiente: unCombatiente
	^self.! !


!classDefinition: #NormalMarcial category: 'AlgoIII-2023-1C-1Recu-CombatientesFantasticos'!
PosturaDeCombate subclass: #NormalMarcial
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2023-1C-1Recu-CombatientesFantasticos'!

!NormalMarcial methodsFor: 'public' stamp: 'SF 6/29/2023 20:00:21'!
dañoAAbsorber
	^0 * pv.! !

!NormalMarcial methodsFor: 'public' stamp: 'SF 6/29/2023 19:58:28'!
dañoExtra
	^0 * pv.! !


!NormalMarcial methodsFor: 'as yet unclassified' stamp: 'SF 6/29/2023 20:03:54'!
haAtacadoElCombatiente: unCombatiente
	^self.! !


!classDefinition: #ResultadoDeCombate category: 'AlgoIII-2023-1C-1Recu-CombatientesFantasticos'!
Object subclass: #ResultadoDeCombate
	instanceVariableNames: 'numeroDeRonda ganador'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2023-1C-1Recu-CombatientesFantasticos'!

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

!classDefinition: 'ResultadoDeCombate class' category: 'AlgoIII-2023-1C-1Recu-CombatientesFantasticos'!
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