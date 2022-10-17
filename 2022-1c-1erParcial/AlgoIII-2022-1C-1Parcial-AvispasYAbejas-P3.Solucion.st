!classDefinition: #CicloReproductivoDeAvispasTest category: 'AlgoIII-2022-1C-1Parcial-AvispasYAbejas-P3'!
TestCase subclass: #CicloReproductivoDeAvispasTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2022-1C-1Parcial-AvispasYAbejas-P3'!

!CicloReproductivoDeAvispasTest methodsFor: 'tests' stamp: 'JMB 5/20/2022 19:43:18'!
test01EnElInicioDeLosTiemposHayUnaCantidadDeAvispasVivas

	| unHabitat |
	unHabitat := Habitat conAvispasComeOrugas: 2.	
	self assert: 2 equals: unHabitat cantidadDeAvispasVivas.
	! !

!CicloReproductivoDeAvispasTest methodsFor: 'tests' stamp: 'JMB 5/20/2022 19:43:26'!
test02EnElInicioDeLosTiemposNoHayHuevosDeAvispas

	| unHabitat |
	unHabitat := Habitat conAvispasComeOrugas: 2.	
	self assert: 0 equals: unHabitat cantidadDeHuevosDeAvispas.! !

!CicloReproductivoDeAvispasTest methodsFor: 'tests' stamp: 'JMB 5/20/2022 19:43:39'!
test03LasAvispasMuerenAlCambiarDeAño
	| unHabitat |
	unHabitat := Habitat conAvispasComeOrugas: 2.	
	
	unHabitat avanzarUnAño.
	
	self assert: 0 equals: unHabitat cantidadDeAvispasVivas.
	! !

!CicloReproductivoDeAvispasTest methodsFor: 'tests' stamp: 'JMB 5/20/2022 19:44:52'!
test04AlReproducirseUnaAvispaAlSiguienteAñoGestanUnaAvispaDescendiente
	| unHabitat avispaQueDejaUnHuevo |
	unHabitat := Habitat conAvispasComeOrugas: 2.	
	unHabitat gestarCantidadDeOrugas: 1.
	avispaQueDejaUnHuevo := unHabitat avispas first.
	avispaQueDejaUnHuevo intentarReproducirse.
	
	unHabitat avanzarUnAño.
	
	self assert: 1 equals: unHabitat cantidadDeAvispasVivas.
	! !

!CicloReproductivoDeAvispasTest methodsFor: 'tests' stamp: 'JMB 5/20/2022 19:47:23'!
test05ReproducirseUnaAvispaAlSiguienteAñoGestanUnaAvispaDescendientePeroNoPuedeGestarNingunaAlOtroAño
	| habitat avispaQueDejaUnaCria |
	habitat := Habitat conAvispasComeOrugas: 2.	
	habitat gestarCantidadDeOrugas: 1.
	avispaQueDejaUnaCria := habitat avispas first.
	avispaQueDejaUnaCria intentarReproducirse.
	
	habitat avanzarUnAño.
	habitat avanzarUnAño.
	
	self assert: 0 equals: habitat cantidadDeAvispasVivas.
	! !

!CicloReproductivoDeAvispasTest methodsFor: 'tests' stamp: 'JMB 5/22/2022 21:44:47'!
test06AlReproducirseUnaAvispaComeOrugasAlSiguienteAñoGestanUnaDescendienteDeSuFirmaGenetica
	| habitat avispaQueDejaUnHuevo |
	habitat := Habitat conAvispasComeOrugas: 2.	
	habitat gestarCantidadDeOrugas: 1.
	avispaQueDejaUnHuevo := habitat avispas first.
	avispaQueDejaUnHuevo intentarReproducirse.
	
	habitat avanzarUnAño.
	
	self assert: 1 equals: (habitat cantidadDeAvispasVivasCumplanCon: [ : unaAvispa | unaAvispa tieneMismaFirmaGeneticaDe: avispaQueDejaUnHuevo ]).
	! !

!CicloReproductivoDeAvispasTest methodsFor: 'tests' stamp: 'JMB 5/22/2022 21:45:11'!
test07AlReproducirseUnaAvispaComePolillasAlSiguienteAñoGestanUnaDescendienteDeSuFirmaGenetica
	| habitat avispaQueDejaUnHuevo |
	habitat := Habitat conAvispasComePolillas: 2.	
	habitat gestarCantidadDePolillas: 1.
	avispaQueDejaUnHuevo := habitat avispas first.
	avispaQueDejaUnHuevo intentarReproducirse.
	
	habitat avanzarUnAño.
	
	self assert: 1 equals: (habitat cantidadDeAvispasVivasCumplanCon: [ : unaAvispa | unaAvispa tieneMismaFirmaGeneticaDe: avispaQueDejaUnHuevo ]).
	! !

