!classDefinition: #MarsRoverTest category: 'MarsRover-Ejercicio'!
TestCase subclass: #MarsRoverTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Ejercicio'!

!MarsRoverTest methodsFor: 'testing' stamp: 'MD 11/4/2022 11:50:28'!
test01EnviandoUnComandoVacioElMarsRoverNoHaceNada
	| marsRover |
	marsRover := MarsRover enPosicion: 1@3 orientadoA: (OrientacionDelMarsRover orientacionEste).
	marsRover ejecutarComando: ''.
	self assert: (marsRover estaEnPosicion: 1@3). 
	self assert: (marsRover estaApuntandoHacia: #Este ).
	! !

!MarsRoverTest methodsFor: 'testing' stamp: 'MD 11/4/2022 11:50:28'!
test02EnviandoUnComandoQueIndicaMovimientoALaIzquierdaDesdeElEsteElMarsRoverApuntaHaciaElNorte
	| marsRover |
	marsRover := MarsRover enPosicion: 5@8 orientadoA: (OrientacionDelMarsRover orientacionEste).
	marsRover ejecutarComando: 'l'.		
	self assert: (marsRover estaEnPosicion: 5@8). 
	self assert: (marsRover estaApuntandoHacia: #Norte).
	self deny: (marsRover estaApuntandoHacia: #Este).
! !

!MarsRoverTest methodsFor: 'testing' stamp: 'MD 11/4/2022 11:50:28'!
test03EnviandoUnComandoQueIndicaMovimientoALaIzquierdaDesdeElNorteElMarsRoverApuntaHaciaElOeste
	| marsRover |
	marsRover := MarsRover enPosicion: 5@8 orientadoA: (OrientacionDelMarsRover orientacionNorte).
	marsRover ejecutarComando: 'l'.		
	self assert: (marsRover estaEnPosicion: 5@8). 
	self assert: (marsRover estaApuntandoHacia: #Oeste).
	self deny: (marsRover estaApuntandoHacia: #Norte).
! !

!MarsRoverTest methodsFor: 'testing' stamp: 'MD 11/4/2022 11:50:27'!
test04EnviandoUnComandoQueIndicaMovimientoALaIzquierdaDesdeElOesteElMarsRoverApuntaHaciaElSur
	| marsRover |
	marsRover := MarsRover enPosicion: 5@8 orientadoA: (OrientacionDelMarsRover orientacionOeste).
	marsRover ejecutarComando: 'l'.		
	self assert: (marsRover estaEnPosicion: 5@8). 
	self assert: (marsRover estaApuntandoHacia: #Sur).
	self deny: (marsRover estaApuntandoHacia: #Oeste).
! !

!MarsRoverTest methodsFor: 'testing' stamp: 'MD 11/4/2022 11:50:27'!
test05EnviandoUnComandoQueIndicaMovimientoALaIzquierdaDesdeElSurElMarsRoverApuntaHaciaElEste
	| marsRover |
	marsRover := MarsRover enPosicion: 5@8 orientadoA: (OrientacionDelMarsRover orientacionSur).
	marsRover ejecutarComando: 'l'.		
	self assert: (marsRover estaEnPosicion: 5@8). 
	self assert: (marsRover estaApuntandoHacia: #Este).
	self deny: (marsRover estaApuntandoHacia: #Sur).
! !

!MarsRoverTest methodsFor: 'testing' stamp: 'MD 11/4/2022 11:50:27'!
test06EnviandoUnComandoQueIndicaMovimientoALaDerechaDesdeElEsteElMarsRoverApuntaHaciaElSur
	| marsRover |
	marsRover := MarsRover enPosicion: 5@8 orientadoA: (OrientacionDelMarsRover orientacionEste).
	marsRover ejecutarComando: 'r'.		
	self assert: (marsRover estaEnPosicion: 5@8). 
	self assert: (marsRover estaApuntandoHacia: #Sur).
	self deny: (marsRover estaApuntandoHacia: #Este).
! !

!MarsRoverTest methodsFor: 'testing' stamp: 'MD 11/4/2022 11:50:28'!
test07EnviandoUnComandoQueIndicaMovimientoALaDerechaDesdeElSurElMarsRoverApuntaHaciaElOeste
	| marsRover |
	marsRover := MarsRover enPosicion: 5@8 orientadoA: (OrientacionDelMarsRover orientacionSur).
	marsRover ejecutarComando: 'r'.		
	self assert: (marsRover estaEnPosicion: 5@8). 
	self assert: (marsRover estaApuntandoHacia: #Oeste).
	self deny: (marsRover estaApuntandoHacia: #Sur).
! !

!MarsRoverTest methodsFor: 'testing' stamp: 'MD 11/4/2022 11:50:27'!
test08EnviandoUnComandoQueIndicaMovimientoALaDerechaDesdeElOesteElMarsRoverApuntaHaciaElNorte
	| marsRover |
	marsRover := MarsRover enPosicion: 5@8 orientadoA: (OrientacionDelMarsRover orientacionOeste).
	marsRover ejecutarComando: 'r'.		
	self assert: (marsRover estaEnPosicion: 5@8). 
	self assert: (marsRover estaApuntandoHacia: #Norte).
	self deny: (marsRover estaApuntandoHacia: #Oeste).
! !

!MarsRoverTest methodsFor: 'testing' stamp: 'MD 11/4/2022 11:50:28'!
test09EnviandoUnComandoQueIndicaMovimientoALaDerechaDesdeElNorteElMarsRoverApuntaHaciaElEste
	| marsRover |
	marsRover := MarsRover enPosicion: 5@8 orientadoA: (OrientacionDelMarsRover orientacionNorte).
	marsRover ejecutarComando: 'r'.		
	self assert: (marsRover estaEnPosicion: 5@8). 
	self assert: (marsRover estaApuntandoHacia: #Este).
	self deny: (marsRover estaApuntandoHacia: #Norte).
! !

!MarsRoverTest methodsFor: 'testing' stamp: 'MD 11/4/2022 11:50:27'!
test10EnviandoUnComandoQueIndicaMovimientoHaciaAdelanteDesdeElNorteElMarsRoverAvanzaUnPuntoHaciaElNorte
	| marsRover |
	
	marsRover := MarsRover enPosicion: 1@1 orientadoA: (OrientacionDelMarsRover orientacionNorte).
	marsRover ejecutarComando: 'f'.		
	
	self assert: (marsRover estaEnPosicion: 1@2). 
	self deny: (marsRover estaEnPosicion: 1@1).
	self assert: (marsRover estaApuntandoHacia: #Norte).
! !

!MarsRoverTest methodsFor: 'testing' stamp: 'MD 11/4/2022 11:50:27'!
test11EnviandoUnComandoQueIndicaMovimientoHaciaAdelanteDesdeElOesteElMarsRoverAvanzaUnPuntoHaciaElOeste
	| marsRover |
	
	marsRover := MarsRover enPosicion: 1@1 orientadoA: (OrientacionDelMarsRover orientacionOeste).
	marsRover ejecutarComando: 'f'.		
	
	self assert: (marsRover estaEnPosicion: 0@1). 
	self deny: (marsRover estaEnPosicion: 1@1).
	self assert: (marsRover estaApuntandoHacia: #Oeste).
! !

!MarsRoverTest methodsFor: 'testing' stamp: 'MD 11/4/2022 11:50:27'!
test12EnviandoUnComandoQueIndicaMovimientoHaciaAdelanteDesdeElSurElMarsRoverAvanzaUnPuntoHaciaElSur
	| marsRover |
	
	marsRover := MarsRover enPosicion: 1@1 orientadoA: (OrientacionDelMarsRover orientacionSur).
	marsRover ejecutarComando: 'f'.		
	
	self assert: (marsRover estaEnPosicion: 1@0). 
	self deny: (marsRover estaEnPosicion: 1@1).
	self assert: (marsRover estaApuntandoHacia: #Sur).
! !

!MarsRoverTest methodsFor: 'testing' stamp: 'MD 11/4/2022 11:50:27'!
test13EnviandoUnComandoQueIndicaMovimientoHaciaAdelanteDesdeElEsteElMarsRoverAvanzaUnPuntoHaciaElEste
	| marsRover |
	
	marsRover := MarsRover enPosicion: 1@1 orientadoA: (OrientacionDelMarsRover orientacionEste).
	marsRover ejecutarComando: 'f'.		
	
	self assert: (marsRover estaEnPosicion: 2@1). 
	self deny: (marsRover estaEnPosicion: 1@1).
	self assert: (marsRover estaApuntandoHacia: #Este).
! !

!MarsRoverTest methodsFor: 'testing' stamp: 'MD 11/4/2022 11:50:27'!
test14EnviandoUnComandoQueIndicaMovimientoHaciaAtrasDesdeElNorteElMarsRoverRetrocedeUnPuntoHaciaElNorte
	| marsRover |
	
	marsRover := MarsRover enPosicion: 1@1 orientadoA: (OrientacionDelMarsRover orientacionNorte).
	marsRover ejecutarComando: 'b'.		
	
	self assert: (marsRover estaEnPosicion: 1@0). 
	self deny: (marsRover estaEnPosicion: 1@1).
	self assert: (marsRover estaApuntandoHacia: #Norte).
! !

!MarsRoverTest methodsFor: 'testing' stamp: 'MD 11/4/2022 11:50:27'!
test15EnviandoUnComandoQueIndicaMovimientoHaciaAtrasDesdeElOesteElMarsRoverRetrocedeUnPuntoHaciaElOeste
	| marsRover |
	
	marsRover := MarsRover enPosicion: 1@1 orientadoA: (OrientacionDelMarsRover orientacionOeste).
	marsRover ejecutarComando: 'b'.		
	
	self assert: (marsRover estaEnPosicion: 2@1). 
	self deny: (marsRover estaEnPosicion: 1@1).
	self assert: (marsRover estaApuntandoHacia: #Oeste).
! !

!MarsRoverTest methodsFor: 'testing' stamp: 'MD 11/4/2022 11:50:27'!
test16EnviandoUnComandoQueIndicaMovimientoHaciaAtrasDesdeElSurElMarsRoverRetrocedeUnPuntoHaciaElSur
	| marsRover |
	
	marsRover := MarsRover enPosicion: 1@1 orientadoA: (OrientacionDelMarsRover orientacionSur).
	marsRover ejecutarComando: 'b'.		
	
	self assert: (marsRover estaEnPosicion: 1@2). 
	self deny: (marsRover estaEnPosicion: 1@1).
	self assert: (marsRover estaApuntandoHacia: #Sur).
! !

!MarsRoverTest methodsFor: 'testing' stamp: 'MD 11/4/2022 11:50:28'!
test17EnviandoUnComandoQueIndicaMovimientoHaciaAtrasDesdeElEsteElMarsRoverRetrocedeUnPuntoHaciaElEste
	| marsRover |
	
	marsRover := MarsRover enPosicion: 1@1 orientadoA: (OrientacionDelMarsRover orientacionEste).
	marsRover ejecutarComando: 'b'.		
	
	self assert: (marsRover estaEnPosicion: 0@1). 
	self deny: (marsRover estaEnPosicion: 1@1).
	self assert: (marsRover estaApuntandoHacia: #Este).
! !

!MarsRoverTest methodsFor: 'testing' stamp: 'MD 11/4/2022 11:50:28'!
test18EnviandoUnComandoQueIndicaMovimientoDosVecesALaIzquierdaDejaElMarsRoverEnSentidoOpuesto
	| marsRover |
	marsRover := MarsRover enPosicion: 1@1 orientadoA: OrientacionDelMarsRover orientacionOeste.
	marsRover ejecutarComando: 'll'.		
	self assert: (marsRover estaEnPosicion: 1@1). 
	self assert: (marsRover estaApuntandoHacia: #Este).
	self deny: (marsRover estaApuntandoHacia: #Oeste).
! !

!MarsRoverTest methodsFor: 'testing' stamp: 'MD 11/4/2022 11:50:27'!
test19EnviandoUnComandoInvalidoElMarsRoverFallaPeroLosMovimientosPreviosFueronHechos
	| marsRover |
	marsRover := MarsRover enPosicion: 0@0 orientadoA: OrientacionDelMarsRover orientacionNorte.
	
	self should: [marsRover ejecutarComando: 'lfñ'.		] raise:  Error
		withExceptionDo: [:unError |
			self assert: unError messageText equals: MarsRover comandoInvalidoErrorDescription.
			self assert: (marsRover estaApuntandoHacia: #Oeste).
			self deny: (marsRover estaEnPosicion: 0@0).
			self assert: (marsRover estaEnPosicion: -1@0).
		]
! !


!classDefinition: #MarsRover category: 'MarsRover-Ejercicio'!
Object subclass: #MarsRover
	instanceVariableNames: 'posicion orientacionActual'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Ejercicio'!

!MarsRover methodsFor: 'inicializacion' stamp: 'MD 11/4/2022 11:49:54'!
inicializarEnPosicion: unaPosicion orientadoHacia: unSentido 
	posicion := unaPosicion.
	orientacionActual := unSentido.! !


!MarsRover methodsFor: 'funciones' stamp: 'ln 11/3/2022 22:22:59'!
ejecutarComando: unComando

	(unComando isEmpty) ifTrue: [^self.].
	
	unComando do: [: letra | self ejecutarMovimientoCon: letra	].! !


!MarsRover methodsFor: 'private' stamp: 'MD 11/4/2022 11:48:19'!
avanzarUnPunto
	orientacionActual avanzarUnPunto: self.! !

!MarsRover methodsFor: 'private' stamp: 'ln 11/4/2022 00:01:10'!
ejecutarMovimientoCon: unaLetraDelComando

	(unaLetraDelComando asString = 'l') ifTrue: [
		self girarHaciaLaIzquierda] ifFalse: [
		(unaLetraDelComando asString = 'r') ifTrue: [
			self girarHaciaLaDerecha] ifFalse: [
			(unaLetraDelComando asString = 'f') ifTrue: [
				self avanzarUnPunto] ifFalse: [
				(unaLetraDelComando asString = 'b') ifTrue: [
					self retrocederUnPunto] ifFalse: [self error: MarsRover comandoInvalidoErrorDescription]
				]
			]
		]
	! !

!MarsRover methodsFor: 'private' stamp: 'MD 11/4/2022 11:48:19'!
girarHaciaLaDerecha
	orientacionActual := orientacionActual girarHaciaLaDerecha.! !

!MarsRover methodsFor: 'private' stamp: 'MD 11/4/2022 11:48:19'!
girarHaciaLaIzquierda
	orientacionActual := orientacionActual girarHaciaLaIzquierda.! !

!MarsRover methodsFor: 'private' stamp: 'MD 11/4/2022 01:21:10'!
moverseConPunto: puntoAMoverse
	posicion := posicion + puntoAMoverse.! !

!MarsRover methodsFor: 'private' stamp: 'MD 11/4/2022 11:48:19'!
retrocederUnPunto
	orientacionActual retrocederUnPunto: self.! !


!MarsRover methodsFor: 'testing' stamp: 'MD 11/4/2022 11:48:19'!
estaApuntandoHacia: unPuntoCardinal
	^orientacionActual suOrientacionEsHacia: unPuntoCardinal.! !

!MarsRover methodsFor: 'testing' stamp: 'ln 10/29/2022 12:03:30'!
estaEnPosicion: unaPosicion
	^posicion = unaPosicion.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'MarsRover-Ejercicio'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'initialization' stamp: 'MD 11/4/2022 11:50:27'!
enPosicion: unaPosicion orientadoA: unSentido 
	^self new inicializarEnPosicion: unaPosicion orientadoHacia: unSentido! !


!MarsRover class methodsFor: 'error' stamp: 'MD 10/29/2022 16:42:31'!
comandoInvalidoErrorDescription
	^'El comando es invalido'.! !


!classDefinition: #OrientacionDelMarsRover category: 'MarsRover-Ejercicio'!
Object subclass: #OrientacionDelMarsRover
	instanceVariableNames: 'orientacion puntosAMoverse orientacionAlaDerecha orientacionAlaIzquierda'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Ejercicio'!

!OrientacionDelMarsRover methodsFor: 'rotacion' stamp: 'MD 11/4/2022 11:32:28'!
girarHaciaLaDerecha
	^orientacionAlaDerecha value.! !

!OrientacionDelMarsRover methodsFor: 'rotacion' stamp: 'MD 11/4/2022 11:40:15'!
girarHaciaLaIzquierda
	^orientacionAlaIzquierda value.! !


!OrientacionDelMarsRover methodsFor: 'desplazamiento' stamp: 'MD 11/4/2022 01:38:59'!
avanzarUnPunto: unMarsRover
	unMarsRover moverseConPunto: puntosAMoverse.! !

!OrientacionDelMarsRover methodsFor: 'desplazamiento' stamp: 'MD 11/4/2022 01:39:23'!
retrocederUnPunto: unMarsRover
	unMarsRover moverseConPunto: (puntosAMoverse) negated.! !


!OrientacionDelMarsRover methodsFor: 'testing' stamp: 'MD 11/4/2022 00:38:59'!
suOrientacionEsHacia: unPuntoCardinal
	^orientacion = unPuntoCardinal.! !


!OrientacionDelMarsRover methodsFor: 'initialize' stamp: 'MD 11/4/2022 11:23:27'!
initializeConValor: unaOrientacion suDerecha: suDerecha suIzquierda: suIzquierda puntoDeAvace: unPuntoDeAvance.
	orientacion := unaOrientacion.
	orientacionAlaDerecha := suDerecha.
	orientacionAlaIzquierda := suIzquierda.
	puntosAMoverse := unPuntoDeAvance.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OrientacionDelMarsRover class' category: 'MarsRover-Ejercicio'!
OrientacionDelMarsRover class
	instanceVariableNames: ''!

!OrientacionDelMarsRover class methodsFor: 'orientacion' stamp: 'MD 11/4/2022 11:32:06'!
orientacionEste
	^self new initializeConValor: #Este suDerecha: [self orientacionSur] suIzquierda: [self orientacionNorte] puntoDeAvace: 1@0.! !

!OrientacionDelMarsRover class methodsFor: 'orientacion' stamp: 'MD 11/4/2022 11:33:23'!
orientacionNorte
	^self new initializeConValor: #Norte suDerecha: [self orientacionEste] suIzquierda: [self orientacionOeste] puntoDeAvace: 0@1.! !

!OrientacionDelMarsRover class methodsFor: 'orientacion' stamp: 'MD 11/4/2022 11:33:55'!
orientacionOeste
	^self new initializeConValor: #Oeste suDerecha: [self orientacionNorte] suIzquierda: [self orientacionSur] puntoDeAvace: (1@0)negated.! !

!OrientacionDelMarsRover class methodsFor: 'orientacion' stamp: 'MD 11/4/2022 11:34:09'!
orientacionSur
	^self new initializeConValor: #Sur suDerecha: [self orientacionOeste] suIzquierda: [self orientacionEste] puntoDeAvace: (0@1)negated.! !
