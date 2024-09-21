!classDefinition: #IntegradoresTest category: 'AlgoIII-2023-1C-2Parcial-CombatientesFantasticos-P4-TestIntegradores'!
TestCase subclass: #IntegradoresTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2023-1C-2Parcial-CombatientesFantasticos-P4-TestIntegradores'!

!IntegradoresTest methodsFor: 'para completar' stamp: 'pg 6/15/2023 00:04:33'!
curadorConBalsamoEsencialQueSanaLaMayorCantidadPosible

	^CombatienteCurador con: BalsamoEsencial new siguiendo: EstrategiaDeAplicacion sanarALaMayorCantidadPosible! !

!IntegradoresTest methodsFor: 'para completar' stamp: 'pg 6/14/2023 23:57:28'!
curadorConBalsamoEsencialQueSanaLoMaximoPosible

	^CombatienteCurador con: BalsamoEsencial new siguiendo: EstrategiaDeAplicacion sanarLoMaximoPosible ! !

!IntegradoresTest methodsFor: 'para completar' stamp: 'pg 6/15/2023 00:05:00'!
curadorConCristalMisticoQueSanaLaMayorCantidadPosible

	^CombatienteCurador con: CristalMistico new siguiendo: EstrategiaDeAplicacion sanarALaMayorCantidadPosible! !

!IntegradoresTest methodsFor: 'para completar' stamp: 'pg 6/14/2023 23:55:44'!
curadorConCristalMisticoQueSanaLoMaximoPosible

	^CombatienteCurador con: CristalMistico new siguiendo: EstrategiaDeAplicacion sanarLoMaximoPosible ! !


!IntegradoresTest methodsFor: 'tests' stamp: 'SF 6/16/2023 15:55:31'!
test01UnEquipoConCuradorEquipadoConCristalMisticoQueSanaLaMayorCantidadPosibleLeGanaASuEquipoEspejo
	| orquestador resultado bandoSinCurador bandoConCurador |
	bandoSinCurador := { CombatienteHumanoide new}.
	bandoConCurador := { CombatienteHumanoide new.  self curadorConCristalMisticoQueSanaLaMayorCantidadPosible }.
	orquestador := OrquestadorDeCombates 
	establecerCombateEntreBando1: bandoSinCurador
	contraBando2: bandoConCurador.
	
	resultado := orquestador desarrollarDuranteRondas: 10.
	
	self assert: resultado tieneDeGanadorAlBando2.! !

!IntegradoresTest methodsFor: 'tests' stamp: 'SF 6/16/2023 15:54:34'!
test02UnEquipoConCuradorEquipadoConBalsamoEsencialQueSanaLaMayorCantidadPosibleLeGanaASuEquipoEspejo
	| orquestador resultado bandoConCurador bandoSinCurador |
	bandoConCurador := { CombatienteHumanoide new.  self curadorConBalsamoEsencialQueSanaLaMayorCantidadPosible }.
	bandoSinCurador := { CombatienteHumanoide new}.
	orquestador := OrquestadorDeCombates 
	establecerCombateEntreBando1: bandoSinCurador 
	contraBando2: bandoConCurador.
	
	resultado := orquestador desarrollarDuranteRondas: 10.
	
	self assert: resultado tieneDeGanadorAlBando2.! !

!IntegradoresTest methodsFor: 'tests' stamp: 'SF 6/16/2023 15:54:38'!
test03ParaEquiposConDragonesEsMasEfectivoElCuradorEquipadoConCristalMisticoQueSanaLaMayorCantidadPosible
	| orquestador resultado bandoConBalsamo bandoConCristal |
	bandoConBalsamo := { CombatienteDragon new. self curadorConBalsamoEsencialQueSanaLaMayorCantidadPosible }.
	bandoConCristal := { CombatienteDragon new.  self curadorConCristalMisticoQueSanaLaMayorCantidadPosible }.
	orquestador := OrquestadorDeCombates 
	establecerCombateEntreBando1: bandoConBalsamo
	contraBando2: bandoConCristal.
	
	resultado := orquestador desarrollarDuranteRondas: 50.
	
	self assert: resultado tieneDeGanadorAlBando2.! !

!IntegradoresTest methodsFor: 'tests' stamp: 'SF 6/16/2023 15:54:42'!
test04ParaEquiposConHumanoidesSonIgualDeEfectivosCuradoresConCualquierEquipamientoQueSananLaMayorCantidadPosible
	| orquestador resultado bandoConCristal bandoConBalsamo |
	bandoConCristal := { self nuevoCombatienteEquipado. self nuevoCombatienteEquipado. self curadorConCristalMisticoQueSanaLaMayorCantidadPosible }.
	bandoConBalsamo := { self nuevoCombatienteEquipado. self nuevoCombatienteEquipado. self curadorConBalsamoEsencialQueSanaLaMayorCantidadPosible }.
	orquestador := OrquestadorDeCombates 
	establecerCombateEntreBando1: bandoConCristal 
	contraBando2: bandoConBalsamo.
	
	resultado := orquestador desarrollarDuranteRondas: 50.
	
	self assert: resultado tieneDeGanadorAlBando2.! !


!IntegradoresTest methodsFor: 'test-objects' stamp: 'SF 6/16/2023 15:27:18'!
nuevoCombatienteEquipado
	| combatiente |
	combatiente := CombatienteHumanoide new.
	combatiente equiparConUnaArmaduraDeCuero.
	combatiente equiparConUnaLanza.
	^combatiente.! !
