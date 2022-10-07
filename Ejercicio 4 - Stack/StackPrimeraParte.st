!classDefinition: #StackTest category: 'StackPrimeraParte'!
TestCase subclass: #StackTest
	instanceVariableNames: 'stack elemento1 elemento2'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'StackPrimeraParte'!

!StackTest methodsFor: 'setUp' stamp: 'ln 10/7/2022 15:05:06'!
setUp
	
	stack := Stack new.
	elemento1 := 'elemento1'.
	elemento2 := 'elemento2'.
	! !


!StackTest methodsFor: 'testing' stamp: 'ln 10/7/2022 15:05:17'!
test01StackShouldBeEmptyWhenCreated

	self assert: stack isEmpty! !

!StackTest methodsFor: 'testing' stamp: 'ln 10/7/2022 15:05:34'!
test02SePuedeAgregarUnElementoCorrectamente

	stack push: elemento1.
	
	self deny: stack isEmpty.! !

!StackTest methodsFor: 'testing' stamp: 'ln 10/7/2022 15:05:53'!
test03SePuedeSacarUnElementoCorrectamente
	
	stack push: elemento1.
	stack pop.
	
	self assert: stack isEmpty.! !

!StackTest methodsFor: 'testing' stamp: 'ln 10/7/2022 15:06:40'!
test04alSacarUnElementoEsteSeDevuelve
	
	| elementoEliminado |
	stack push: elemento1.
	elementoEliminado := stack pop.
	
	self assert: elemento1 equals: elementoEliminado.
	self assert: stack isEmpty.! !

!StackTest methodsFor: 'testing' stamp: 'ln 10/7/2022 15:06:59'!
test05elUltimoElementoQueSeAgregaEsElPrimeroQueSale
	
	stack push: elemento1.
	stack push: elemento2.
	
	self assert: stack pop equals: elemento2.
	self assert: stack pop equals: elemento1.
	self assert: stack isEmpty.! !

!StackTest methodsFor: 'testing' stamp: 'ln 10/7/2022 15:07:16'!
test06sePuedeObtenerElUltimoElementoAgregadoSinRemoverlo
	
	stack push: elemento1.
	
	self assert: stack top equals: elemento1.
	self deny: stack isEmpty.! !

!StackTest methodsFor: 'testing' stamp: 'ln 10/7/2022 15:58:44'!
test07siSeEliminaUnElementoConElStackVacioObtenemosUnError
	self should: [ stack pop ].! !

!StackTest methodsFor: 'testing' stamp: 'ln 10/7/2022 15:59:36'!
test08siSeQuiereVerElTopeDelStackVacioObtenemosUnError
	self should: [ stack top ].! !


!StackTest methodsFor: 'assertions' stamp: 'ln 10/7/2022 15:58:16'!
should: aBlock
	self should: aBlock raise: Error withExceptionDo: [ :anError | 
		self assert: anError messageText equals: Stack noSePuedeAccederAUnStackVacioErrorDescription.].! !


!classDefinition: #Stack category: 'StackPrimeraParte'!
Object subclass: #Stack
	instanceVariableNames: 'elementos'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'StackPrimeraParte'!

!Stack methodsFor: 'removing' stamp: 'ln 10/7/2022 15:54:51'!
pop
	(elementos isEmpty) ifTrue: [
		^self error: self class noSePuedeAccederAUnStackVacioErrorDescription].
	^elementos removeLast.! !


!Stack methodsFor: 'accessing' stamp: 'ln 10/7/2022 14:36:14'!
isEmpty
	^elementos isEmpty.! !

!Stack methodsFor: 'accessing' stamp: 'ln 10/7/2022 15:55:00'!
top
	(elementos isEmpty) ifTrue: [
		^self error: self class noSePuedeAccederAUnStackVacioErrorDescription].
	^elementos last.! !


!Stack methodsFor: 'adding' stamp: 'ln 10/7/2022 14:35:31'!
push: aObject 
	elementos add: aObject.! !


!Stack methodsFor: 'initialize' stamp: 'ln 10/7/2022 14:35:26'!
initialize
	elementos := OrderedCollection new.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Stack class' category: 'StackPrimeraParte'!
Stack class
	instanceVariableNames: ''!

!Stack class methodsFor: 'error messages' stamp: 'ln 10/7/2022 15:35:31'!
noSePuedeAccederAUnStackVacioErrorDescription
	^'no se puede acceder a un stack vacio'.! !
