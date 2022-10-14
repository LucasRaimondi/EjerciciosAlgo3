!classDefinition: #OOStackTest category: 'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 18:00:02'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	stack := OOStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:59:57'!
test02PushAddElementsToTheStack

	| stack |
	stack := OOStack new.
	
	stack push: 'something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:59:50'!
test03PopRemovesElementsFromTheStack

	| stack |
	stack := OOStack new.
	stack push: 'something'.
	
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:59:43'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: pushedObject equals: stack pop! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:56:59'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	firstPushedObject := 'first'.
	secondPushedObject := 'second'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: secondPushedObject equals: stack pop.
	self assert: firstPushedObject equals: stack pop.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'ln 10/9/2022 14:25:10'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: pushedObject equals: stack top.
	! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:58:27'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: 1 equals: stack size.
	stack top.
	self assert: 1 equals: stack size.
	! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:58:44'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: OOStack stackEmptyErrorDescription equals: anError messageText ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:58:56'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: OOStack stackEmptyErrorDescription equals: anError messageText ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'JMB 10/8/2022 17:59:07'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: OOStack stackEmptyErrorDescription equals: anError messageText ]
		
! !


!classDefinition: #SentenceFinderByPrefixTest category: 'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: 'stack oracion1 oracion2 oracion3 oracion4 oraciones sentenceFinderByPrefix stackVacio prefijoInvalido coleccionVacia'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefixTest methodsFor: 'setUp' stamp: 'ln 10/13/2022 20:29:56'!
setUp
	stackVacio := OOStack new.
	stack := OOStack new.
	oracion1 := 'winter is coming'.
	oracion2 := 'winning is everything'.
	oracion3 := 'The winds of Winter'.
	oracion4 := 'Winter is here'.
	stack push: oracion1.
	stack push: oracion2.
	stack push: oracion3.
	stack push: oracion4.
	oraciones := OrderedCollection new.
	oraciones add: oracion1.
	oraciones add: oracion2.
	oraciones add: oracion3.
	oraciones add: oracion4.
	coleccionVacia := OrderedCollection new.
	sentenceFinderByPrefix := SentenceFinderByPrefix new.
	prefijoInvalido := 5.! !


!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'ln 10/13/2022 20:48:55'!
test01SiElPrefijoNoEsUnStringSeDevuelveUnError
		
	self should: [sentenceFinderByPrefix find: prefijoInvalido in: stack] raise: Error withExceptionDo: [ :anError |
		self assert: anError messageText = SentenceFinderByPrefix elPrefijoDebeSerUnStringErrorDescription.
		].! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'ln 10/13/2022 20:43:16'!
test02SiElPrefijoContieneEspaciosVaciosSeDevuelveUnError

	self should: [sentenceFinderByPrefix find: 'Wi nt' in: stack] raise: Error withExceptionDo: [ :anError |
		self assert: anError messageText = SentenceFinderByPrefix elPrefijoNoPuedeContenerEspaciosVaciosErrorDescription .
		].
	! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'ln 10/13/2022 20:44:52'!
test03SiElPrefijoEsVacioSeDevuelveUnError

	self should: [sentenceFinderByPrefix find: '' in: stack] raise: Error withExceptionDo: [ :anError |
		self assert: anError messageText = SentenceFinderByPrefix elPrefijoNoPuedeSerVacioErrorDescription .
		].
	! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'ln 10/13/2022 20:29:48'!
test04SiNoSeEncuentraNingunaPalabraSeDevuelveUnaColeccionVacia
	self assert: (sentenceFinderByPrefix find: 'hello' in: stack) equals: coleccionVacia.
	! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'ln 10/13/2022 20:50:11'!
test05SiElStackEstaVacioSeDevuelveUnaColeccionVacia
	self assert: (sentenceFinderByPrefix find: 'the' in: stackVacio) equals: coleccionVacia.! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'ln 10/13/2022 20:40:01'!