!CicloReproductivoDeAvispasTest methodsFor: 'tests' stamp: 'JMB 5/22/2022 21:45:22'!
test08AlReproducirseUnaAvispaLadronaAlSiguienteAñoGestanUnaDescendienteDeSuFirmaGenetica
	| habitat avispaQueDejaUnHuevo avispaQueRoba |
	habitat := Habitat conAvispasComeOrugas: 1 ladronas: 	1.
	habitat gestarCantidadDeOrugas: 1.
	avispaQueDejaUnHuevo := (habitat elegirAvispasQueCumplanCon: [: cadaAvispa | cadaAvispa esComeOrugas]) first.
	avispaQueRoba := (habitat elegirAvispasQueCumplanCon: [: cadaAvispa | cadaAvispa esLadrona]) first.
	avispaQueDejaUnHuevo intentarReproducirse.
	avispaQueRoba intentarReproducirse.
	
	habitat avanzarUnAño.
	
	self assert: 1 equals: (habitat cantidadDeAvispasVivasCumplanCon: [ : unaAvispa | unaAvispa tieneMismaFirmaGeneticaDe: avispaQueRoba ]).
	! !


!classDefinition: #ReproduccionAvispasTests category: 'AlgoIII-2022-1C-1Parcial-AvispasYAbejas-P3'!
TestCase subclass: #ReproduccionAvispasTests
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2022-1C-1Parcial-AvispasYAbejas-P3'!

!ReproduccionAvispasTests methodsFor: 'avispas come orugas' stamp: 'JMB 5/19/2022 18:54:29'!
test01CuandoUnAvispaComeOrugasSeReproducePorPrimeraVezDejaUnHuevo
	| unHabitat |
	unHabitat := self habitatConOrugas: 1 yUnaAvispaComeOrugasQueIntentoReproducirse: 1.	
	self assert: 1 equals: unHabitat cantidadDeHuevosDeAvispas.! !

!ReproduccionAvispasTests methodsFor: 'avispas come orugas' stamp: 'JMB 5/19/2022 18:54:29'!
test02CadaVezQueUnaAvispaComeOrugasSeReproduceDejaUnHuevoMas
	| unHabitat |
	unHabitat := self habitatConOrugas: 2 yUnaAvispaComeOrugasQueIntentoReproducirse: 2.		
	self assert: 2 equals: unHabitat cantidadDeHuevosDeAvispas.! !

!ReproduccionAvispasTests methodsFor: 'avispas come orugas' stamp: 'JMB 5/19/2022 18:54:29'!
test03ParaDejarUnHuevoUnaAvispaComeOrugasReduceLaPoblacionDeUnaOrugaANinguna
	| unHabitat |
	unHabitat := self habitatConOrugas: 1 yUnaAvispaComeOrugasQueIntentoReproducirse: 1.		
	self assert: 0 equals: unHabitat cantidadDeOrugas.! !

!ReproduccionAvispasTests methodsFor: 'avispas come orugas' stamp: 'JMB 5/19/2022 18:54:29'!
test04ParaDejarUnHuevoUnaAvispaComeOrugasDecrementaEnUnoLaPoblacionDeOrugasDelHabitat
	| unHabitat |
	unHabitat := self habitatConOrugas: 2 yUnaAvispaComeOrugasQueIntentoReproducirse: 1.		
	self assert: 1 equals: unHabitat cantidadDeOrugas.! !

!ReproduccionAvispasTests methodsFor: 'avispas come orugas' stamp: 'JMB 5/19/2022 18:54:29'!
test05CuandoNoHayOrugasUnaAvispaComeOrugasNoPuedeDejarHuevos
	| unHabitat |
	unHabitat := self habitatConOrugas: 0 yUnaAvispaComeOrugasQueIntentoReproducirse: 1.	
	self assert: 0 equals: unHabitat cantidadDeHuevosDeAvispas.! !


!ReproduccionAvispasTests methodsFor: 'avispas come polillas' stamp: 'JMB 5/19/2022 18:52:26'!
test06CuandoUnaAvispaComePolillasSeReproduceDejaUnHuevo
	| unHabitat |.
	unHabitat := self habitatConUnaAvispaComePolillasQueSeIntentaReproducirUnaVezTeniendoPolillas: 1.	
	self assert: 1 equals: unHabitat cantidadDeHuevosDeAvispas.! !

!ReproduccionAvispasTests methodsFor: 'avispas come polillas' stamp: 'JMB 5/19/2022 18:52:26'!
test07ParaDejarUnHuevoUnaAvispaComePolillasReduceLaPoblacionDeUnaPolillaANinguna
	| unHabitat |
	unHabitat := self habitatConUnaAvispaComePolillasQueSeIntentaReproducirUnaVezTeniendoPolillas: 1.	
	self assert: 0 equals: unHabitat cantidadDePolillas.! !

!ReproduccionAvispasTests methodsFor: 'avispas come polillas' stamp: 'JMB 5/19/2022 18:52:26'!
test08ParaDejarUnHuevoUnaAvispaComePolillasDecrementaEnUnoLaPoblacionDePolillasDelHabitat
	| unHabitat |
	unHabitat := self habitatConUnaAvispaComePolillasQueSeIntentaReproducirUnaVezTeniendoPolillas: 2.	
	self assert: 1 equals: unHabitat cantidadDePolillas.! !

!ReproduccionAvispasTests methodsFor: 'avispas come polillas' stamp: 'JMB 5/19/2022 18:52:26'!
test09CuandoNoHayPolillasUnaAvispaComePolillasNoPuedeDejarHuevos
	| unHabitat |
	unHabitat := self habitatConUnaAvispaComePolillasQueSeIntentaReproducirUnaVezTeniendoPolillas: 0.	
	self assert: 0 equals: unHabitat cantidadDeHuevosDeAvispas.! !


