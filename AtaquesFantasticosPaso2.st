!classDefinition: #Bando category: 'AtaquesFantasticosPaso2'!
DenotativeObject subclass: #Bando
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AtaquesFantasticosPaso2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Bando class' category: 'AtaquesFantasticosPaso2'!
Bando class
	instanceVariableNames: 'ganoEsteBando combatientes rondaDefinitoria'!

!Bando class methodsFor: 'ataque' stamp: 'MJDS 9/19/2022 18:47:40'!
atacarAEnemigos
	combatientes do: [:combatiente | combatiente atacar].! !


!Bando class methodsFor: 'combate' stamp: 'MJDS 9/19/2022 18:48:35'!
combatientesActivos
	^ combatientes select: [:enemigo | enemigo puntosDeVida > 0].! !

!Bando class methodsFor: 'combate' stamp: 'MJDS 9/19/2022 18:49:24'!
establecerCombatientesDelMismo: combatientesDelMismoBando
	combatientes := combatientesDelMismoBando.! !

!Bando class methodsFor: 'combate' stamp: 'MJDS 9/19/2022 18:51:15'!
establecerEnemigos: bandoEnemigo
	combatientes do: [:combatiente | combatiente enemigos: (bandoEnemigo combatientesActivos).].! !

!Bando class methodsFor: 'combate' stamp: 'MJDS 9/19/2022 18:55:06'!
tieneCombatientesActivos
	^ (self combatientesActivos size) > 0.! !


!Bando class methodsFor: 'resultado' stamp: 'MJDS 9/19/2022 18:50:52'!
establecerComoGanador
	ganoEsteBando := true.! !

!Bando class methodsFor: 'resultado' stamp: 'MJDS 9/19/2022 18:53:42'!
hayRondaDefinitoria
	^ rondaDefinitoria == 0. ! !

!Bando class methodsFor: 'resultado' stamp: 'MJDS 9/19/2022 18:54:31'!
rondaDefinitoria: numeroDeRonda
	rondaDefinitoria := numeroDeRonda.! !


!Bando class methodsFor: '--** private fileout/in **--' stamp: 'MJDS 9/19/2022 20:49:21'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	ganoEsteBando := nil.
	combatientes := nil.
	rondaDefinitoria := nil.! !


!classDefinition: #BandoDos category: 'AtaquesFantasticosPaso2'!
Bando subclass: #BandoDos
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AtaquesFantasticosPaso2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'BandoDos class' category: 'AtaquesFantasticosPaso2'!
BandoDos class
	instanceVariableNames: ''!

!BandoDos class methodsFor: 'resultado combate' stamp: 'MJDS 9/18/2022 13:30:37'!
ganoBando2EnLaRonda: unNumeroDeRondaEsperado
	^ganoEsteBando & (unNumeroDeRondaEsperado == rondaDefinitoria ).! !


!BandoDos class methodsFor: '--** private fileout/in **--' stamp: 'MJDS 9/19/2022 20:49:21'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	ganoEsteBando := true.
	combatientes := ((Array new: 2) at: 1 put: CombatienteOrcoOlgra; at: 2 put: CombatienteOrcoMankrik; yourself).
	rondaDefinitoria := 4.! !


!classDefinition: #BandoUno category: 'AtaquesFantasticosPaso2'!
Bando subclass: #BandoUno
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AtaquesFantasticosPaso2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'BandoUno class' category: 'AtaquesFantasticosPaso2'!
BandoUno class
	instanceVariableNames: ''!

!BandoUno class methodsFor: 'resultado combate' stamp: 'MJDS 9/18/2022 13:29:35'!
ganoBando1EnLaRonda: unNumeroDeRondaEsperado
	^ganoEsteBando & (unNumeroDeRondaEsperado == rondaDefinitoria ).! !


!BandoUno class methodsFor: '--** private fileout/in **--' stamp: 'MJDS 9/19/2022 20:49:21'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	ganoEsteBando := true.
	combatientes := ((Array new: 1) at: 1 put: CombatienteHumanoArthas; yourself).
	rondaDefinitoria := 4.! !


!classDefinition: #Combatiente category: 'AtaquesFantasticosPaso2'!
DenotativeObject subclass: #Combatiente
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AtaquesFantasticosPaso2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Combatiente class' category: 'AtaquesFantasticosPaso2'!
Combatiente class
	instanceVariableNames: 'proteccionPorAgilidad enemigos puntosDeVida dañoAInfligir dañoAAbsorber estrategia estadoDeCombate dañoPorFuerza estadoDeVida'!

!Combatiente class methodsFor: 'equipo' stamp: 'MJDS 9/19/2022 19:40:42'!
usarArmaduraDeCuero
	dañoAAbsorber := 2*pv.! !

!Combatiente class methodsFor: 'equipo' stamp: 'MJDS 9/19/2022 19:40:58'!
usarArmaduraDeMetal
	dañoAAbsorber := 6*pv.! !

!Combatiente class methodsFor: 'equipo' stamp: 'MJDS 9/19/2022 19:41:13'!
usarEspada
	dañoAInfligir := 8*pv.! !

!Combatiente class methodsFor: 'equipo' stamp: 'MJDS 9/19/2022 19:41:40'!
usarHacha
	dañoAInfligir := 10*pv.! !


!Combatiente class methodsFor: 'combate' stamp: 'MJDS 9/19/2022 20:16:52'!
actualizarEstadoDeCombate	
	(puntosDeVida <= 0) ifTrue: [
		dañoAInfligir := 0 * pv.
		dañoPorFuerza := 0 * pv.
		].! !

!Combatiente class methodsFor: 'combate' stamp: 'MJDS 9/19/2022 19:36:12'!
atacar
	| enemigoElegido |
	enemigos isEmpty ifTrue: [^self].
	enemigoElegido := estrategia value: enemigos.
	enemigoElegido isNil ifTrue: [^self].
	self atacarA: enemigoElegido.! !

!Combatiente class methodsFor: 'combate' stamp: 'MJDS 9/19/2022 20:05:36'!
atacarA: unCombatiente 
	unCombatiente recibirDaño: dañoAInfligir + (dañoPorFuerza).! !

!Combatiente class methodsFor: 'combate' stamp: 'MJDS 9/19/2022 19:36:46'!
enemigos: unConjuntoDeEnemigos
	enemigos := unConjuntoDeEnemigos! !

!Combatiente class methodsFor: 'combate' stamp: 'MJDS 9/19/2022 19:37:03'!
estaHerido
	^(puntosDeVida < (20*pv))! !

!Combatiente class methodsFor: 'combate' stamp: 'MJDS 9/19/2022 19:38:03'!
focalizarEnElMasHerido
	| enemigosAunEnCombate |
	estrategia := [:posiblesEnemigosAAtacar |
		enemigosAunEnCombate := posiblesEnemigosAAtacar select: [:enemigo | enemigo puntosDeVida > 0.].
		enemigosAunEnCombate detectMin: [:enemigo | enemigo puntosDeVida].
		].! !

!Combatiente class methodsFor: 'combate' stamp: 'MJDS 9/19/2022 19:38:35'!
focalizarEnElMasSano
	estrategia := [:posiblesEnemigosAAtacar | posiblesEnemigosAAtacar detectMax: [:enemigo | enemigo puntosDeVida]].! !

!Combatiente class methodsFor: 'combate' stamp: 'MJDS 9/19/2022 19:38:57'!
noEstaHerido
	^(puntosDeVida = (20*pv))! !

!Combatiente class methodsFor: 'combate' stamp: 'MJDS 9/19/2022 19:39:33'!
puntosDeVida
	^puntosDeVida! !

!Combatiente class methodsFor: 'combate' stamp: 'MJDS 9/19/2022 20:48:46'!
recibirDaño:  unaCantidadDeDaño
    | dañoADescontar puntosDeDañoTotales|
    dañoADescontar := (unaCantidadDeDaño - (dañoAAbsorber )) max: 0*pv.
    puntosDeDañoTotales := estadoDeVida calcularPuntosADescontarCon: dañoADescontar.
    puntosDeVida := puntosDeVida + (proteccionPorAgilidad) - (puntosDeDañoTotales). 
    estadoDeVida := estadoDeVida actualizarEstado: puntosDeVida.
    
    self actualizarEstadoDeCombate.! !

!Combatiente class methodsFor: 'combate' stamp: 'MJDS 9/19/2022 19:40:21'!
tienePuntosDeVida: puntosDeVidas
	^(puntosDeVida = puntosDeVidas)! !


!Combatiente class methodsFor: '--** private fileout/in **--' stamp: 'MJDS 9/19/2022 20:49:21'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	proteccionPorAgilidad := nil.
	enemigos := nil.
	puntosDeVida := nil.
	dañoAInfligir := nil.
	dañoAAbsorber := nil.
	estrategia := nil.
	estadoDeCombate := nil.
	dañoPorFuerza := nil.
	estadoDeVida := nil.! !


!classDefinition: #CombatienteHumano category: 'AtaquesFantasticosPaso2'!
Combatiente subclass: #CombatienteHumano
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AtaquesFantasticosPaso2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CombatienteHumano class' category: 'AtaquesFantasticosPaso2'!
CombatienteHumano class
	instanceVariableNames: ''!

