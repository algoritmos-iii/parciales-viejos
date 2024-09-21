!classDefinition: #IntegradoresTest category: 'AlgoIII-2023-1C-2Parcial-CombatientesFantasticos-P4-TestIntegradores'!
TestCase subclass: #IntegradoresTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2023-1C-2Parcial-CombatientesFantasticos-P4-TestIntegradores'!

!IntegradoresTest methodsFor: 'para completar' stamp: 'SF 6/16/2023 15:58:57'!
curadorConBalsamoEsencialQueSanaLaMayorCantidadPosible

	^self failWith: 'Completar con un curador equipado con Balsamo Esencial que tenga como estrategia de aplicación sanar la mayor cantidad posible'! !

!IntegradoresTest methodsFor: 'para completar' stamp: 'SF 6/16/2023 15:59:24'!
curadorConBalsamoEsencialQueSanaLoMaximoPosible

	^self failWith: 'Completar con un curador equipado con Balsamo Esencial que tenga como estrategia de aplicación sanar lo máximo posible'! !

!IntegradoresTest methodsFor: 'para completar' stamp: 'SF 6/16/2023 15:59:37'!
curadorConCristalMisticoQueSanaLaMayorCantidadPosible

	^self failWith: 'Completar con un curador equipado con Cristal Mistico que tenga como estrategia de aplicación sanar la mayor cantidad posible'! !

!IntegradoresTest methodsFor: 'para completar' stamp: 'SF 6/16/2023 15:59:57'!
curadorConCristalMisticoQueSanaLoMaximoPosible

	^self failWith: 'Completar con un curador equipado con Cristal Mistico que tenga como estrategia de aplicación sanar lo máximo posible'! !


!IntegradoresTest methodsFor: 'tests' stamp: 'SF 6/16/2023 15:57:56'!
xtest01UnEquipoConCuradorEquipadoConCristalMisticoQueSanaLaMayorCantidadPosibleLeGanaASuEquipoEspejo
	| orquestador resultado bandoSinCurador bandoConCurador |
	bandoSinCurador := { CombatienteHumanoide new}.
	bandoConCurador := { CombatienteHumanoide new.  self curadorConCristalMisticoQueSanaLaMayorCantidadPosible }.
	orquestador := OrquestadorDeCombates 
	establecerCombateEntreBando1: bandoSinCurador
	contraBando2: bandoConCurador.
	
	resultado := orquestador desarrollarDuranteRondas: 10.
	
	self assert: resultado tieneDeGanadorAlBando2.! !

!IntegradoresTest methodsFor: 'tests' stamp: 'SF 6/16/2023 15:58:09'!
xtest02UnEquipoConCuradorEquipadoConBalsamoEsencialQueSanaLaMayorCantidadPosibleLeGanaASuEquipoEspejo
	| orquestador resultado bandoConCurador bandoSinCurador |
	bandoConCurador := { CombatienteHumanoide new.  self curadorConBalsamoEsencialQueSanaLaMayorCantidadPosible }.
	bandoSinCurador := { CombatienteHumanoide new}.
	orquestador := OrquestadorDeCombates 
	establecerCombateEntreBando1: bandoSinCurador 
	contraBando2: bandoConCurador.
	
	resultado := orquestador desarrollarDuranteRondas: 10.
	
	self assert: resultado tieneDeGanadorAlBando2.! !

!IntegradoresTest methodsFor: 'tests' stamp: 'SF 6/16/2023 15:58:06'!
xtest03ParaEquiposConDragonesEsMasEfectivoElCuradorEquipadoConCristalMisticoQueSanaLaMayorCantidadPosible
	| orquestador resultado bandoConBalsamo bandoConCristal |
	bandoConBalsamo := { CombatienteDragon new. self curadorConBalsamoEsencialQueSanaLaMayorCantidadPosible }.
	bandoConCristal := { CombatienteDragon new.  self curadorConCristalMisticoQueSanaLaMayorCantidadPosible }.
	orquestador := OrquestadorDeCombates 
	establecerCombateEntreBando1: bandoConBalsamo
	contraBando2: bandoConCristal.
	
	resultado := orquestador desarrollarDuranteRondas: 50.
	
	self assert: resultado tieneDeGanadorAlBando2.! !

!IntegradoresTest methodsFor: 'tests' stamp: 'SF 6/16/2023 15:58:01'!
xtest04ParaEquiposConHumanoidesSonIgualDeEfectivosCuradoresConCualquierEquipamientoQueSananLaMayorCantidadPosible
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