!ReproduccionAvispasTests methodsFor: 'firma genetica' stamp: 'JMB 5/20/2022 01:12:57'!
test10CuandoUnaAvispaComeOrugasSeReproduceDejaUnHuevoConSuFirmaGenetica
	| unHabitat unaAvispaAReproducirse |
	unHabitat := Habitat conAvispasComeOrugas: 1.
	unHabitat gestarCantidadDeOrugas: 1.
	unaAvispaAReproducirse := (self elegirAvispasComeOrugasDe: unHabitat) first.
	
	unaAvispaAReproducirse intentarReproducirse.
	
	self assert: 1 equals: (unHabitat cantidadDeHuevosConLaFirmaGenetica: unaAvispaAReproducirse firmaGenetica).! !

!ReproduccionAvispasTests methodsFor: 'firma genetica' stamp: 'JMB 5/20/2022 01:12:57'!
test11CuandoUnaAvispaComeOrugasAunNoSeReprodujoNoTieneHuevosConSuFirmaGenetica
	| unHabitat unaAvispaAReproducirse |
	unHabitat := Habitat conAvispasComeOrugas: 1.
	unaAvispaAReproducirse := (self elegirAvispasComeOrugasDe: unHabitat) first.
	
	unaAvispaAReproducirse intentarReproducirse.
	
	self assert: 0 equals: (unHabitat cantidadDeHuevosConLaFirmaGenetica: unaAvispaAReproducirse firmaGenetica).! !

!ReproduccionAvispasTests methodsFor: 'firma genetica' stamp: 'JMB 5/20/2022 21:11:28'!
test12CuandoUnaAvispaComePolillasSeReproduceDejaUnHuevoConSuFirmaGenetica
	| unHabitat unaAvispaComePolillas unaAvispaComeOrugas |
	unHabitat := Habitat conAvispasComeOrugas: 1 comePolillas: 1.
	unHabitat gestarCantidadDePolillas: 1.
	unaAvispaComePolillas := (self elegirAvispasComePolillasDe: unHabitat) first.
	unaAvispaComeOrugas := (self elegirAvispasComeOrugasDe: unHabitat) first.
	
	unaAvispaComePolillas intentarReproducirse.
	
	self assert: 1 equals: (unHabitat cantidadDeHuevosConLaFirmaGenetica: unaAvispaComePolillas firmaGenetica).
	self assert: 0 equals: (unHabitat cantidadDeHuevosConLaFirmaGenetica: unaAvispaComeOrugas firmaGenetica).! !

!ReproduccionAvispasTests methodsFor: 'firma genetica' stamp: 'JMB 5/20/2022 01:12:57'!
test13DosAvispasDelMismoTipoDejanHuevosDeLaMismaLineaGenetica
	| unHabitat unaAvispaComeOrugas otraAvispaComeOrugas |
	unHabitat := Habitat conAvispasComeOrugas: 2.
	unHabitat gestarCantidadDeOrugas: 1.
	unaAvispaComeOrugas := (self elegirAvispasComeOrugasDe: unHabitat) first.
	otraAvispaComeOrugas := (self elegirAvispasComeOrugasDe: unHabitat) last.
	
	unaAvispaComeOrugas intentarReproducirse.
	
	self assert: 1 equals: (unHabitat cantidadDeHuevosConLaFirmaGenetica: unaAvispaComeOrugas firmaGenetica).
	self assert: 1 equals: (unHabitat cantidadDeHuevosConLaFirmaGenetica: otraAvispaComeOrugas firmaGenetica).! !


!ReproduccionAvispasTests methodsFor: 'avispas ladronas' stamp: 'JMB 5/20/2022 01:14:14'!
test14CuandoUnaAvispaLadronaSeReproduceDejaUnHuevoConSuFirmaGenetica
	| unHabitat unaAvispaASerRobada unaAvispaLadrona |
	unHabitat := Habitat conAvispasComeOrugas: 1 ladronas: 1.
	unHabitat gestarCantidadDeOrugas: 1.
	unaAvispaASerRobada := (self elegirAvispasComeOrugasDe: unHabitat) first.
	unaAvispaLadrona := (self elegirAvispasLadronasDe: unHabitat) first.
	unaAvispaASerRobada intentarReproducirse.
	 
	unaAvispaLadrona intentarReproducirse.
	
	self assert: 1 equals: (unHabitat cantidadDeHuevosConLaFirmaGenetica: unaAvispaLadrona firmaGenetica).! !

!ReproduccionAvispasTests methodsFor: 'avispas ladronas' stamp: 'JMB 5/20/2022 01:14:14'!
test15CuandoUnaAvispaLadronaSeReproduceLeSacaUnHuevoAOtraAvispa
	| unHabitat unaAvispaASerRobada unaAvispaLadrona |
	unHabitat := Habitat conAvispasComeOrugas: 1 ladronas: 1.
	unHabitat gestarCantidadDeOrugas: 1.
	unaAvispaASerRobada := (self elegirAvispasComeOrugasDe: unHabitat) first.
	unaAvispaLadrona := (self elegirAvispasLadronasDe: unHabitat) first.
	unaAvispaASerRobada intentarReproducirse.
	 
	unaAvispaLadrona intentarReproducirse.
	
	self assert: 0 equals: (unHabitat cantidadDeHuevosConLaFirmaGenetica: unaAvispaASerRobada firmaGenetica).! !