!CombatienteHumano class methodsFor: 'combate' stamp: 'MJDS 9/19/2022 19:46:42'!
prepararseParaElCombate
	puntosDeVida := 20*pv.
	dañoAInfligir := 2*pv.
	dañoAAbsorber := 0*pv.
	enemigos := #().
	estrategia := [:posiblesEnemigosAAtacar | posiblesEnemigosAAtacar anyOne ].
	proteccionPorAgilidad := 1 * pv.! !



!CombatienteHumano class methodsFor: '--** private fileout/in **--' stamp: 'MJDS 9/19/2022 20:49:22'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	proteccionPorAgilidad := (SimpleMeasure basicNew instVarAt: 1 put: 1; instVarAt: 2 put: (BaseUnit basicNew instVarAt: 1 put: 'puntosDeVida'; instVarAt: 2 put: 'puntosDeVidas'; instVarAt: 3 put: 'pv'; yourself); yourself).
	enemigos := ((Array new: 2) at: 1 put: CombatienteOrcoOlgra; at: 2 put: CombatienteOrcoMankrik; yourself).
	puntosDeVida := (SimpleMeasure basicNew instVarAt: 1 put: 7; instVarAt: 2 put: (BaseUnit basicNew instVarAt: 1 put: 'puntosDeVida'; instVarAt: 2 put: 'puntosDeVidas'; instVarAt: 3 put: 'pv'; yourself); yourself).
	dañoAInfligir := (SimpleMeasure basicNew instVarAt: 1 put: 10; instVarAt: 2 put: (BaseUnit basicNew instVarAt: 1 put: 'puntosDeVida'; instVarAt: 2 put: 'puntosDeVidas'; instVarAt: 3 put: 'pv'; yourself); yourself).
	dañoAAbsorber := (SimpleMeasure basicNew instVarAt: 1 put: 0; instVarAt: 2 put: (BaseUnit basicNew instVarAt: 1 put: 'puntosDeVida'; instVarAt: 2 put: 'puntosDeVidas'; instVarAt: 3 put: 'pv'; yourself); yourself).
	estrategia := ((SerializableBlockClosure basicNew instVarAt: 1 put: CombatienteHumano; instVarAt: 2 put: '[ :argm0_1 |
	argm0_1 detectMax: [ :argm0_2 |
		argm0_2 puntosDeVida ]. ]'; instVarAt: 3 put: #(); yourself) asEvaluable).
	estadoDeCombate := nil.
	dañoPorFuerza := nil.
	estadoDeVida := nil.! !


!classDefinition: #CombatienteHumanoArthas category: 'AtaquesFantasticosPaso2'!
CombatienteHumano subclass: #CombatienteHumanoArthas
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AtaquesFantasticosPaso2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CombatienteHumanoArthas class' category: 'AtaquesFantasticosPaso2'!
CombatienteHumanoArthas class
	instanceVariableNames: ''!

!CombatienteHumanoArthas class methodsFor: 'combate' stamp: 'MJDS 9/19/2022 20:13:39'!
prepararseParaElCombate
	puntosDeVida := 20*pv.
	dañoAInfligir := 2*pv.
	dañoAAbsorber := 0*pv.
	enemigos := #().
	estrategia := [:posiblesEnemigosAAtacar | posiblesEnemigosAAtacar anyOne ].
	proteccionPorAgilidad := 1 * pv.
	dañoPorFuerza := 0 * pv.
	estadoDeVida := EstadoNoHerido.
	estadoDeVida establecerNoDistraido.! !


!CombatienteHumanoArthas class methodsFor: '--** private fileout/in **--' stamp: 'MJDS 9/19/2022 20:49:22'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	proteccionPorAgilidad := (SimpleMeasure basicNew instVarAt: 1 put: 1; instVarAt: 2 put: (BaseUnit basicNew instVarAt: 1 put: 'puntosDeVida'; instVarAt: 2 put: 'puntosDeVidas'; instVarAt: 3 put: 'pv'; yourself); yourself).
	enemigos := ((Array new: 2) at: 1 put: CombatienteOrcoOlgra; at: 2 put: CombatienteOrcoMankrik; yourself).
	puntosDeVida := (SimpleMeasure basicNew instVarAt: 1 put: 8; instVarAt: 2 put: (BaseUnit basicNew instVarAt: 1 put: 'puntosDeVida'; instVarAt: 2 put: 'puntosDeVidas'; instVarAt: 3 put: 'pv'; yourself); yourself).
	dañoAInfligir := (SimpleMeasure basicNew instVarAt: 1 put: 10; instVarAt: 2 put: (BaseUnit basicNew instVarAt: 1 put: 'puntosDeVida'; instVarAt: 2 put: 'puntosDeVidas'; instVarAt: 3 put: 'pv'; yourself); yourself).
	dañoAAbsorber := (SimpleMeasure basicNew instVarAt: 1 put: 0; instVarAt: 2 put: (BaseUnit basicNew instVarAt: 1 put: 'puntosDeVida'; instVarAt: 2 put: 'puntosDeVidas'; instVarAt: 3 put: 'pv'; yourself); yourself).
	estrategia := ((SerializableBlockClosure basicNew instVarAt: 1 put: CombatienteHumanoArthas; instVarAt: 2 put: '[ :argm0_1 |
	argm0_1 detectMax: [ :argm0_2 |
		argm0_2 puntosDeVida ]. ]'; instVarAt: 3 put: #(); yourself) asEvaluable).
	estadoDeCombate := nil.
	dañoPorFuerza := (SimpleMeasure basicNew instVarAt: 1 put: 0; instVarAt: 2 put: (BaseUnit basicNew instVarAt: 1 put: 'puntosDeVida'; instVarAt: 2 put: 'puntosDeVidas'; instVarAt: 3 put: 'pv'; yourself); yourself).
	estadoDeVida := EstadoHerido.! !


!classDefinition: #CombatienteOrco category: 'AtaquesFantasticosPaso2'!
Combatiente subclass: #CombatienteOrco
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AtaquesFantasticosPaso2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CombatienteOrco class' category: 'AtaquesFantasticosPaso2'!
CombatienteOrco class
	instanceVariableNames: ''!

!CombatienteOrco class methodsFor: '--** private fileout/in **--' stamp: 'MJDS 9/19/2022 20:49:22'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	proteccionPorAgilidad := nil.
	enemigos := nil.
	puntosDeVida := nil.
	dañoAInfligir := nil.
	dañoAAbsorber := nil.
	estrategia := nil.
	estadoDeCombate := nil.
	dañoPorFuerza := nil.
	estadoDeVida := nil.! !


!classDefinition: #CombatienteOrcoMankrik category: 'AtaquesFantasticosPaso2'!
CombatienteOrco subclass: #CombatienteOrcoMankrik
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AtaquesFantasticosPaso2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CombatienteOrcoMankrik class' category: 'AtaquesFantasticosPaso2'!
CombatienteOrcoMankrik class
	instanceVariableNames: ''!

!CombatienteOrcoMankrik class methodsFor: 'combate' stamp: 'MJDS 9/19/2022 20:03:26'!
prepararseParaElCombate
	puntosDeVida := 20*pv.
	dañoAInfligir := 2*pv.
	dañoAAbsorber := 0*pv.
	enemigos := #().
	estrategia := [:posiblesEnemigosAAtacar | posiblesEnemigosAAtacar anyOne ].
	dañoPorFuerza := 2 * pv.
	proteccionPorAgilidad := 0 * pv.
	estadoDeVida := EstadoNoHerido.
	estadoDeVida establecerNoDistraido.! !


!CombatienteOrcoMankrik class methodsFor: '--** private fileout/in **--' stamp: 'MJDS 9/19/2022 20:49:22'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	proteccionPorAgilidad := (SimpleMeasure basicNew instVarAt: 1 put: 0; instVarAt: 2 put: (BaseUnit basicNew instVarAt: 1 put: 'puntosDeVida'; instVarAt: 2 put: 'puntosDeVidas'; instVarAt: 3 put: 'pv'; yourself); yourself).
	enemigos := ((Array new: 1) at: 1 put: CombatienteHumanoArthas; yourself).
	puntosDeVida := (SimpleMeasure basicNew instVarAt: 1 put: 0; instVarAt: 2 put: (BaseUnit basicNew instVarAt: 1 put: 'puntosDeVida'; instVarAt: 2 put: 'puntosDeVidas'; instVarAt: 3 put: 'pv'; yourself); yourself).
	dañoAInfligir := (SimpleMeasure basicNew instVarAt: 1 put: 0; instVarAt: 2 put: (BaseUnit basicNew instVarAt: 1 put: 'puntosDeVida'; instVarAt: 2 put: 'puntosDeVidas'; instVarAt: 3 put: 'pv'; yourself); yourself).
	dañoAAbsorber := (SimpleMeasure basicNew instVarAt: 1 put: 0; instVarAt: 2 put: (BaseUnit basicNew instVarAt: 1 put: 'puntosDeVida'; instVarAt: 2 put: 'puntosDeVidas'; instVarAt: 3 put: 'pv'; yourself); yourself).
	estrategia := ((SerializableBlockClosure basicNew instVarAt: 1 put: CombatienteOrcoMankrik; instVarAt: 2 put: '[ :argm4_1 |
	argm4_1 anyOne. ]'; instVarAt: 3 put: #(); yourself) asEvaluable).
	estadoDeCombate := nil.
	dañoPorFuerza := (SimpleMeasure basicNew instVarAt: 1 put: 0; instVarAt: 2 put: (BaseUnit basicNew instVarAt: 1 put: 'puntosDeVida'; instVarAt: 2 put: 'puntosDeVidas'; instVarAt: 3 put: 'pv'; yourself); yourself).
	estadoDeVida := EstadoFueraDeCombate.! !


!classDefinition: #CombatienteOrcoOlgra category: 'AtaquesFantasticosPaso2'!
CombatienteOrco subclass: #CombatienteOrcoOlgra
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AtaquesFantasticosPaso2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CombatienteOrcoOlgra class' category: 'AtaquesFantasticosPaso2'!
CombatienteOrcoOlgra class
	instanceVariableNames: ''!

!CombatienteOrcoOlgra class methodsFor: 'combate' stamp: 'MJDS 9/19/2022 20:03:19'!
prepararseParaElCombate
	puntosDeVida := 20*pv.
	dañoAInfligir := 2*pv.
	dañoAAbsorber := 0*pv.
	enemigos := #().
	estrategia := [:posiblesEnemigosAAtacar | posiblesEnemigosAAtacar anyOne ].
	dañoPorFuerza := 1 * pv.
	proteccionPorAgilidad := 0 * pv.
	estadoDeVida := EstadoNoHerido.
	estadoDeVida establecerNoDistraido.! !


!CombatienteOrcoOlgra class methodsFor: '--** private fileout/in **--' stamp: 'MJDS 9/19/2022 20:49:22'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	proteccionPorAgilidad := (SimpleMeasure basicNew instVarAt: 1 put: 0; instVarAt: 2 put: (BaseUnit basicNew instVarAt: 1 put: 'puntosDeVida'; instVarAt: 2 put: 'puntosDeVidas'; instVarAt: 3 put: 'pv'; yourself); yourself).
	enemigos := ((Array new: 1) at: 1 put: CombatienteHumanoArthas; yourself).
	puntosDeVida := (SimpleMeasure basicNew instVarAt: 1 put: 0; instVarAt: 2 put: (BaseUnit basicNew instVarAt: 1 put: 'puntosDeVida'; instVarAt: 2 put: 'puntosDeVidas'; instVarAt: 3 put: 'pv'; yourself); yourself).
	dañoAInfligir := (SimpleMeasure basicNew instVarAt: 1 put: 0; instVarAt: 2 put: (BaseUnit basicNew instVarAt: 1 put: 'puntosDeVida'; instVarAt: 2 put: 'puntosDeVidas'; instVarAt: 3 put: 'pv'; yourself); yourself).
	dañoAAbsorber := (SimpleMeasure basicNew instVarAt: 1 put: 0; instVarAt: 2 put: (BaseUnit basicNew instVarAt: 1 put: 'puntosDeVida'; instVarAt: 2 put: 'puntosDeVidas'; instVarAt: 3 put: 'pv'; yourself); yourself).
	estrategia := ((SerializableBlockClosure basicNew instVarAt: 1 put: CombatienteOrcoOlgra; instVarAt: 2 put: '[ :argm4_1 |
	argm4_1 anyOne. ]'; instVarAt: 3 put: #(); yourself) asEvaluable).
	estadoDeCombate := nil.
	dañoPorFuerza := (SimpleMeasure basicNew instVarAt: 1 put: 0; instVarAt: 2 put: (BaseUnit basicNew instVarAt: 1 put: 'puntosDeVida'; instVarAt: 2 put: 'puntosDeVidas'; instVarAt: 3 put: 'pv'; yourself); yourself).
	estadoDeVida := EstadoFueraDeCombate.! !


!classDefinition: #CombatientesTest category: 'AtaquesFantasticosPaso2'!
DenotativeObject subclass: #CombatientesTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AtaquesFantasticosPaso2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CombatientesTest class' category: 'AtaquesFantasticosPaso2'!
CombatientesTest class
	instanceVariableNames: ''!

!CombatientesTest class methodsFor: '--** private fileout/in **--' stamp: 'JMB 9/14/2022 00:19:03'!
initialize

	"Este método está para crear unidades. No se debe tocar"

	| puntosDeVida |
	puntosDeVida := BaseUnit named: 'puntosDeVida' sign: 'pv'.

	Smalltalk at: #pv put: puntosDeVida.
	Smalltalk at: #puntosDeVida put: puntosDeVida.! !


!CombatientesTest class methodsFor: 'preparacion de combates' stamp: 'MJDS 9/19/2022 19:28:03'!
combatienteHumanoArthas
	^CombatienteHumanoArthas! !

!CombatientesTest class methodsFor: 'preparacion de combates' stamp: 'pal 8/25/2022 00:54:34'!
combatienteOrcoMankrik
	^CombatienteOrcoMankrik ! !

!CombatientesTest class methodsFor: 'preparacion de combates' stamp: 'pal 8/25/2022 00:54:12'!
combatienteOrcoOlgra
	^CombatienteOrcoOlgra ! !

!CombatientesTest class methodsFor: 'preparacion de combates' stamp: 'MJDS 9/19/2022 19:29:01'!
comenzarUnNuevoCombate
	CombatienteHumanoArthas prepararseParaElCombate .
	CombatienteOrcoOlgra prepararseParaElCombate .
	CombatienteOrcoMankrik prepararseParaElCombate .! !


!CombatientesTest class methodsFor: 'tests - combatientes' stamp: 'JMB 9/14/2022 00:20:06'!
test01CuandoArthasAtacaAOlgraLeHaceDaño
	
	self comenzarUnNuevoCombate.
	self combatienteHumanoArthas atacarA: self combatienteOrcoOlgra.
	
	Assert isTrue: (self combatienteOrcoOlgra tienePuntosDeVida: 18*pv) description: 'Olgra debe tener 18 puntos de vida'.! !

!CombatientesTest class methodsFor: 'tests - combatientes' stamp: 'JMB 9/14/2022 00:20:11'!
test02CuandoArthasAtacaMasDeUnaVezAOlgraLeHaceDañoEnCadaAtaque

	self comenzarUnNuevoCombate .
	self combatienteHumanoArthas atacarA: self combatienteOrcoOlgra.
	
	self combatienteHumanoArthas atacarA: self combatienteOrcoOlgra.
	
	Assert isTrue: (self combatienteOrcoOlgra tienePuntosDeVida: 16*pv) description: 'Olgra debe tener 16 puntos de vida'.! !

!CombatientesTest class methodsFor: 'tests - combatientes' stamp: 'JMB 9/14/2022 00:20:17'!
test03CuandoArthasAtacaConUnHachaHace10DeDaño

	self comenzarUnNuevoCombate .
	self combatienteHumanoArthas usarHacha.
	
	self combatienteHumanoArthas atacarA: self combatienteOrcoOlgra.
	
	Assert isTrue: (self combatienteOrcoOlgra tienePuntosDeVida: 10*pv) description: 'Olgra debe tener 10 puntos de vida'.! !

!CombatientesTest class methodsFor: 'tests - combatientes' stamp: 'JMB 9/14/2022 00:20:21'!
test04CuandoArthasAtacaConUnaEspadaHace8DeDaño

	self comenzarUnNuevoCombate .
	self combatienteHumanoArthas usarEspada.
	
	self combatienteHumanoArthas atacarA: self combatienteOrcoOlgra.
	
	Assert isTrue: (self combatienteOrcoOlgra tienePuntosDeVida: 12*pv) description: 'Olgra debe tener 12 puntos de vida'.! !

!CombatientesTest class methodsFor: 'tests - combatientes' stamp: 'JMB 9/14/2022 00:20:27'!
test05CuandoOlgraUsaUnaArmaduraDeCueroResuceLosAtaquesCon2DeDaño

	self comenzarUnNuevoCombate .
	self combatienteHumanoArthas usarEspada.
	self combatienteOrcoOlgra usarArmaduraDeCuero.
	
	self combatienteHumanoArthas atacarA: self combatienteOrcoOlgra.
	
	Assert isTrue: (self combatienteOrcoOlgra tienePuntosDeVida: 14*pv) description: 'Olgra debe tener 14 puntos de vida'.! !

!CombatientesTest class methodsFor: 'tests - combatientes' stamp: 'JMB 9/14/2022 00:20:33'!
test06CuandoOlgraUsaUnaArmaduraDeMetalResuceLosAtaquesCon6DeDaño

	self comenzarUnNuevoCombate .
	self combatienteHumanoArthas usarEspada.
	self combatienteOrcoOlgra usarArmaduraDeMetal.
	
	self combatienteHumanoArthas atacarA: self combatienteOrcoOlgra.
	
	Assert isTrue: (self combatienteOrcoOlgra tienePuntosDeVida: 18*pv) description: 'Olgra debe tener 18 puntos de vida'.! !

!CombatientesTest class methodsFor: 'tests - combatientes' stamp: 'JMB 9/10/2022 16:45:40'!
test07CuandoOlgraUsaUnaArmaduraResuceElDañoPeroNoRecuperaPuntosDeVida

	self comenzarUnNuevoCombate .
	self combatienteOrcoOlgra usarArmaduraDeMetal.
	
	self combatienteHumanoArthas atacarA: self combatienteOrcoOlgra.
	
	Assert isTrue: self combatienteOrcoOlgra noEstaHerido description: 'Olgra debe tener los puntos de vida completos'.! !


!CombatientesTest class methodsFor: 'tests - atacar' stamp: 'JMB 9/10/2022 16:55:02'!
test08CuandoArthasNoTieneEnemigosNoAtacaANadie
	self comenzarUnNuevoCombate .
	
	self combatienteHumanoArthas atacar.
	
	Assert isTrue: self combatienteOrcoOlgra noEstaHerido description: 'Olgra debe tener los puntos de vida completos'.
	Assert isTrue: self combatienteOrcoMankrik noEstaHerido description: 'Mankrik debe tener los puntos de vida completos'.
	
	! !

!CombatientesTest class methodsFor: 'tests - atacar' stamp: 'JMB 9/10/2022 15:24:46'!
test09CuandoArthasTieneEnemigosAtacaAUno
	| soloOlgraEstaHerido soloMankrikEstaHerido |
	self comenzarUnNuevoCombate .
	self combatienteHumanoArthas enemigos: {self combatienteOrcoOlgra . self combatienteOrcoMankrik .}.
	
	self combatienteHumanoArthas atacar.
	
	soloOlgraEstaHerido := self combatienteOrcoOlgra estaHerido and: [self combatienteOrcoMankrik noEstaHerido ].
	soloMankrikEstaHerido := self combatienteOrcoMankrik estaHerido and: [self combatienteOrcoOlgra noEstaHerido ].
	Assert isTrue: (soloOlgraEstaHerido or: [soloMankrikEstaHerido]).! !

!CombatientesTest class methodsFor: 'tests - atacar' stamp: 'JMB 9/14/2022 00:20:44'!
test10CuandoArthasTieneComoEstrategiaAtacarAlMasHeridoDañaAlQueEstaMasHerido
	
	self comenzarUnNuevoCombate .
	self combatienteHumanoArthas enemigos: {self combatienteOrcoOlgra . self combatienteOrcoMankrik .}.
	self combatienteHumanoArthas atacarA: self combatienteOrcoOlgra .	
	self combatienteHumanoArthas focalizarEnElMasHerido.
	
	self combatienteHumanoArthas atacar.
	
	Assert isTrue: (self combatienteOrcoOlgra tienePuntosDeVida: 16*pv) description: 'Olgra debe tener 16 puntos de vida'.
	! !

!CombatientesTest class methodsFor: 'tests - atacar' stamp: 'JMB 9/14/2022 00:20:51'!
test11CuandoArthasTieneComoEstrategiaAtacarAlMasSanoDañaAlQueEstaMenosHerido
	
	self comenzarUnNuevoCombate.
	self combatienteHumanoArthas usarEspada.
	self combatienteHumanoArthas enemigos: {self combatienteOrcoOlgra . self combatienteOrcoMankrik .}.
	self combatienteHumanoArthas atacarA: self combatienteOrcoMankrik.	
	self combatienteHumanoArthas focalizarEnElMasSano.
	
	self combatienteHumanoArthas atacar.
	
	Assert isTrue: (self combatienteOrcoOlgra tienePuntosDeVida: 12*pv) description: 'Olgra debe tener 12 puntos de vida'.
	! !


!CombatientesTest class methodsFor: 'tests - fuerza y agilidad' stamp: 'JMB 9/14/2022 00:38:50'!
test12CuandoOlgraAtacaConSusPuñosAMankrikLeHace2DeDañoMas1PorFuerza
	
	self comenzarUnNuevoCombate.
	
	self combatienteOrcoOlgra atacarA: self combatienteOrcoMankrik.
	
	Assert isTrue: (self combatienteOrcoMankrik tienePuntosDeVida: 17*pv) description: 'Mankrik debe tener 17 puntos de vida (20 inicial - 2 por puños - 1 por fuerza)'.! !

!CombatientesTest class methodsFor: 'tests - fuerza y agilidad' stamp: 'JMB 9/14/2022 00:38:32'!
test13CuandoMankrikAtacaConSusPuñosAOlgraLeHace2DeDañoMas2PorFuerza
	
	self comenzarUnNuevoCombate.
	
	self combatienteOrcoMankrik atacarA: self combatienteOrcoOlgra.
	
	Assert isTrue: (self combatienteOrcoOlgra tienePuntosDeVida: 16*pv) description: 'Olgra debe tener 16 puntos de vida (20 inicial - 2 por puños - 2 por fuerza)'.! !

!CombatientesTest class methodsFor: 'tests - fuerza y agilidad' stamp: 'JMB 9/14/2022 00:39:42'!
test14CuandoMankrikAtacaAArthasLeHaceDañoReducidoEn1PorSuAgilidad
	
	self comenzarUnNuevoCombate.
	
	self combatienteOrcoMankrik atacarA: self combatienteHumanoArthas.

	Assert 
		isTrue: (self combatienteHumanoArthas tienePuntosDeVida: 17*pv) 
		description: 'Arthas debe tener 17 puntos de vida (20 inicial - 2 por puños - 2 por fuerza + 1 agilidad de Arthas)'.! !

!CombatientesTest class methodsFor: 'tests - fuerza y agilidad' stamp: 'JMB 9/14/2022 00:21:12'!
test15CuandoOlgraAtacaConUnHachaHace10DeDañoMas1PorFuerza

	self comenzarUnNuevoCombate .
	self combatienteOrcoOlgra usarHacha.
	
	self combatienteOrcoOlgra atacarA: self combatienteOrcoMankrik.
	
	Assert isTrue: (self combatienteOrcoMankrik tienePuntosDeVida: 9*pv) description: 'Olgra debe tener 9 puntos de vida'.! !

!CombatientesTest class methodsFor: 'tests - fuerza y agilidad' stamp: 'JMB 9/14/2022 00:21:17'!
test16CuandoOlgraAtacaConUnaEspadaHace8DeDañoMas1PorFuerza

	self comenzarUnNuevoCombate .
	self combatienteOrcoOlgra usarEspada.
	
	self combatienteOrcoOlgra atacarA: self combatienteOrcoMankrik.
	
	Assert isTrue: (self combatienteOrcoMankrik tienePuntosDeVida: 11*pv) description: 'Mankrik debe tener 11 puntos de vida'.
	! !

!CombatientesTest class methodsFor: 'tests - fuerza y agilidad' stamp: 'JMB 9/14/2022 00:41:17'!
test17CuandoMankrikAtacaConUnHachaHace10DeDañoMas2PorFuerza

	self comenzarUnNuevoCombate .
	self combatienteOrcoMankrik usarHacha.
	
	self combatienteOrcoMankrik atacarA: self combatienteOrcoOlgra.
	
	Assert isTrue: (self combatienteOrcoOlgra tienePuntosDeVida: 8*pv) description: 'Olgra debe tener 8 puntos de vida'.! !

!CombatientesTest class methodsFor: 'tests - fuerza y agilidad' stamp: 'JMB 9/14/2022 00:41:26'!
test18CuandoMankrikAtacaConUnaEspadaHace8DeDañoMas2PorFuerza

	self comenzarUnNuevoCombate .
	self combatienteOrcoMankrik usarEspada.
	
	self combatienteOrcoMankrik atacarA: self combatienteOrcoOlgra.
	
	Assert isTrue: (self combatienteOrcoOlgra tienePuntosDeVida: 10*pv) description: 'Olgra debe tener 10 puntos de vida'.! !

!CombatientesTest class methodsFor: 'tests - fuerza y agilidad' stamp: 'JMB 9/14/2022 00:21:35'!
test19CuandoMankrikUsaUnaArmaduraDeCueroResuceLosAtaquesCon2DeDaño

	self comenzarUnNuevoCombate .
	self combatienteOrcoOlgra usarEspada.
	self combatienteOrcoMankrik usarArmaduraDeCuero.
	
	self combatienteOrcoOlgra atacarA: self combatienteOrcoMankrik.
	
	Assert isTrue: (self combatienteOrcoMankrik tienePuntosDeVida: 13*pv) description: 'Mankrik debe tener 13 puntos de vida'.! !

!CombatientesTest class methodsFor: 'tests - fuerza y agilidad' stamp: 'JMB 9/14/2022 00:21:40'!
test20CuandoMankrikUsaUnaArmaduraDeMetalResuceLosAtaquesCon6DeDaño

	self comenzarUnNuevoCombate .
	self combatienteOrcoOlgra usarEspada.
	self combatienteOrcoMankrik usarArmaduraDeMetal.
	
	self combatienteOrcoOlgra atacarA: self combatienteOrcoMankrik.
	
	Assert isTrue: (self combatienteOrcoMankrik tienePuntosDeVida: 17*pv) description: 'Mankrik debe tener 17 puntos de vida'.! !

!CombatientesTest class methodsFor: 'tests - fuerza y agilidad' stamp: 'JMB 9/14/2022 00:21:44'!
test21CuandoArthasUsaUnaArmaduraDeCueroResuceLosAtaquesCon2DeDaño

	self comenzarUnNuevoCombate .
	self combatienteOrcoOlgra usarEspada.
	self combatienteHumanoArthas usarArmaduraDeCuero.
	
	self combatienteOrcoOlgra atacarA: self combatienteHumanoArthas.
	
	Assert isTrue: (self combatienteHumanoArthas tienePuntosDeVida: 14*pv) description: 'Arthas debe tener 14 puntos de vida'.! !

!CombatientesTest class methodsFor: 'tests - fuerza y agilidad' stamp: 'JMB 9/14/2022 00:21:49'!
test22CuandoArthasUsaUnaArmaduraDeMetalResuceLosAtaquesCon6DeDaño

	self comenzarUnNuevoCombate .
	self combatienteOrcoOlgra usarEspada.
	self combatienteHumanoArthas usarArmaduraDeMetal.
	
	self combatienteOrcoOlgra atacarA: self combatienteHumanoArthas.
	
	Assert isTrue: (self combatienteHumanoArthas tienePuntosDeVida: 18*pv) description: 'Arthas debe tener 18 puntos de vida'.! !


!CombatientesTest class methodsFor: 'tests - fuera de combate' stamp: 'JMB 9/10/2022 15:18:22'!
test23CuandoArthasEstaFueraDeCombateNoHaceDaño

	self comenzarUnNuevoCombate .
	self combatienteOrcoOlgra usarHacha.
	
	self combatienteOrcoOlgra atacarA: self combatienteHumanoArthas.
	self combatienteOrcoOlgra atacarA: self combatienteHumanoArthas.
	self combatienteOrcoOlgra atacarA: self combatienteHumanoArthas.
	
	self combatienteHumanoArthas atacarA: self combatienteOrcoOlgra.
	
	Assert isFalse: self combatienteOrcoOlgra estaHerido.! !

!CombatientesTest class methodsFor: 'tests - fuera de combate' stamp: 'JMB 9/10/2022 16:52:19'!
test24CuandoOlgraEstaFueraDeCombateNoHaceDaño

	self comenzarUnNuevoCombate .
	self combatienteHumanoArthas usarHacha.
	
	self combatienteHumanoArthas atacarA: self combatienteOrcoOlgra.
	self combatienteHumanoArthas atacarA: self combatienteOrcoOlgra.
	self combatienteHumanoArthas atacarA: self combatienteOrcoOlgra.
	
	self combatienteOrcoOlgra atacarA: self combatienteHumanoArthas.
	
	Assert isFalse: self combatienteHumanoArthas estaHerido.! !

!CombatientesTest class methodsFor: 'tests - fuera de combate' stamp: 'JMB 9/14/2022 21:30:22'!
test25CuandoMankrikEstaFueraDeCombateNoHaceDaño

	self comenzarUnNuevoCombate .
	self combatienteHumanoArthas usarHacha.
	
	self arthasConHachaDejaFueraDeCombateAMankrik.
	
	self combatienteOrcoMankrik atacarA: self combatienteHumanoArthas.
	
	Assert isFalse: self combatienteHumanoArthas estaHerido.! !

!CombatientesTest class methodsFor: 'tests - fuera de combate' stamp: 'JMB 9/14/2022 22:41:18'!
test26ArthasNoAtacaALosEnemigosFueraDeCombate

	self comenzarUnNuevoCombate .
	self combatienteHumanoArthas focalizarEnElMasHerido.	
	self arthasConHachaDejaFueraDeCombateAMankrik.
	self combatienteHumanoArthas enemigos: {self combatienteOrcoOlgra . self combatienteOrcoMankrik .}.
	
	self combatienteHumanoArthas atacar.
	
	Assert isTrue: self combatienteOrcoOlgra estaHerido.! !

!CombatientesTest class methodsFor: 'tests - fuera de combate' stamp: 'JMB 9/14/2022 22:41:41'!
test27OlgraNoAtacaALosEnemigosFueraDeCombate

	self comenzarUnNuevoCombate .
	self combatienteOrcoOlgra focalizarEnElMasHerido.
	self olgraConHachaDejaFueraDeCombateAMankrik.
	self combatienteOrcoOlgra enemigos: {self combatienteHumanoArthas. self combatienteOrcoMankrik .}.
	
	self combatienteOrcoOlgra atacar.
	
	Assert isTrue: self combatienteHumanoArthas estaHerido.! !

!CombatientesTest class methodsFor: 'tests - fuera de combate' stamp: 'JMB 9/14/2022 22:36:55'!
test28MankrikNoAtacaALosEnemigosFueraDeCombate

	self comenzarUnNuevoCombate .
	self combatienteOrcoMankrik focalizarEnElMasHerido.
	self mankrikConHachaDejaFueraDeCombateAArthas.
	self combatienteOrcoMankrik enemigos: {self combatienteHumanoArthas. self combatienteOrcoOlgra .}.
	
	self combatienteOrcoMankrik atacar.
	
	Assert isTrue: self combatienteOrcoOlgra estaHerido.! !


!CombatientesTest class methodsFor: 'tests - condicion de distraido' stamp: 'JMB 9/14/2022 22:38:42'!
test29CuandoOlgraEstaDistraidoLeHacen2MasDeDaño
	self comenzarUnNuevoCombate .
	self combatienteOrcoOlgra usarArmaduraDeCuero.	
	self combatienteHumanoArthas atacarA: self combatienteOrcoOlgra.
	self combatienteHumanoArthas usarEspada.
	
	self combatienteHumanoArthas atacarA: self combatienteOrcoOlgra.
	
	Assert 
		isTrue: (self combatienteOrcoOlgra tienePuntosDeVida: 12*pv) 
		description: 'Olgra debe tener 12 puntos de vida: 20 (inicial) - 8 (por espada) + 2 (armadura de cuero) - 2 (daño por distraido)'.! !

!CombatientesTest class methodsFor: 'tests - condicion de distraido' stamp: 'JMB 9/14/2022 22:40:03'!
test30CuandoElAtaqueNoInflingeDañoOlgraNoRecibeDañoPorEstarDistradido
	self comenzarUnNuevoCombate .
	self combatienteOrcoOlgra usarArmaduraDeCuero.	
	self combatienteHumanoArthas atacarA: self combatienteOrcoOlgra.
	
	self combatienteHumanoArthas atacarA: self combatienteOrcoOlgra.
	
	Assert isTrue: self combatienteOrcoOlgra noEstaHerido description: 'Olgra debe tener los puntos de vida completos'.! !

!CombatientesTest class methodsFor: 'tests - condicion de distraido' stamp: 'JMB 9/14/2022 22:39:52'!
test31CuandoMankrikEstaDistraidoLeHacen2MasDeDaño
	self comenzarUnNuevoCombate .
	self combatienteOrcoMankrik usarArmaduraDeCuero.	
	self combatienteHumanoArthas atacarA: self combatienteOrcoMankrik.
	self combatienteHumanoArthas usarEspada.
	
	self combatienteHumanoArthas atacarA: self combatienteOrcoMankrik.
	
	Assert 
		isTrue: (self combatienteOrcoMankrik tienePuntosDeVida: 12*pv) 
		description: 'Mankrik debe tener 12 puntos de vida: 20 (inicial) - 8 (por espada) + 2 (armadura de cuero) - 2 (daño por distraido)'.! !

!CombatientesTest class methodsFor: 'tests - condicion de distraido' stamp: 'JMB 9/14/2022 22:39:39'!
test32CuandoElAtaqueNoInflingeDañoMankrikNoRecibeDañoPorEstarDistradido
	self comenzarUnNuevoCombate .
	self combatienteOrcoMankrik usarArmaduraDeCuero.	
	self combatienteHumanoArthas atacarA: self combatienteOrcoMankrik.
	
	self combatienteHumanoArthas atacarA: self combatienteOrcoMankrik.
	
	Assert isTrue: self combatienteOrcoMankrik noEstaHerido description: 'Mankrik debe tener los puntos de vida completos'.! !


!CombatientesTest class methodsFor: 'combate' stamp: 'LR 9/17/2022 17:35:03'!
arthasConHachaDejaFueraDeCombateAMankrik
	self combatienteHumanoArthas usarHacha.
	self combatienteHumanoArthas atacarA: self combatienteOrcoMankrik.
	self combatienteHumanoArthas atacarA: self combatienteOrcoMankrik.
	self combatienteHumanoArthas atacarA: self combatienteOrcoMankrik.! !

!CombatientesTest class methodsFor: 'combate' stamp: 'LR 9/17/2022 17:41:02'!
mankrikConHachaDejaFueraDeCombateAArthas
	self combatienteOrcoMankrik usarHacha.
	self combatienteOrcoMankrik atacarA: self combatienteHumanoArthas.
	self combatienteOrcoMankrik atacarA: self combatienteHumanoArthas.
	self combatienteOrcoMankrik atacarA: self combatienteHumanoArthas.! !

!CombatientesTest class methodsFor: 'combate' stamp: 'LR 9/17/2022 17:38:51'!
olgraConHachaDejaFueraDeCombateAMankrik
	self combatienteOrcoOlgra usarHacha.
	self combatienteOrcoOlgra atacarA: self combatienteOrcoMankrik.
	self combatienteOrcoOlgra atacarA: self combatienteOrcoMankrik.
	self combatienteOrcoOlgra atacarA: self combatienteOrcoMankrik.
	self combatienteOrcoOlgra atacarA: self combatienteOrcoMankrik.
	self combatienteOrcoOlgra atacarA: self combatienteOrcoMankrik.! !


!classDefinition: #EstadoDeDistraccion category: 'AtaquesFantasticosPaso2'!
DenotativeObject subclass: #EstadoDeDistraccion
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AtaquesFantasticosPaso2'!


!classDefinition: #Distraido category: 'AtaquesFantasticosPaso2'!
EstadoDeDistraccion subclass: #Distraido
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AtaquesFantasticosPaso2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Distraido class' category: 'AtaquesFantasticosPaso2'!
Distraido class
	instanceVariableNames: ''!

!Distraido class methodsFor: 'as yet unclassified' stamp: 'MJDS 9/18/2022 20:47:49'!
actualizarEstado: daño
	(daño = (0*pv)) ifTrue:[^self.].
	(daño > (0*pv)) ifTrue:[^NoDistraido].! !

!Distraido class methodsFor: 'as yet unclassified' stamp: 'MJDS 9/18/2022 20:50:21'!
calcularDaño: dañoADescontar
	(dañoADescontar = (0*pv)) ifTrue: [^0*pv].
	^ (dañoADescontar + (2*pv)).! !


!classDefinition: #NoDistraido category: 'AtaquesFantasticosPaso2'!
EstadoDeDistraccion subclass: #NoDistraido
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AtaquesFantasticosPaso2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'NoDistraido class' category: 'AtaquesFantasticosPaso2'!
NoDistraido class
	instanceVariableNames: ''!

!NoDistraido class methodsFor: 'as yet unclassified' stamp: 'MJDS 9/18/2022 20:48:35'!
actualizarEstado: daño
	(daño = (0*pv)) ifTrue:[^Distraido.].
	(daño > (0*pv)) ifTrue:[^self.].! !

!NoDistraido class methodsFor: 'as yet unclassified' stamp: 'MJDS 9/18/2022 19:55:58'!
calcularDaño: dañoADescontar
	^ dañoADescontar.! !


!classDefinition: #EstadoDeVida category: 'AtaquesFantasticosPaso2'!
DenotativeObject subclass: #EstadoDeVida
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AtaquesFantasticosPaso2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EstadoDeVida class' category: 'AtaquesFantasticosPaso2'!
EstadoDeVida class
	instanceVariableNames: 'estadoDistraccion'!

!EstadoDeVida class methodsFor: 'daño' stamp: 'MJDS 9/19/2022 19:10:45'!
calcularPuntosADescontarCon: dañoADescontar
	| daño |
	daño := estadoDistraccion calcularDaño: dañoADescontar.
	estadoDistraccion  := estadoDistraccion actualizarEstado: daño.
	^daño.! !


!EstadoDeVida class methodsFor: 'as yet unclassified' stamp: 'MJDS 9/18/2022 20:23:38'!
establecerDistraido
	estadoDistraccion := Distraido. ! !

!EstadoDeVida class methodsFor: 'as yet unclassified' stamp: 'MJDS 9/18/2022 20:23:32'!
establecerNoDistraido
	estadoDistraccion := NoDistraido. ! !


!EstadoDeVida class methodsFor: '--** private fileout/in **--' stamp: 'MJDS 9/19/2022 20:49:22'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	estadoDistraccion := nil.! !


!classDefinition: #EstadoFueraDeCombate category: 'AtaquesFantasticosPaso2'!
EstadoDeVida subclass: #EstadoFueraDeCombate
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AtaquesFantasticosPaso2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EstadoFueraDeCombate class' category: 'AtaquesFantasticosPaso2'!
EstadoFueraDeCombate class
	instanceVariableNames: ''!

!EstadoFueraDeCombate class methodsFor: 'as yet unclassified' stamp: 'MJDS 9/18/2022 20:11:34'!
actualizarEstado: puntosDeVida
	^self.
	! !

!EstadoFueraDeCombate class methodsFor: 'as yet unclassified' stamp: 'MJDS 9/18/2022 20:27:06'!
calcularPuntosADescontarCon: dañoADescontar
	^(0*pv).! !


!EstadoFueraDeCombate class methodsFor: '--** private fileout/in **--' stamp: 'MJDS 9/19/2022 20:49:22'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	estadoDistraccion := nil.! !


!classDefinition: #EstadoHerido category: 'AtaquesFantasticosPaso2'!
EstadoDeVida subclass: #EstadoHerido
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AtaquesFantasticosPaso2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EstadoHerido class' category: 'AtaquesFantasticosPaso2'!
EstadoHerido class
	instanceVariableNames: ''!

!EstadoHerido class methodsFor: 'as yet unclassified' stamp: 'MJDS 9/18/2022 20:10:09'!
actualizarEstado: puntosDeVida
	(puntosDeVida <= (0*pv))ifTrue: [^ EstadoFueraDeCombate.].
	^self.
	! !


!EstadoHerido class methodsFor: '--** private fileout/in **--' stamp: 'MJDS 9/19/2022 20:49:22'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	estadoDistraccion := Distraido.! !


!classDefinition: #EstadoNoHerido category: 'AtaquesFantasticosPaso2'!
EstadoDeVida subclass: #EstadoNoHerido
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AtaquesFantasticosPaso2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EstadoNoHerido class' category: 'AtaquesFantasticosPaso2'!
EstadoNoHerido class
	instanceVariableNames: ''!

!EstadoNoHerido class methodsFor: 'as yet unclassified' stamp: 'MJDS 9/18/2022 20:36:37'!
actualizarEstado: puntosDeVida
	| estado |
	(puntosDeVida < (20*pv))ifTrue: [
		estado := EstadoHerido.
		estado establecerNoDistraido.
		^estado.
		].
	^self.
	! !


!EstadoNoHerido class methodsFor: '--** private fileout/in **--' stamp: 'MJDS 9/19/2022 20:49:22'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	estadoDistraccion := NoDistraido.! !


!classDefinition: #EstrategiasTest category: 'AtaquesFantasticosPaso2'!
DenotativeObject subclass: #EstrategiasTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AtaquesFantasticosPaso2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EstrategiasTest class' category: 'AtaquesFantasticosPaso2'!
EstrategiasTest class
	instanceVariableNames: ''!

!EstrategiasTest class methodsFor: 'combates' stamp: 'JMB 9/15/2022 00:07:54'!
orquestadorParaArthasUsandoUnHachaYConFocoEnElMasHeridoVsOrcos
	
	OrquestadorDeCombatesTest prepararCombatientes.
	self combatienteHumanoArthas focalizarEnElMasHerido. 
	self combatienteHumanoArthas usarHacha.
	OrquestadorDeCombatesTest 
		establecerCombateEntreBando1: {self combatienteHumanoArthas } contraBando2: { self combatienteOrcoOlgra. self combatienteOrcoMankrik }.
	^ OrquestadorDeCombatesTest orquestadorDeCombates! !

!EstrategiasTest class methodsFor: 'combates' stamp: 'JMB 9/15/2022 00:07:39'!
orquestadorParaArthasUsandoUnHachaYConFocoEnElMasSanoVsOrcos
	
	OrquestadorDeCombatesTest prepararCombatientes.
	self combatienteHumanoArthas focalizarEnElMasSano. 
	self combatienteHumanoArthas usarHacha.
	OrquestadorDeCombatesTest 
		establecerCombateEntreBando1: {self combatienteHumanoArthas } contraBando2: { self combatienteOrcoOlgra. self combatienteOrcoMankrik }.
	^ OrquestadorDeCombatesTest orquestadorDeCombates! !

!EstrategiasTest class methodsFor: 'combates' stamp: 'JMB 9/15/2022 00:10:15'!
puntosDeVidaDelGanadorFocalizandoEnElMasHerido
	| orquestadorDeCombates |
	orquestadorDeCombates := self orquestadorParaArthasUsandoUnHachaYConFocoEnElMasHeridoVsOrcos.
	orquestadorDeCombates desarrollarDuranteRondas: 100.
	^ self combatienteHumanoArthas puntosDeVida! !

!EstrategiasTest class methodsFor: 'combates' stamp: 'JMB 9/15/2022 00:10:08'!
puntosDeVidaDelGanadorFocalizandoEnElMasSano
	| orquestadorDeCombates |
	orquestadorDeCombates := self orquestadorParaArthasUsandoUnHachaYConFocoEnElMasSanoVsOrcos.
	orquestadorDeCombates desarrollarDuranteRondas: 100.
	^ self combatienteHumanoArthas puntosDeVida! !


!EstrategiasTest class methodsFor: 'combatientes' stamp: 'MJDS 9/19/2022 19:29:29'!
combatienteHumanoArthas
	^CombatienteHumanoArthas ! !

!EstrategiasTest class methodsFor: 'combatientes' stamp: 'JMB 9/15/2022 00:01:56'!
combatienteOrcoMankrik
	^CombatienteOrcoMankrik ! !

!EstrategiasTest class methodsFor: 'combatientes' stamp: 'JMB 9/14/2022 23:11:07'!
combatienteOrcoOlgra
	^CombatienteOrcoOlgra ! !


!EstrategiasTest class methodsFor: 'tests' stamp: 'JMB 9/15/2022 00:09:22'!
test01FocalizarEnElMasHeridoEsMejorQueEnElMasSano
	
	Assert isTrue: self puntosDeVidaDelGanadorFocalizandoEnElMasHerido > self puntosDeVidaDelGanadorFocalizandoEnElMasSano.! !


!classDefinition: #OrquestadorDeCombates category: 'AtaquesFantasticosPaso2'!
DenotativeObject subclass: #OrquestadorDeCombates
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AtaquesFantasticosPaso2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OrquestadorDeCombates class' category: 'AtaquesFantasticosPaso2'!
OrquestadorDeCombates class
	instanceVariableNames: 'bando2 bando1'!

!OrquestadorDeCombates class methodsFor: 'as yet unclassified' stamp: 'MJDS 9/19/2022 20:47:24'!
desarrollarDuranteRondas: rondas
	| numeroDeRonda |
	numeroDeRonda := 1.
	[ (bando1 hayRondaDefinitoria) & (numeroDeRonda <= rondas)] whileTrue: [
		(self enfrentarCombatientes not) ifTrue: [
			bando1 rondaDefinitoria: numeroDeRonda.
			bando2 rondaDefinitoria: numeroDeRonda.
			].
		numeroDeRonda := numeroDeRonda + 1.
	].
	^ self obtenerResultadoDeCombates.! !

!OrquestadorDeCombates class methodsFor: 'as yet unclassified' stamp: 'MJDS 9/18/2022 13:16:51'!
enfrentarCombatientes
	bando1 atacarAEnemigos.
	bando2 atacarAEnemigos.
	^ self obtenerResultadoDeCombates isNil.
	
	! !

!OrquestadorDeCombates class methodsFor: 'as yet unclassified' stamp: 'MJDS 9/18/2022 13:48:37'!
establecerBando1: bandoUno bando2: bandoDos
	bando1 := BandoUno.
	bando1 establecerCombatientesDelMismo: bandoUno.
	bando1 rondaDefinitoria: 0.
	bando2 := BandoDos.
	bando2 establecerCombatientesDelMismo: bandoDos.
	bando2 rondaDefinitoria: 0.
	
	bando1 establecerEnemigos: bando2.
	bando2 establecerEnemigos: bando1.! !

!OrquestadorDeCombates class methodsFor: 'as yet unclassified' stamp: 'MJDS 9/18/2022 13:00:45'!
obtenerResultadoDeCombates
	(bando1 tieneCombatientesActivos)ifTrue: [
		(bando2 tieneCombatientesActivos)ifTrue:[
			^ nil.	
		].
		bando1 establecerComoGanador.
		^bando1.
	].
	bando2 establecerComoGanador.
	^bando2.! !


!OrquestadorDeCombates class methodsFor: '--** private fileout/in **--' stamp: 'MJDS 9/19/2022 20:49:22'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	bando2 := BandoDos.
	bando1 := BandoUno.! !


!classDefinition: #OrquestadorDeCombatesTest category: 'AtaquesFantasticosPaso2'!
DenotativeObject subclass: #OrquestadorDeCombatesTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AtaquesFantasticosPaso2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OrquestadorDeCombatesTest class' category: 'AtaquesFantasticosPaso2'!
OrquestadorDeCombatesTest class
	instanceVariableNames: 'orquestadorCombates'!

!OrquestadorDeCombatesTest class methodsFor: 'para completar' stamp: 'MJDS 9/18/2022 13:25:50'!
assertElResultadoIndicaQueGanoElBando1: resultadoDeUnCombate alcanzadaLaRonda: unNumeroDeRondaEsperado

	Assert isTrue: [resultadoDeUnCombate ganoBando1EnLaRonda: unNumeroDeRondaEsperado ] description: 'Reemplazar esto por la implementación correspondiente'! !

!OrquestadorDeCombatesTest class methodsFor: 'para completar' stamp: 'LR 9/18/2022 16:13:51'!
assertElResultadoIndicaQueGanoElBando2: resultadoDeUnCombate alcanzadaLaRonda: unNumeroDeRondaEsperado

	Assert isTrue: [resultadoDeUnCombate ganoBando2EnLaRonda: unNumeroDeRondaEsperado ] description: 'Reemplazar esto por la implementación correspondiente'! !

!OrquestadorDeCombatesTest class methodsFor: 'para completar' stamp: 'MJDS 9/18/2022 12:48:19'!
assertElResultadoIndicaQueNoHayGanador: resultadoDeUnCombate  alcanzadaLaRonda: unNumeroDeRondaEsperado

	Assert isTrue: [resultadoDeUnCombate isNil] description: 'El resultado del combate es nil cuando queda indefinido'! !

!OrquestadorDeCombatesTest class methodsFor: 'para completar' stamp: 'MJDS 9/18/2022 12:41:57'!
establecerCombateEntreBando1: unBando1 contraBando2: unBando2
	orquestadorCombates := OrquestadorDeCombates.
	orquestadorCombates establecerBando1: unBando1 bando2: unBando2.
! !

!OrquestadorDeCombatesTest class methodsFor: 'para completar' stamp: 'MJDS 9/17/2022 21:56:54'!
orquestadorDeCombates
	^OrquestadorDeCombates.! !


!OrquestadorDeCombatesTest class methodsFor: 'combates' stamp: 'JMB 9/15/2022 00:30:13'!
orquestadorParaCombateArthasConFocoEnElMasSanoVsOrcos	
	
	self prepararCombatientes.
	self combatienteHumanoArthas focalizarEnElMasSano. 
	self establecerCombateEntreBando1: {self combatienteHumanoArthas } contraBando2: { self combatienteOrcoOlgra. self combatienteOrcoMankrik }.
	^ self orquestadorDeCombates! !

!OrquestadorDeCombatesTest class methodsFor: 'combates' stamp: 'JMB 9/15/2022 00:30:25'!
orquestadorParaCombateArthasInmuneYFocoEnElMasHeridoVsOrcos	
	
	self prepararCombatientes.
	self combatienteHumanoArthas atacarA: self combatienteOrcoOlgra.
	self combatienteHumanoArthas usarArmaduraDeMetal. 
	self combatienteHumanoArthas focalizarEnElMasHerido. 
	self establecerCombateEntreBando1:  {self combatienteHumanoArthas } contraBando2: { self combatienteOrcoOlgra. self combatienteOrcoMankrik }.
	^ self orquestadorDeCombates! !

!OrquestadorDeCombatesTest class methodsFor: 'combates' stamp: 'JMB 9/15/2022 00:30:37'!
orquestadorParaCombateArthasVsOlgra	
	
	self prepararCombatientes. 
	self establecerCombateEntreBando1: {self combatienteHumanoArthas } contraBando2: { self combatienteOrcoOlgra }.
	^ self orquestadorDeCombates! !

!OrquestadorDeCombatesTest class methodsFor: 'combates' stamp: 'JMB 9/15/2022 00:30:51'!
orquestadorParaCombateArthasVsOrcos
	self prepararCombatientes.
	self establecerCombateEntreBando1: { self combatienteHumanoArthas } contraBando2: {self combatienteOrcoOlgra. self combatienteOrcoMankrik }.
	^ self orquestadorDeCombates! !

!OrquestadorDeCombatesTest class methodsFor: 'combates' stamp: 'JMB 9/15/2022 00:31:33'!
orquestadorParaCombateManoAManoConBando2Inmune	
	
	self prepararCombatientes.
	self combatienteOrcoOlgra usarEspada.
	self establecerCombateEntreBando1: {self combatienteHumanoArthas } contraBando2: { self combatienteOrcoOlgra }.
	^ self orquestadorDeCombates! !

!OrquestadorDeCombatesTest class methodsFor: 'combates' stamp: 'JMB 9/15/2022 00:31:13'!
orquestadorParaCombateOrcosVsArthas
	self prepararCombatientes.
	self establecerCombateEntreBando1: {self combatienteOrcoOlgra. self combatienteOrcoMankrik } contraBando2: { self combatienteHumanoArthas }.
	^ self orquestadorDeCombates! !

!OrquestadorDeCombatesTest class methodsFor: 'combates' stamp: 'JMB 9/15/2022 00:31:43'!
orquestadorParaCombateOrcosVsArthasConFocoEnElMasSano	
	
	self prepararCombatientes.
	self combatienteHumanoArthas focalizarEnElMasSano. 
	self establecerCombateEntreBando1: { self combatienteOrcoOlgra. self combatienteOrcoMankrik } contraBando2: {self combatienteHumanoArthas }. 
	^ self orquestadorDeCombates! !

!OrquestadorDeCombatesTest class methodsFor: 'combates' stamp: 'JMB 9/15/2022 00:31:54'!
orquestadorParaCombateOrcosVsArthasInmuneYFocoEnElMasHerido	
	
	self prepararCombatientes.
	self combatienteHumanoArthas atacarA: self combatienteOrcoOlgra.
	self combatienteHumanoArthas usarArmaduraDeMetal. 
	self combatienteHumanoArthas focalizarEnElMasHerido. 
	self establecerCombateEntreBando1: { self combatienteOrcoOlgra. self combatienteOrcoMankrik } contraBando2: {self combatienteHumanoArthas }.
	^ self orquestadorDeCombates! !

!OrquestadorDeCombatesTest class methodsFor: 'combates' stamp: 'MJDS 9/18/2022 13:48:00'!
prepararCombatientes

	self combatienteHumanoArthas prepararseParaElCombate. 
	self combatienteOrcoOlgra prepararseParaElCombate.
	self combatienteOrcoMankrik prepararseParaElCombate. ! !


!OrquestadorDeCombatesTest class methodsFor: 'combatientes' stamp: 'MJDS 9/19/2022 19:29:21'!
combatienteHumanoArthas

	^ CombatienteHumanoArthas! !

!OrquestadorDeCombatesTest class methodsFor: 'combatientes' stamp: 'JMB 9/12/2022 20:49:44'!
combatienteOrcoMankrik

	^ CombatienteOrcoMankrik! !

!OrquestadorDeCombatesTest class methodsFor: 'combatientes' stamp: 'JMB 9/12/2022 20:48:43'!
combatienteOrcoOlgra

	^ CombatienteOrcoOlgra! !


!OrquestadorDeCombatesTest class methodsFor: 'tests - mano a mano' stamp: 'JMB 9/15/2022 00:30:37'!
test01AlDesarrollarUnCombateSinRondasLosCombatientesNoSeAtacan
	
	| orquestadorDeCombates |
	orquestadorDeCombates := self orquestadorParaCombateArthasVsOlgra.
	
	orquestadorDeCombates desarrollarDuranteRondas: 0.
	
	Assert isTrue: self combatienteHumanoArthas noEstaHerido.
	Assert isTrue: self combatienteOrcoOlgra noEstaHerido.! !

!OrquestadorDeCombatesTest class methodsFor: 'tests - mano a mano' stamp: 'JMB 9/15/2022 00:30:37'!
test02AlDesarrollarUnCombateManoAManoDeUnaRondaLosBandosSeAtacanUnaVez
	
	| orquestadorDeCombates |
	orquestadorDeCombates := self orquestadorParaCombateArthasVsOlgra.
	
	orquestadorDeCombates desarrollarDuranteRondas: 1.
	
	Assert isTrue: (self combatienteHumanoArthas tienePuntosDeVida: 18*pv) description: 'Arthas debe recibir un puñetazo (2 de daño)'.
	Assert isTrue: (self combatienteOrcoOlgra tienePuntosDeVida: 18*pv) description: 'Olgra debe recibir un puñetazo (2 de daño)'.! !

!OrquestadorDeCombatesTest class methodsFor: 'tests - mano a mano' stamp: 'JMB 9/15/2022 00:30:37'!
test03AlDesarrollarUnCombateManoAManoConMasDeUnaRondaLosBandosSeAtacanCadaVez
	
	| orquestadorDeCombates |
	orquestadorDeCombates := self orquestadorParaCombateArthasVsOlgra.
	
	orquestadorDeCombates desarrollarDuranteRondas: 2.
	
	Assert isTrue: (self combatienteHumanoArthas tienePuntosDeVida: 16*pv) description: 'Arthas debe recibir dos puñetazos (4 de daño)'.
	Assert isTrue: (self combatienteOrcoOlgra tienePuntosDeVida: 16*pv) description: 'Olgra debe recibir dos puñetazos (4 de daño)'.! !

!OrquestadorDeCombatesTest class methodsFor: 'tests - mano a mano' stamp: 'JMB 9/15/2022 00:30:37'!
test04AlDesarrollarUnCombateManoAManoSinGanadoresElResultadoEsIndeterminado
	
	| orquestadorDeCombates resultado |
	orquestadorDeCombates := self orquestadorParaCombateArthasVsOlgra.
	
	resultado := orquestadorDeCombates desarrollarDuranteRondas: 0.
	
	self assertElResultadoIndicaQueNoHayGanador: resultado alcanzadaLaRonda: 0.! !

!OrquestadorDeCombatesTest class methodsFor: 'tests - mano a mano' stamp: 'JMB 9/15/2022 00:30:37'!
test05AlDesarrollarUnCombateManoAManoGanaElBando1CuandoDejaFueraDeCombateASuRival
	
	| orquestadorDeCombates resultado |
	orquestadorDeCombates := self orquestadorParaCombateArthasVsOlgra.
	
	resultado := orquestadorDeCombates desarrollarDuranteRondas: 10.
	
	self assertElResultadoIndicaQueGanoElBando1: resultado alcanzadaLaRonda: 10.! !

!OrquestadorDeCombatesTest class methodsFor: 'tests - mano a mano' stamp: 'JMB 9/15/2022 00:30:37'!
test06AlDesarrollarUnCombateCuandoHayUnGanadorFinalizaEnLaRondaQueElPerdedorQuedoFueraDeCombate
	
	| orquestadorDeCombates resultado |
	orquestadorDeCombates := self orquestadorParaCombateArthasVsOlgra.
	
	resultado := orquestadorDeCombates desarrollarDuranteRondas: 11.
	
	self assertElResultadoIndicaQueGanoElBando1: resultado alcanzadaLaRonda: 10.! !

!OrquestadorDeCombatesTest class methodsFor: 'tests - mano a mano' stamp: 'JMB 9/15/2022 00:31:33'!
test07AlDesarrollarUnCombateManoAManoGanaElBando2CuandoDejaFueraDeCombateASuRival
	
	| orquestadorDeCombates resultado |
	orquestadorDeCombates := self orquestadorParaCombateManoAManoConBando2Inmune.
	
	resultado := orquestadorDeCombates desarrollarDuranteRondas: 100.
	
	self assertElResultadoIndicaQueGanoElBando2: resultado alcanzadaLaRonda: 3.! !


!OrquestadorDeCombatesTest class methodsFor: 'tests - muches vs muches' stamp: 'JMB 9/15/2022 00:30:13'!
test08AlDesarrollarUnCombateLosDelBando1PuedenAtacarACualquieraDelBando2
	
	| orquestadorDeCombates |
	orquestadorDeCombates := self orquestadorParaCombateArthasConFocoEnElMasSanoVsOrcos.
	
	orquestadorDeCombates desarrollarDuranteRondas: 2.
	
	Assert isTrue: self combatienteOrcoOlgra estaHerido. 
	Assert isTrue: self combatienteOrcoMankrik estaHerido. ! !

!OrquestadorDeCombatesTest class methodsFor: 'tests - muches vs muches' stamp: 'JMB 9/15/2022 00:31:13'!
test09AlDesarrollarUnCombateAtacanTodesLosDelBando1EnCadaRonda
	"
		En cada ronda Olgra daña a Arthas en 2  (2 puños + 1 por fuerza - 1 por agilidad de Arthas) y  Mankrik 3 (2 puños + 2 por fuerza - 1 por agilidad de Arthas) 
	"
	| orquestadorDeCombates resultado |
	orquestadorDeCombates := self orquestadorParaCombateOrcosVsArthas.
	
	resultado := orquestadorDeCombates desarrollarDuranteRondas: 4.
	
	self assertElResultadoIndicaQueGanoElBando1: resultado alcanzadaLaRonda: 4.! !

!OrquestadorDeCombatesTest class methodsFor: 'tests - muches vs muches' stamp: 'JMB 9/15/2022 00:31:43'!
test10AlDesarrollarUnCombateLosDelBando2PuedenAtacarACualquieraDelBando1
	
	| orquestadorDeCombates |
	orquestadorDeCombates := self orquestadorParaCombateOrcosVsArthasConFocoEnElMasSano.
	
	orquestadorDeCombates desarrollarDuranteRondas: 2.
	
	Assert isTrue: self combatienteOrcoOlgra estaHerido. 
	Assert isTrue: self combatienteOrcoMankrik estaHerido. ! !

!OrquestadorDeCombatesTest class methodsFor: 'tests - muches vs muches' stamp: 'JMB 9/15/2022 00:30:51'!
test11AlDesarrollarUnCombateAtacanTodesLosDelBando2EnCadaRonda
	"
		En cada ronda Olgra daña a Arthas en 2  (2 puños + 1 por fuerza - 1 por agilidad de Arthas) y  Mankrik 3 (2 puños + 2 por fuerza - 1 por agilidad de Arthas) 
	"
	| orquestadorDeCombates resultado |
	orquestadorDeCombates := self orquestadorParaCombateArthasVsOrcos.
	
	resultado := orquestadorDeCombates desarrollarDuranteRondas: 4.
	
	self assertElResultadoIndicaQueGanoElBando2: resultado alcanzadaLaRonda: 4.! !

!OrquestadorDeCombatesTest class methodsFor: 'tests - muches vs muches' stamp: 'JMB 9/15/2022 00:30:25'!
test12AlDesarrollarUnCombateLosDelBando1NoGananSiTodosLosDelBando2NoEstanFueraDeCombate
	
	| orquestadorDeCombates resultado |
	orquestadorDeCombates := self orquestadorParaCombateArthasInmuneYFocoEnElMasHeridoVsOrcos.
	
	resultado := orquestadorDeCombates desarrollarDuranteRondas: 10.
	
	self assertElResultadoIndicaQueNoHayGanador: resultado alcanzadaLaRonda: 10.! !

!OrquestadorDeCombatesTest class methodsFor: 'tests - muches vs muches' stamp: 'JMB 9/15/2022 00:31:54'!
test13AlDesarrollarUnCombateLosDelBando2NoGananSiTodosLosDelBando1NoEstanFueraDeCombate
	
	| orquestadorDeCombates resultado |
	orquestadorDeCombates := self orquestadorParaCombateOrcosVsArthasInmuneYFocoEnElMasHerido.
	
	resultado := orquestadorDeCombates desarrollarDuranteRondas: 10.
	
	self assertElResultadoIndicaQueNoHayGanador: resultado alcanzadaLaRonda: 10.! !


!OrquestadorDeCombatesTest class methodsFor: '--** private fileout/in **--' stamp: 'MJDS 9/19/2022 20:49:22'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	orquestadorCombates := OrquestadorDeCombates.! !

Bando initializeAfterFileIn!
BandoDos initializeAfterFileIn!
BandoUno initializeAfterFileIn!
Combatiente initializeAfterFileIn!
CombatienteHumano initializeAfterFileIn!
CombatienteHumanoArthas initializeAfterFileIn!
CombatienteOrco initializeAfterFileIn!
CombatienteOrcoMankrik initializeAfterFileIn!
CombatienteOrcoOlgra initializeAfterFileIn!
CombatientesTest initialize!
EstadoDeVida initializeAfterFileIn!
EstadoFueraDeCombate initializeAfterFileIn!
EstadoHerido initializeAfterFileIn!
EstadoNoHerido initializeAfterFileIn!
OrquestadorDeCombates initializeAfterFileIn!
OrquestadorDeCombatesTest initializeAfterFileIn!