test06ElPrefijoEsCaseSensitive
	| oracionesEsperadas |
	
	oracionesEsperadas := OrderedCollection new.
	oracionesEsperadas add: oracion3.
	
	self assert: (sentenceFinderByPrefix find: 'the' in: stack) equals: coleccionVacia.
	self assert: (sentenceFinderByPrefix find: 'The' in: stack) equals: oracionesEsperadas.! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'ln 10/13/2022 20:51:26'!
test07SeDevuelvenCorrectamenteLasOracionesEsperadas
	| oracionesEsperadas |
	oracionesEsperadas := OrderedCollection new.
	oracionesEsperadas add: oracion4.
	self assert: (sentenceFinderByPrefix find: 'Wint' in: stack) equals: oracionesEsperadas.
	! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'ln 10/13/2022 20:51:44'!
test08ElStackNoSeraModificadoAlRealizarLaBusquedaDeUnPrefijo
	sentenceFinderByPrefix find: 'the' in: stack.
	self assert: (stack pop) equals: oracion4.
	self assert: (stack pop) equals: oracion3.
	self assert: (stack pop) equals: oracion2.
	self assert: (stack pop) equals: oracion1.! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'ln 10/14/2022 00:45:29'!
test09AlAgregarDosInstanciasIgualesDeOracionesSeDevuelvenAmbas
	| oracionesEncontradas |
	stack push: oracion4.
	oracionesEncontradas := sentenceFinderByPrefix find: 'Wint' in: stack.

	self assert: oracionesEncontradas size equals: 2.! !


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'tope tamaño limite'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'removing' stamp: 'ln 10/14/2022 00:40:46'!
pop
	| topAux |
	
	topAux := tope top.
	
	tope := tope anterior.
	tamaño := tamaño - 1.
	
	^topAux.! !


!OOStack methodsFor: 'initialize' stamp: 'MD 10/14/2022 15:27:46'!
initialize
	tope := Base new.
	tamaño := 0.! !


!OOStack methodsFor: 'adding' stamp: 'MD 10/14/2022 15:27:30'!
push: unElemento
	tope := Elemento with: unElemento andBefore: tope.
	
	tamaño := tamaño + 1. ! !


!OOStack methodsFor: 'accessing' stamp: 'ln 10/12/2022 12:44:52'!
isEmpty
	^tope isBase.! !

!OOStack methodsFor: 'accessing' stamp: 'ln 10/12/2022 12:30:47'!
size
	^tamaño.! !

!OOStack methodsFor: 'accessing' stamp: 'ln 10/12/2022 12:32:12'!
top
	^tope top.
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'ln 10/14/2022 00:13:31'!
elLimiteNoPuedeSerNegativoErrorDescription
	^'El limite no puede ser negativo'.! !

!OOStack class methodsFor: 'error descriptions' stamp: 'ln 10/14/2022 00:13:35'!
seHaAlcanzadoElLimiteDeElementosErrorDescription
	^'Se ha alcanzado el limite de elementos'.! !

!OOStack class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2012 11:51'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !


!OOStack class methodsFor: 'initialize' stamp: 'ln 10/13/2022 23:21:52'!
with: unLimite
	^self new initializeWith: unLimite! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: 'espacioVacio'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'validaciones' stamp: 'ln 10/13/2022 20:32:47'!
validarPrefijo: aPrefix	

	(aPrefix isString not) ifTrue: [
		self error: self class elPrefijoDebeSerUnStringErrorDescription.
		].
	
	(aPrefix isEmpty) ifTrue: [
		self error: self class elPrefijoNoPuedeSerVacioErrorDescription].
	
	(aPrefix includesSubString: espacioVacio) ifTrue: [
		self error: self class elPrefijoNoPuedeContenerEspaciosVaciosErrorDescription.
		].! !


!SentenceFinderByPrefix methodsFor: 'initialize' stamp: 'ln 10/13/2022 18:35:10'!
initialize
	espacioVacio := ' '.! !