!ReproduccionAvispasTests methodsFor: 'avispas ladronas' stamp: 'JMB 5/20/2022 01:14:14'!
test16CuandoUnaAvispaLadronaSeReproduceSoloRobaUnHuevo
	| unHabitat unaAvispaASerRobada unaAvispaLadrona |
	unHabitat := Habitat conAvispasComeOrugas: 1 ladronas: 1.
	unHabitat gestarCantidadDeOrugas: 2.
	unaAvispaASerRobada := (self elegirAvispasComeOrugasDe: unHabitat) first.
	unaAvispaLadrona := (self elegirAvispasLadronasDe: unHabitat) first.
	unaAvispaASerRobada intentarReproducirse.
	unaAvispaASerRobada intentarReproducirse.
	 
	unaAvispaLadrona intentarReproducirse.
	
	self assert: 1 equals: (unHabitat cantidadDeHuevosConLaFirmaGenetica: unaAvispaASerRobada firmaGenetica).! !

!ReproduccionAvispasTests methodsFor: 'avispas ladronas' stamp: 'JMB 5/20/2022 01:14:14'!
test17CuandoUnaAvispaLadronaNoTieneRecursosNoDejaUnHuevo
	| unHabitat unaAvispaLadrona |
	unHabitat := Habitat conAvispasComeOrugas: 1 ladronas: 1.
	unaAvispaLadrona := (self elegirAvispasLadronasDe: unHabitat) first.
	 
	unaAvispaLadrona intentarReproducirse.
	
	self assert: 0 equals: (unHabitat cantidadDeHuevosConLaFirmaGenetica: unaAvispaLadrona firmaGenetica).! !


!ReproduccionAvispasTests methodsFor: 'avispas ladronas - selectivas' stamp: 'JMB 5/20/2022 01:14:14'!
test18CuandoUnaAvispaLadronaSeReproduceRobaHuevosDeVariasAvispas
	| unHabitat unaAvispaASerRobada unaAvispaLadrona otraAvispaASerRobada |
	unHabitat := Habitat conAvispasComeOrugas: 1 comePolillas: 1 ladronas: 1.
	unHabitat gestarCantidadDeOrugas: 1.
	unHabitat gestarCantidadDePolillas: 1.
	unaAvispaASerRobada := (self elegirAvispasComeOrugasDe: unHabitat) first.
	otraAvispaASerRobada := (self elegirAvispasComePolillasDe: unHabitat) first.
	unaAvispaLadrona := (self elegirAvispasLadronasDe: unHabitat) first.
	unaAvispaASerRobada intentarReproducirse.
	otraAvispaASerRobada intentarReproducirse.
	unaAvispaLadrona intentarReproducirse.
	
	unaAvispaLadrona intentarReproducirse.
	
	self assert: 0 equals: (unHabitat cantidadDeHuevosConLaFirmaGenetica: unaAvispaASerRobada firmaGenetica).
	self assert: 0 equals: (unHabitat cantidadDeHuevosConLaFirmaGenetica: otraAvispaASerRobada firmaGenetica).
	self assert: 2 equals: (unHabitat cantidadDeHuevosConLaFirmaGenetica: unaAvispaLadrona firmaGenetica).
	! !

!ReproduccionAvispasTests methodsFor: 'avispas ladronas - selectivas' stamp: 'JMB 5/20/2022 01:14:14'!
test19CuandoUnaAvispaLadronaSeReproduceNoVuelveARobarDeLaUltimaLineaGeneticaQueYaHaRobado
	| unHabitat unaAvispaASerRobada unaAvispaLadrona |
	unHabitat := Habitat conAvispasComeOrugas: 1 comePolillas: 0 ladronas: 1.
	unHabitat gestarCantidadDeOrugas: 2.
	unaAvispaASerRobada := (self elegirAvispasComeOrugasDe: unHabitat) first.
	unaAvispaLadrona := (self elegirAvispasLadronasDe: unHabitat) first.
	unaAvispaASerRobada intentarReproducirse.
	unaAvispaASerRobada intentarReproducirse.
	unaAvispaLadrona intentarReproducirse. 
	
	unaAvispaLadrona intentarReproducirse.
	
	self assert: 1 equals: (unHabitat cantidadDeHuevosConLaFirmaGenetica: unaAvispaLadrona firmaGenetica).
	self assert: 1 equals: (unHabitat cantidadDeHuevosConLaFirmaGenetica: unaAvispaASerRobada firmaGenetica).! !

!ReproduccionAvispasTests methodsFor: 'avispas ladronas - selectivas' stamp: 'JMB 5/20/2022 01:14:14'!
test20CuandoUnaAvispaLadronaSeReproduceNoRobaHuevosDeNingunaFirmaGeneticaALaQueLeHayaRobadoPreviamente
	| unHabitat unaAvispaASerRobada unaAvispaLadrona otraAvispaASerRobada |
	unHabitat := Habitat conAvispasComeOrugas: 1 comePolillas: 1 ladronas: 1.
	unHabitat gestarCantidadDeOrugas: 2.
	unHabitat gestarCantidadDePolillas: 2.
	unaAvispaASerRobada := (self elegirAvispasComeOrugasDe: unHabitat) first.
	otraAvispaASerRobada := (self elegirAvispasComePolillasDe: unHabitat) first.
	unaAvispaLadrona := (self elegirAvispasLadronasDe: unHabitat) first.
	unaAvispaASerRobada intentarReproducirse.
	unaAvispaASerRobada intentarReproducirse.
	otraAvispaASerRobada intentarReproducirse.
	unaAvispaLadrona intentarReproducirse.
	unaAvispaLadrona intentarReproducirse.
	
	unaAvispaLadrona intentarReproducirse.
	
	self assert: 1 equals: (unHabitat cantidadDeHuevosConLaFirmaGenetica: unaAvispaASerRobada firmaGenetica).
	self assert: 0 equals: (unHabitat cantidadDeHuevosConLaFirmaGenetica: otraAvispaASerRobada firmaGenetica).
	self assert: 2 equals: (unHabitat cantidadDeHuevosConLaFirmaGenetica: unaAvispaLadrona firmaGenetica).
	! !


!ReproduccionAvispasTests methodsFor: 'avispas' stamp: 'JMB 5/20/2022 20:28:03'!
elegirAvispasComeOrugasDe: unHabitat

	^ unHabitat elegirAvispasQueCumplanCon: [: cadaAvispa | cadaAvispa esComeOrugas]! !

!ReproduccionAvispasTests methodsFor: 'avispas' stamp: 'JMB 5/20/2022 20:28:10'!
elegirAvispasComePolillasDe: unHabitat

	^ unHabitat elegirAvispasQueCumplanCon: [: cadaAvispa | cadaAvispa esComePolillas]! !

!ReproduccionAvispasTests methodsFor: 'avispas' stamp: 'JMB 5/20/2022 20:28:19'!
elegirAvispasLadronasDe: unHabitat

	^ unHabitat elegirAvispasQueCumplanCon: [: cadaAvispa | cadaAvispa esLadrona]! !


!ReproduccionAvispasTests methodsFor: 'habitats' stamp: 'JMB 5/20/2022 00:38:42'!
habitatConOrugas: unaCantidadDeOrugasAGestar yUnaAvispaComeOrugasQueIntentoReproducirse: cantidadDeVecesAReproducirse
	| unHabitat unaAvispaAReproducirse |
	unHabitat := Habitat conAvispasComeOrugas: 1.
	unHabitat gestarCantidadDeOrugas: unaCantidadDeOrugasAGestar.
	unaAvispaAReproducirse := (self elegirAvispasComeOrugasDe: unHabitat) first.
	
	cantidadDeVecesAReproducirse timesRepeat: [ unaAvispaAReproducirse intentarReproducirse ].
	^ unHabitat ! !

!ReproduccionAvispasTests methodsFor: 'habitats' stamp: 'JMB 5/20/2022 00:39:45'!
habitatConUnaAvispaComePolillasQueSeIntentaReproducirUnaVezTeniendoPolillas: unaCantidadDePolillasAGestar
	| unHabitat unaAvispaAReproducirse |
	unHabitat := Habitat conAvispasComePolillas: 1.
	unHabitat gestarCantidadDePolillas: unaCantidadDePolillasAGestar.
	unaAvispaAReproducirse := (self elegirAvispasComePolillasDe: unHabitat) first.
	unaAvispaAReproducirse intentarReproducirse.
	
	^ unHabitat! !


!classDefinition: #Avispa category: 'AlgoIII-2022-1C-1Parcial-AvispasYAbejas-P3'!
Object subclass: #Avispa
	instanceVariableNames: 'habitat'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2022-1C-1Parcial-AvispasYAbejas-P3'!

!Avispa methodsFor: 'initialization' stamp: 'JMB 5/20/2022 20:31:25'!
initializeEn: unHabitat  
	habitat := unHabitat.! !


!Avispa methodsFor: 'testing' stamp: 'JMB 5/20/2022 20:26:12'!
esComeOrugas
	^ false! !

!Avispa methodsFor: 'testing' stamp: 'JMB 5/20/2022 20:26:15'!
esComePolillas
	^ false! !

!Avispa methodsFor: 'testing' stamp: 'JMB 5/20/2022 20:26:19'!
esLadrona
	^ false! !

!Avispa methodsFor: 'testing' stamp: 'JMB 5/22/2022 21:44:17'!
tieneMismaFirmaGeneticaDe: unaAvispa
	^ self firmaGenetica = unaAvispa firmaGenetica! !


!Avispa methodsFor: 'reproduccion' stamp: 'JMB 5/20/2022 21:22:21'!
firmaGenetica
	^ self class firmaGenetica ! !

!Avispa methodsFor: 'reproduccion' stamp: 'JMB 5/20/2022 20:15:48'!
intentarReproducirse
	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Avispa class' category: 'AlgoIII-2022-1C-1Parcial-AvispasYAbejas-P3'!
Avispa class
	instanceVariableNames: ''!

!Avispa class methodsFor: 'firma genetica' stamp: 'JMB 5/20/2022 21:22:56'!
esCompatibleCon: unaFirmaGenetica
	^ self firmaGenetica = unaFirmaGenetica ! !

!Avispa class methodsFor: 'firma genetica' stamp: 'JMB 5/20/2022 21:22:37'!
firmaGenetica
	self subclassResponsibility ! !