!SentenceFinderByPrefix methodsFor: 'enumerating' stamp: 'ln 10/13/2022 20:35:39'!
buscarOracionesCon: aPrefix en: aStack
	
	| stackAuxiliar elemento sentencesWithPrefix |
	
	sentencesWithPrefix := OrderedCollection new.
	stackAuxiliar := OOStack new.
	
	[aStack isEmpty not] whileTrue: [
		elemento := aStack pop.
		(elemento beginsWith: aPrefix) ifTrue: [
			sentencesWithPrefix add: elemento].
		stackAuxiliar push: elemento.
		].
	
	[stackAuxiliar isEmpty not] whileTrue: [
		aStack push: stackAuxiliar pop].
	
	^sentencesWithPrefix.! !

!SentenceFinderByPrefix methodsFor: 'enumerating' stamp: 'ln 10/13/2022 20:35:15'!
find: aPrefix in: aStack
	
	self validarPrefijo: aPrefix.
	
	^self buscarOracionesCon: aPrefix en: aStack.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefix class' category: 'Stack-Exercise'!
SentenceFinderByPrefix class
	instanceVariableNames: ''!

!SentenceFinderByPrefix class methodsFor: 'error descriptions' stamp: 'ln 10/13/2022 19:55:56'!
elPrefijoDebeSerUnStringErrorDescription
	^'el prefijo debe ser un string'.! !

!SentenceFinderByPrefix class methodsFor: 'error descriptions' stamp: 'ln 10/13/2022 19:56:16'!
elPrefijoNoPuedeContenerEspaciosVaciosErrorDescription
	^'El prefijo no puede contener espacios vacios'.! !

!SentenceFinderByPrefix class methodsFor: 'error descriptions' stamp: 'ln 10/13/2022 19:16:04'!
elPrefijoNoPuedeSerVacioErrorDescription
	^'El prefijo no puede ser vacio'.! !


!classDefinition: #Tope category: 'Stack-Exercise'!
Object subclass: #Tope
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!Tope methodsFor: 'testing' stamp: 'ln 10/12/2022 12:57:57'!
isBase
	self subclassResponsibility.! !


!Tope methodsFor: 'accessing' stamp: 'ln 10/12/2022 12:58:00'!
anterior
	self subclassResponsibility.! !

!Tope methodsFor: 'accessing' stamp: 'ln 10/12/2022 12:57:31'!
top
	self subclassResponsibility.! !


!classDefinition: #Base category: 'Stack-Exercise'!
Tope subclass: #Base
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!Base methodsFor: 'testing' stamp: 'ln 10/12/2022 12:45:27'!
isBase
	^true.! !


!Base methodsFor: 'accessing' stamp: 'ln 10/12/2022 12:53:08'!
anterior
	^self.! !

!Base methodsFor: 'accessing' stamp: 'ln 10/12/2022 12:34:52'!
top
	^self error: OOStack stackEmptyErrorDescription.! !


!classDefinition: #Elemento category: 'Stack-Exercise'!
Tope subclass: #Elemento
	instanceVariableNames: 'value anterior'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!Elemento methodsFor: 'testing' stamp: 'ln 10/12/2022 12:45:32'!
isBase
	^false.! !


!Elemento methodsFor: 'accessing' stamp: 'ln 10/12/2022 12:47:37'!
anterior
	^anterior.! !

!Elemento methodsFor: 'accessing' stamp: 'ln 10/12/2022 12:52:21'!
top
	^value.! !


!Elemento methodsFor: 'initialize' stamp: 'ln 10/12/2022 12:36:43'!
initializeWith: unElemento ySu: elementoAnterior
	value := unElemento.
	anterior := elementoAnterior.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Elemento class' category: 'Stack-Exercise'!
Elemento class
	instanceVariableNames: ''!

!Elemento class methodsFor: 'initialize' stamp: 'ln 10/12/2022 12:37:04'!
with: unElemento andBefore: elementoAnterior

	^self new initializeWith: unElemento ySu: elementoAnterior.	! !