!Avispa class methodsFor: 'instance creation' stamp: 'JMB 5/20/2022 21:25:33'!
con: unaFirmaGenetica enHabitat: unHabitat
	
	^ Avispa subclasses 
		detect: [ : cadaTipoDeAvispa | cadaTipoDeAvispa esCompatibleCon: unaFirmaGenetica ] 
		ifFound: [ : tipoDeAvispaCompatible | tipoDeAvispaCompatible enHabitat: unHabitat ]
		ifNone: [ self error: 'La firma genetica de avispa no es valida' ]! !

!Avispa class methodsFor: 'instance creation' stamp: 'JMB 5/20/2022 20:20:13'!
enHabitat: unHabitat  
	^self new initializeEn: unHabitat ! !


!classDefinition: #AvispaComeOrugas category: 'AlgoIII-2022-1C-1Parcial-AvispasYAbejas-P3'!
Avispa subclass: #AvispaComeOrugas
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2022-1C-1Parcial-AvispasYAbejas-P3'!

!AvispaComeOrugas methodsFor: 'testing' stamp: 'JMB 5/20/2022 20:26:40'!
esComeOrugas
	^ true! !


!AvispaComeOrugas methodsFor: 'reproduccion' stamp: 'JMB 5/20/2022 20:13:45'!
intentarReproducirse
	habitat tieneOrugas ifTrue: [
		habitat tomarUnaOruga.
		habitat dejarUnHuevoDeAvispa: self
	].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AvispaComeOrugas class' category: 'AlgoIII-2022-1C-1Parcial-AvispasYAbejas-P3'!
AvispaComeOrugas class
	instanceVariableNames: ''!

!AvispaComeOrugas class methodsFor: 'reproduccion' stamp: 'JMB 5/20/2022 21:21:32'!
firmaGenetica
	^ #'come-orugas'! !


!classDefinition: #AvispaComePolillas category: 'AlgoIII-2022-1C-1Parcial-AvispasYAbejas-P3'!
Avispa subclass: #AvispaComePolillas
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2022-1C-1Parcial-AvispasYAbejas-P3'!

!AvispaComePolillas methodsFor: 'testing' stamp: 'JMB 5/20/2022 20:26:51'!
esComePolillas
	^ true! !


!AvispaComePolillas methodsFor: 'reproduccion' stamp: 'JMB 5/20/2022 20:13:45'!
intentarReproducirse
	habitat tienePolillas ifTrue: [
		habitat tomarUnaPolilla.
		habitat dejarUnHuevoDeAvispa: self
	].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AvispaComePolillas class' category: 'AlgoIII-2022-1C-1Parcial-AvispasYAbejas-P3'!
AvispaComePolillas class
	instanceVariableNames: ''!

!AvispaComePolillas class methodsFor: 'reproduccion' stamp: 'JMB 5/20/2022 21:21:50'!
firmaGenetica
	^ #'come-polillas'! !


!classDefinition: #AvispaLadrona category: 'AlgoIII-2022-1C-1Parcial-AvispasYAbejas-P3'!
Avispa subclass: #AvispaLadrona
	instanceVariableNames: 'firmasGeneticasYaRobadas'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2022-1C-1Parcial-AvispasYAbejas-P3'!

!AvispaLadrona methodsFor: 'initialization' stamp: 'JMB 5/20/2022 20:33:51'!
initializeEn: unHabitat  
	super initializeEn: unHabitat.
	firmasGeneticasYaRobadas := OrderedCollection with: self firmaGenetica.! !


!AvispaLadrona methodsFor: 'testing' stamp: 'JMB 5/20/2022 20:28:59'!
esLadrona
	^ true! !


!AvispaLadrona methodsFor: 'reproduccion' stamp: 'JMB 5/20/2022 20:34:24'!
intentarReproducirse
	| firmaGeneticaRobada  |
	(habitat tieneHuevosDeAvispasQueNoSeanDe: firmasGeneticasYaRobadas) ifTrue: [
		firmaGeneticaRobada := habitat robarUnHuevoQueNoSeaDe: firmasGeneticasYaRobadas.
		habitat dejarUnHuevoDeAvispa: self.
		firmasGeneticasYaRobadas add: firmaGeneticaRobada
	].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AvispaLadrona class' category: 'AlgoIII-2022-1C-1Parcial-AvispasYAbejas-P3'!
AvispaLadrona class
	instanceVariableNames: ''!

!AvispaLadrona class methodsFor: 'reproduccion' stamp: 'JMB 5/20/2022 21:22:08'!
firmaGenetica
	^ #ladrona! !


!classDefinition: #Habitat category: 'AlgoIII-2022-1C-1Parcial-AvispasYAbejas-P3'!
Object subclass: #Habitat
	instanceVariableNames: 'avispas cantidadDeOrugas cantidadDePolillas cantidadDeHuevosDeAvispasYSuAlimentoPorLineaGenetica'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2022-1C-1Parcial-AvispasYAbejas-P3'!

!Habitat methodsFor: 'initialization' stamp: 'JMB 5/20/2022 01:07:16'!
initializeConAvispas: unasAvispasIniciales
	cantidadDeHuevosDeAvispasYSuAlimentoPorLineaGenetica := Dictionary new.
	cantidadDeOrugas := 0.
	cantidadDePolillas := 0.
	avispas := unasAvispasIniciales! !


!Habitat methodsFor: 'avispas' stamp: 'JMB 5/20/2022 01:09:25'!
avispas
	^ avispas! !

!Habitat methodsFor: 'avispas' stamp: 'JMB 5/17/2022 21:13:53'!
cantidadDeAvispasVivas
	^ avispas size! !

!Habitat methodsFor: 'avispas' stamp: 'JMB 5/20/2022 20:44:36'!
cantidadDeAvispasVivasCumplanCon: unaCondicion 
	^ (self elegirAvispasQueCumplanCon: unaCondicion) size! !

!Habitat methodsFor: 'avispas' stamp: 'JMB 5/20/2022 20:38:25'!
elegirAvispasQueCumplanCon: unaCondicionASeleccionar 
	^ avispas select: unaCondicionASeleccionar ! !


!Habitat methodsFor: 'huevos de avispas' stamp: 'JMB 5/18/2022 12:05:53'!
cantidadDeHuevosConLaFirmaGenetica: unaFirmaGenetica
	^ cantidadDeHuevosDeAvispasYSuAlimentoPorLineaGenetica at: unaFirmaGenetica ifAbsent: [ 0 ]! !

!Habitat methodsFor: 'huevos de avispas' stamp: 'JMB 5/18/2022 12:14:19'!
cantidadDeHuevosDeAvispas
	^ cantidadDeHuevosDeAvispasYSuAlimentoPorLineaGenetica values sum: [ : unaCantidadDeHuevos | unaCantidadDeHuevos ] ifEmpty: [ 0 ]! !

!Habitat methodsFor: 'huevos de avispas' stamp: 'JMB 5/18/2022 16:40:25'!
dejarUnHuevoDeAvispa: unaAvispaAAovar
	| cantidadDeHuevos |
	cantidadDeHuevos := self cantidadDeHuevosConLaFirmaGenetica: unaAvispaAAovar firmaGenetica.
	self contabilizar: cantidadDeHuevos + 1 a: unaAvispaAAovar firmaGenetica.! !

!Habitat methodsFor: 'huevos de avispas' stamp: 'JMB 5/18/2022 22:33:05'!
robarUnHuevoQueNoSeaDe: firmasGeneticasExcluidas
	| cantidadDeHuevos unaFirmaGeneticaARobar |
	unaFirmaGeneticaARobar := self firmaGeneticaARobarQueNoSea: firmasGeneticasExcluidas.
	cantidadDeHuevos := self cantidadDeHuevosConLaFirmaGenetica: unaFirmaGeneticaARobar.
	self contabilizar: cantidadDeHuevos - 1 a: unaFirmaGeneticaARobar.
	^ unaFirmaGeneticaARobar! !

!Habitat methodsFor: 'huevos de avispas' stamp: 'JMB 5/20/2022 20:41:07'!
tieneHuevosDeAvispasQueNoSeanDe: unasFirmasGeneticas

	^ self cantidadDeHuevosDeAvispas > (self cantidadDeHuevosConLasFirmasGeneticas: unasFirmasGeneticas)! !


!Habitat methodsFor: 'alimentos de las avispas' stamp: 'JMB 5/18/2022 16:41:14'!
cantidadDeOrugas
	^ cantidadDeOrugas! !

!Habitat methodsFor: 'alimentos de las avispas' stamp: 'JMB 5/18/2022 11:07:25'!
cantidadDePolillas
	^ cantidadDePolillas! !

!Habitat methodsFor: 'alimentos de las avispas' stamp: 'JMB 5/18/2022 09:57:44'!
gestarCantidadDeOrugas: unaCantidadDeOrugasAGestar 
	cantidadDeOrugas := cantidadDeOrugas + unaCantidadDeOrugasAGestar ! !

!Habitat methodsFor: 'alimentos de las avispas' stamp: 'JMB 5/18/2022 11:07:45'!
gestarCantidadDePolillas: unaCantidadDePolillasAGestar 
	cantidadDePolillas := cantidadDePolillas + unaCantidadDePolillasAGestar! !

!Habitat methodsFor: 'alimentos de las avispas' stamp: 'JMB 5/18/2022 10:06:37'!
tieneOrugas
	^ cantidadDeOrugas > 0! !

!Habitat methodsFor: 'alimentos de las avispas' stamp: 'JMB 5/18/2022 11:18:20'!
tienePolillas
	^ cantidadDePolillas > 0! !

!Habitat methodsFor: 'alimentos de las avispas' stamp: 'JMB 5/18/2022 09:59:06'!
tomarUnaOruga
	cantidadDeOrugas := cantidadDeOrugas - 1! !

!Habitat methodsFor: 'alimentos de las avispas' stamp: 'JMB 5/18/2022 11:09:15'!
tomarUnaPolilla
	cantidadDePolillas := cantidadDePolillas - 1! !


!Habitat methodsFor: 'ciclo' stamp: 'JMB 5/20/2022 21:05:13'!
avanzarUnAño
	avispas := self gestarNuevaGeneracionDeAvispas.
	self consumirHuevosDeAvispas.! !


!Habitat methodsFor: 'ciclo - privados' stamp: 'JMB 5/20/2022 21:05:13'!
consumirHuevosDeAvispas

	^ cantidadDeHuevosDeAvispasYSuAlimentoPorLineaGenetica := Dictionary new! !

!Habitat methodsFor: 'ciclo - privados' stamp: 'JMB 5/20/2022 21:07:29'!
gestarNuevaGeneracionDeAvispas
	"
	| avispasNuevas |
	avispasNuevas := OrderedCollection new.
 	self firmasGeneticaConHuevos do: [ : unaFirmaGenetica | 		avispasNuevas addAll: (self gestarNuevaGeneracionDeAvispasPara: unaFirmaGenetica)].
	^ avispasNuevas
	"
	^ self firmasGeneticaConHuevos inject: OrderedCollection new addingAll: [ :  unaFirmaGenetica | 
		self gestarNuevaGeneracionDeAvispasPara: unaFirmaGenetica].! !

!Habitat methodsFor: 'ciclo - privados' stamp: 'JMB 5/20/2022 21:17:23'!
gestarNuevaGeneracionDeAvispasPara: unaFirmaGenetica
	| cantidadDeAvispasAGestar |
	cantidadDeAvispasAGestar := 		self cantidadDeHuevosConLaFirmaGenetica: unaFirmaGenetica.
	^ (1 to: cantidadDeAvispasAGestar) collect: [ :each | Avispa con: unaFirmaGenetica enHabitat: self.].
	! !


!Habitat methodsFor: 'privados' stamp: 'JMB 5/20/2022 20:40:46'!
cantidadDeHuevosConLasFirmasGeneticas: unasFirmasGeneticas

	^ unasFirmasGeneticas sum: [ : unaFirmaGenetica | self cantidadDeHuevosConLaFirmaGenetica: unaFirmaGenetica ] ifEmpty: [ 0 ]! !

!Habitat methodsFor: 'privados' stamp: 'JMB 5/18/2022 16:38:08'!
contabilizar: unaCantidadDeHuevos a: unaFirmaGenetica
	cantidadDeHuevosDeAvispasYSuAlimentoPorLineaGenetica at: unaFirmaGenetica put: unaCantidadDeHuevos! !

!Habitat methodsFor: 'privados' stamp: 'JMB 5/20/2022 20:47:27'!
firmaGeneticaARobarQueNoSea: firmasGeneticasExcluidas
	^ (self firmasGeneticaConHuevos difference: firmasGeneticasExcluidas) first! !

!Habitat methodsFor: 'privados' stamp: 'JMB 5/20/2022 21:03:25'!
firmasGeneticaConHuevos
	
	^ cantidadDeHuevosDeAvispasYSuAlimentoPorLineaGenetica keys select: [: cadaFirmaGenetica | (self cantidadDeHuevosConLaFirmaGenetica: cadaFirmaGenetica) > 0]! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Habitat class' category: 'AlgoIII-2022-1C-1Parcial-AvispasYAbejas-P3'!
Habitat class
	instanceVariableNames: ''!

!Habitat class methodsFor: 'instance creation' stamp: 'JMB 5/20/2022 20:02:45'!
conAvispasComeOrugas: unaCantidadDeAvispasComeOrugas
	^ self conAvispasComeOrugas: unaCantidadDeAvispasComeOrugas comePolillas: 0 ladronas: 0! !

!Habitat class methodsFor: 'instance creation' stamp: 'JMB 5/20/2022 21:11:28'!
conAvispasComeOrugas: unaCantidadDeAvispasComeOrugas comePolillas: unaCantidadDeAvispasComePolillas 
	^ self conAvispasComeOrugas: unaCantidadDeAvispasComeOrugas comePolillas: unaCantidadDeAvispasComePolillas ladronas: 0! !

!Habitat class methodsFor: 'instance creation' stamp: 'JMB 5/20/2022 00:46:38'!
conAvispasComeOrugas: unaCantidadDeAvispasComeOrugas comePolillas: unaCantidadDeAvispasComePolillas ladronas: unaCantidadDeAvispasLadronas 
	| unasAvispas habitat |
	habitat := self new.
	unasAvispas := (self gestarEn: habitat avispas: unaCantidadDeAvispasComeOrugas deTipo: AvispaComeOrugas) asOrderedCollection.
	unasAvispas addAll: (self gestarEn: habitat avispas: unaCantidadDeAvispasComePolillas deTipo: AvispaComePolillas).
	unasAvispas addAll: (self gestarEn: habitat avispas: unaCantidadDeAvispasLadronas deTipo: AvispaLadrona).
	^habitat initializeConAvispas: unasAvispas ! !

!Habitat class methodsFor: 'instance creation' stamp: 'JMB 5/20/2022 20:03:19'!
conAvispasComeOrugas: unaCantidadDeAvispasComeOrugas ladronas: unaCantidadDeAvispasLadronas 
	^ self conAvispasComeOrugas: unaCantidadDeAvispasComeOrugas comePolillas: 0 ladronas: unaCantidadDeAvispasLadronas ! !

!Habitat class methodsFor: 'instance creation' stamp: 'JMB 5/20/2022 20:03:34'!
conAvispasComePolillas: unaCantidadDeAvispasComePolillas
	^ self conAvispasComeOrugas: 0 comePolillas: unaCantidadDeAvispasComePolillas ladronas: 0! !


!Habitat class methodsFor: 'privado' stamp: 'JMB 5/20/2022 00:44:41'!
gestarEn: unHabitat avispas: unaCantidadDeAvispas deTipo: unTipoDeAvispa
	^ (1 to: unaCantidadDeAvispas) collect: [ : each | unTipoDeAvispa enHabitat: unHabitat ]
	! !
