!classDefinition: #NumeroTest category: 'Numeros-Parte2-Ejercicio'!
TestCase subclass: #NumeroTest
	instanceVariableNames: 'zero one two four oneFifth oneHalf five twoFifth twoTwentyfifth fiveHalfs three eight negativeOne negativeTwo'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!NumeroTest methodsFor: 'tests' stamp: 'LL 9/13/2020 16:17:50'!
test01isZeroReturnsTrueWhenAskToZero

	self assert: zero isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'LL 9/13/2020 16:17:58'!
test02isZeroReturnsFalseWhenAskToOthersButZero

	self deny: one isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:13'!
test03isOneReturnsTrueWhenAskToOne

	self assert: one isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:13'!
test04isOneReturnsFalseWhenAskToOtherThanOne

	self deny: zero isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:39:57'!
test05EnteroAddsWithEnteroCorrectly

	self assert: two equals: one + one! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:40:10'!
test06EnteroMultipliesWithEnteroCorrectly

	self assert: four equals: two * two! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:40:22'!
test07EnteroDividesEnteroCorrectly

	self assert: one equals: two / two! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:40:57'!
test08FraccionAddsWithFraccionCorrectly
"
    La suma de fracciones es:
	 
	a/b + c/d = (a.d + c.b) / (b.d)
	 
	SI ESTAN PENSANDO EN LA REDUCCION DE FRACCIONES NO SE PREOCUPEN!!
	TODAVIA NO SE ESTA TESTEANDO ESE CASO
"
	| sevenTenths |

	sevenTenths := (Entero with: 7) / (Entero with: 10).

	self assert: sevenTenths equals: oneFifth + oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:41:20'!
test09FraccionMultipliesWithFraccionCorrectly
"
    La multiplicacion de fracciones es:
	 
	(a/b) * (c/d) = (a.c) / (b.d)
"

	self assert: twoTwentyfifth equals: oneFifth * twoFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:41:34'!
test10FraccionDividesFraccionCorrectly
"
    La division de fracciones es:
	 
	(a/b) / (c/d) = (a.d) / (b.c)
"

	self assert: fiveHalfs equals: oneHalf / oneFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:41:58'!
test11EnteroAddsFraccionCorrectly
"
	Ahora empieza la diversion!!
"

	self assert: (Entero with: 6) / (Entero with: 5) equals: one + oneFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:42:29'!
test12FraccionAddsEnteroCorrectly

	self assert: (Entero with: 6) / (Entero with: 5) equals: oneFifth + one! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:43:16'!
test13EnteroMultipliesFraccionCorrectly

	self assert: twoFifth equals: two * oneFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:43:27'!
test14FraccionMultipliesEnteroCorrectly

	self assert: twoFifth equals: oneFifth * two! !

!NumeroTest methodsFor: 'tests' stamp: 'ln 9/28/2022 23:31:58'!
test15EnteroDividesFraccionCorrectly

	self assert: fiveHalfs equals: one / twoFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:43:58'!
test16FraccionDividesEnteroCorrectly

	self assert: twoTwentyfifth equals: twoFifth / five! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:38'!
test17AFraccionCanBeEqualToAnEntero

	self assert: two equals: four / two! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:39'!
test18AparentFraccionesAreEqual

	self assert: oneHalf equals: two / four! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:44:53'!
test19AddingFraccionesCanReturnAnEntero

	self assert: one equals: oneHalf + oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:45:13'!
test20MultiplyingFraccionesCanReturnAnEntero

	self assert: one equals: (two/five) * (five/two)! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:45:27'!
test21DividingFraccionesCanReturnAnEntero

	self assert: one equals: oneHalf / oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:45:40'!
test22DividingEnterosCanReturnAFraccion

	self assert: oneHalf equals: two / four! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:50:17'!
test23CanNotDivideEnteroByZero

	self 
		should: [ one / zero ]
		raise: Error
		withExceptionDo: [ :anError | self assert: Numero canNotDivideByZeroErrorDescription equals: anError messageText ]
	! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:50:32'!
test24CanNotDivideFraccionByZero

	self 
		should: [ oneHalf / zero ]
		raise: Error
		withExceptionDo: [ :anError | self assert: Numero canNotDivideByZeroErrorDescription equals: anError messageText ]
	! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:50'!
test25AFraccionCanNotBeZero

	self deny: oneHalf isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:50'!
test26AFraccionCanNotBeOne

	self deny: oneHalf isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:46:21'!
test27EnteroSubstractsEnteroCorrectly

	self assert: two equals: three - one! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:46:36'!
test28FraccionSubstractsFraccionCorrectly
	
	self assert: oneFifth equals: twoFifth - oneFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:46:50'!
test29EnteroSubstractsFraccionCorrectly

	self assert: oneHalf equals: one - oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:47:11'!
test30FraccionSubstractsEnteroCorrectly

	| sixFifth |
	
	sixFifth := (Entero with: 6) / (Entero with: 5).
	
	self assert: oneFifth equals: sixFifth - one! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:47:25'!
test31SubstractingFraccionesCanReturnAnEntero

	| threeHalfs |
	
	threeHalfs := (Entero with: 3) / (Entero with: 2).
	
	self assert: one equals: threeHalfs - oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:47:44'!
test32SubstractingSameEnterosReturnsZero

	self assert: zero equals: one - one! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:47:59'!
test33SubstractingSameFraccionesReturnsZero

	self assert: zero equals: oneHalf - oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:48:16'!
test34SubstractingAHigherValueToANumberReturnsANegativeNumber

	| negativeThreeHalfs |
	
	negativeThreeHalfs := (Entero with: -3) / (Entero with: 2).	

	self assert: negativeThreeHalfs equals: one - fiveHalfs! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:48:45'!
test35FibonacciZeroIsOne

	self assert: one equals: zero fibonacci! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:48:58'!
test36FibonacciOneIsOne

	self assert: one equals: one fibonacci! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:52:24'!
test37FibonacciEnteroReturnsAddingPreviousTwoFibonacciEnteros

	self assert: five equals: four fibonacci.
	self assert: three equals: three fibonacci. 
	self assert: five fibonacci equals: four fibonacci + three fibonacci! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:52:40'!
test38FibonacciNotDefinedForNegativeNumbers

	self 
		should: [negativeOne fibonacci]
		raise: Error
		withExceptionDo: [ :anError | self assert: Entero negativeFibonacciErrorDescription equals: anError messageText ]! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:52:17'!
test39NegationOfEnteroIsCorrect

	self assert: negativeTwo equals: two negated
		! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:53:27'!
test40NegationOfFraccionIsCorrect

	self assert: negativeOne / two equals: oneHalf negated ! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:50:11'!
test41SignIsCorrectlyAssignedToFractionWithTwoNegatives

	self assert: oneHalf equals: (negativeOne / negativeTwo)! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:50:17'!
test42SignIsCorrectlyAssignedToFractionWithNegativeDivisor

	self assert: oneHalf negated equals: (one / negativeTwo)! !


!NumeroTest methodsFor: 'setup' stamp: 'MJDS 10/4/2022 12:30:09'!
setUp

	zero := Entero with: 0.
	one := Entero with: 1.
	two := Entero with: 2.
	three:= Entero with: 3.
	four := Entero with: 4.
	five := Entero with: 5.
	eight := Entero with: 8.
	negativeOne := Entero with: -1.
	negativeTwo := Entero with: -2.
	
	oneHalf := one / two.
	oneFifth := one / five.
	twoFifth := two / five.
	twoTwentyfifth := two / (Entero with: 25).
	fiveHalfs := five / two.
	! !


!classDefinition: #Numero category: 'Numeros-Parte2-Ejercicio'!
Object subclass: #Numero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:48'!
* aMultiplier

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:49'!
+ anAdder

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'NR 9/23/2018 22:21:28'!
- aSubtrahend

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:49'!
/ aDivisor

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'NR 9/23/2018 23:37:13'!
negated
	
	^self * (Entero with: -1)! !


!Numero methodsFor: 'testing' stamp: 'NR 9/23/2018 23:36:49'!
isNegative

	self subclassResponsibility ! !

!Numero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:49'!
isOne

	self subclassResponsibility ! !

!Numero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:49'!
isZero

	self subclassResponsibility ! !


!Numero methodsFor: 'private - error' stamp: 'HernanWilkinson 5/7/2016 22:48'!
invalidNumberType

	self error: self class invalidNumberTypeErrorDescription! !


!Numero methodsFor: 'private - dd' stamp: 'ln 10/4/2022 15:08:35'!
dividirA: unDividendo
	self subclassResponsibility .! !

!Numero methodsFor: 'private - dd' stamp: 'ln 10/4/2022 15:07:39'!
dividirALaFraccion: unaFraccion
	self subclassResponsibility .! !

!Numero methodsFor: 'private - dd' stamp: 'ln 10/4/2022 15:07:26'!
dividirAlEntero: unEntero
	self subclassResponsibility .! !

!Numero methodsFor: 'private - dd' stamp: 'ln 10/4/2022 15:08:19'!
dividirPor: unDivisor
	self subclassResponsibility .! !

!Numero methodsFor: 'private - dd' stamp: 'ln 10/3/2022 20:13:24'!
multiplicarEntero: unEntero
	self subclassResponsibility .! !

!Numero methodsFor: 'private - dd' stamp: 'ln 10/3/2022 20:13:15'!
multiplicarFraccion: unaFraccion
	self subclassResponsibility .! !

!Numero methodsFor: 'private - dd' stamp: 'ln 10/4/2022 15:07:04'!
restarseALaFraccion: unaFraccion
	self subclassResponsibility .! !

!Numero methodsFor: 'private - dd' stamp: 'ln 10/4/2022 15:06:25'!
restarseAlEntero: unEntero
	self subclassResponsibility .! !

!Numero methodsFor: 'private - dd' stamp: 'rt 9/30/2022 16:12:04'!
sumarEntero: unEntero
	self subclassResponsibility .! !

!Numero methodsFor: 'private - dd' stamp: 'rt 9/30/2022 16:12:44'!
sumarFraccion: unaFraccion
	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Numero class' category: 'Numeros-Parte2-Ejercicio'!
Numero class
	instanceVariableNames: ''!

!Numero class methodsFor: 'error descriptions' stamp: 'NR 5/7/2020 17:47:38'!
canNotDivideByZeroErrorDescription

	^'No se puede Dividir por Cero'! !

!Numero class methodsFor: 'error descriptions' stamp: 'NR 5/7/2020 17:46:56'!
invalidNumberTypeErrorDescription
	^ 'Tipo de Número Inválido'! !


!classDefinition: #Entero category: 'Numeros-Parte2-Ejercicio'!
Numero subclass: #Entero
	instanceVariableNames: 'value fibonacci'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Entero methodsFor: 'arithmetic operations' stamp: 'ln 10/1/2022 11:27:24'!
* aMultiplier 
	^aMultiplier multiplicarEntero: self.! !

!Entero methodsFor: 'arithmetic operations' stamp: 'rt 9/30/2022 15:03:01'!
+ anAdder 
	^anAdder sumarEntero: self.! !

!Entero methodsFor: 'arithmetic operations' stamp: 'ln 10/4/2022 14:53:18'!
- aSubtrahend 
	^aSubtrahend restarseAlEntero: self.! !

!Entero methodsFor: 'arithmetic operations' stamp: 'ln 10/4/2022 14:53:25'!
/ aDivisor 
	^aDivisor dividirAlEntero: self.! !

!Entero methodsFor: 'arithmetic operations' stamp: 'MJDS 10/4/2022 09:39:13'!
fibonacci
	self subclassResponsibility.
		! !


!Entero methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 21:01'!
= anObject

	^(anObject isKindOf: self class) and: [ value = anObject integerValue ]! !

!Entero methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:17'!
hash

	^value hash! !


!Entero methodsFor: 'initialization' stamp: 'MJDS 10/4/2022 09:40:00'!
initializeWith: aValue 
	self subclassResponsibility .! !


!Entero methodsFor: 'accessing' stamp: 'HernanWilkinson 5/7/2016 21:02'!
integerValue

	"Usamos integerValue en vez de value para que no haya problemas con el mensaje value implementado en Object - Hernan"
	
	^value! !


!Entero methodsFor: 'printing' stamp: 'HAW 9/24/2018 08:53:19'!
printOn: aStream

	aStream print: value ! !


!Entero methodsFor: 'testing' stamp: 'NR 9/23/2018 22:17:55'!
isNegative
	
	^value < 0! !

!Entero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 20:14'!
isOne
	
	^value = 1! !

!Entero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 20:12'!
isZero
	
	^value = 0! !


!Entero methodsFor: 'arithmetic operations - private' stamp: 'MJDS 10/4/2022 11:26:02'!
// aDivisor 
	
	^Entero with: value // aDivisor integerValue! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'MJDS 10/4/2022 11:24:56'!
greatestCommonDivisorWith: anEntero 
	
	^Entero with: (value gcd: anEntero integerValue)! !


!Entero methodsFor: 'private - dd' stamp: 'MJDS 10/4/2022 12:21:58'!
dividirA: unDividendo
	self subclassResponsibility .! !

!Entero methodsFor: 'private - dd' stamp: 'ln 10/4/2022 14:52:03'!
dividirALaFraccion: aDividend
	^Fraccion with: aDividend numerator over: (aDividend denominator * self).! !

!Entero methodsFor: 'private - dd' stamp: 'ln 10/4/2022 14:52:11'!
dividirAlEntero: aDividend
	^Fraccion with: aDividend over: self.! !

!Entero methodsFor: 'private - dd' stamp: 'MJDS 10/4/2022 09:50:08'!
dividirPor: unDivisor
	self subclassResponsibility .! !

!Entero methodsFor: 'private - dd' stamp: 'ln 10/4/2022 15:03:28'!
multiplicarEntero: multiplicand
	^Entero with: self integerValue * multiplicand integerValue.
	! !

!Entero methodsFor: 'private - dd' stamp: 'ln 10/4/2022 14:52:26'!
multiplicarFraccion: multiplicand
	
	^(multiplicand numerator * self) / (multiplicand denominator).! !

!Entero methodsFor: 'private - dd' stamp: 'ln 10/4/2022 14:52:33'!
restarseALaFraccion: aMinuend
	| newDenominator newNumerator |
	newNumerator := aMinuend numerator - (self * aMinuend denominator).
	newDenominator := aMinuend denominator.
	^newNumerator / newDenominator. ! !

!Entero methodsFor: 'private - dd' stamp: 'ln 10/4/2022 15:04:07'!
restarseAlEntero: aMinuend
	^ Entero with: aMinuend integerValue - self integerValue.! !

!Entero methodsFor: 'private - dd' stamp: 'ln 10/4/2022 15:01:23'!
sumarEntero: anAddend
	^Entero with: self integerValue + anAddend integerValue.! !

!Entero methodsFor: 'private - dd' stamp: 'ln 10/4/2022 14:53:03'!
sumarFraccion: anAddend

	| newDenominator newNumerator |
	newNumerator := (self * anAddend denominator) + (anAddend numerator).
	newDenominator := anAddend denominator.
	^newNumerator / newDenominator. ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Entero class' category: 'Numeros-Parte2-Ejercicio'!
Entero class
	instanceVariableNames: ''!

!Entero class methodsFor: 'instance creation' stamp: 'MJDS 10/4/2022 10:54:12'!
with: aValue
	^(self subclasses detect: [:aSubclass | aSubclass isFibonacciType: aValue]) new initializeWith: aValue.! !


!Entero class methodsFor: 'private' stamp: 'MJDS 10/4/2022 15:27:33'!
isFibonacciType: aValue
	self subclassResponsibility.! !


!Entero class methodsFor: 'private - error' stamp: 'NR 4/8/2019 02:57:57'!
negativeFibonacciErrorDescription
	^ ' Fibonacci no está definido aquí para Enteros Negativos'! !


!classDefinition: #EnteroNegativo category: 'Numeros-Parte2-Ejercicio'!
Entero subclass: #EnteroNegativo
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!EnteroNegativo methodsFor: 'accessing' stamp: 'MJDS 10/4/2022 11:50:22'!
fibonacci
	self error: Entero negativeFibonacciErrorDescription.! !


!EnteroNegativo methodsFor: 'initialization' stamp: 'MJDS 10/4/2022 09:32:42'!
initializeWith: aValue 
	value := aValue.! !


!EnteroNegativo methodsFor: 'private - arithmetic operations' stamp: 'MJDS 10/4/2022 12:21:35'!
dividirA: unDividendo
	^unDividendo negated / self negated.! !

!EnteroNegativo methodsFor: 'private - arithmetic operations' stamp: 'MJDS 10/4/2022 12:40:04'!
dividirPor: unDivisor
	^unDivisor dividirA: self.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EnteroNegativo class' category: 'Numeros-Parte2-Ejercicio'!
EnteroNegativo class
	instanceVariableNames: ''!

!EnteroNegativo class methodsFor: 'instance creation' stamp: 'MJDS 10/2/2022 18:04:21'!
isFibonacciType: aValue
	^ aValue < 0.! !


!classDefinition: #EnteroOne category: 'Numeros-Parte2-Ejercicio'!
Entero subclass: #EnteroOne
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!EnteroOne methodsFor: 'accessing' stamp: 'MJDS 10/4/2022 11:50:30'!
fibonacci
	^Entero with: 1.! !


!EnteroOne methodsFor: 'initialization' stamp: 'MJDS 10/4/2022 09:32:50'!
initializeWith: aValue 
	value := aValue.! !


!EnteroOne methodsFor: 'private - arithmetic operations' stamp: 'MJDS 10/4/2022 12:20:42'!
dividirA: unDividendo
	^unDividendo.
	! !

!EnteroOne methodsFor: 'private - arithmetic operations' stamp: 'MJDS 10/4/2022 09:53:28'!
dividirPor: unDivisor
	^unDivisor dividirA: self.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EnteroOne class' category: 'Numeros-Parte2-Ejercicio'!
EnteroOne class
	instanceVariableNames: ''!

!EnteroOne class methodsFor: 'instance creation' stamp: 'MJDS 10/4/2022 10:55:14'!
isFibonacciType: aValue
	^ aValue = 1! !


!classDefinition: #EnteroPositivo category: 'Numeros-Parte2-Ejercicio'!
Entero subclass: #EnteroPositivo
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!EnteroPositivo methodsFor: 'accessing' stamp: 'MJDS 10/4/2022 11:51:02'!
fibonacci
	
	| one two |
	
	one := Entero with: 1.
	two := Entero with: 2.
	
	^ (self - one) fibonacci + (self - two) fibonacci! !


!EnteroPositivo methodsFor: 'initialization' stamp: 'MJDS 10/4/2022 09:32:54'!
initializeWith: aValue 
	value := aValue.! !


!EnteroPositivo methodsFor: 'private - arithmetic operations' stamp: 'MJDS 10/4/2022 12:25:44'!
dividirA: unDividendo
| denominator greatestCommonDivisor numerator |
	
	greatestCommonDivisor := unDividendo greatestCommonDivisorWith: self. 
	numerator := unDividendo // greatestCommonDivisor.
	denominator := self // greatestCommonDivisor.
	
	denominator isOne ifTrue: [ ^numerator ].

	^Fraccion withNumerador: numerator yDenominador: denominator.! !

!EnteroPositivo methodsFor: 'private - arithmetic operations' stamp: 'MJDS 10/4/2022 09:52:46'!
dividirPor: unDivisor
	^unDivisor dividirA: self.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EnteroPositivo class' category: 'Numeros-Parte2-Ejercicio'!
EnteroPositivo class
	instanceVariableNames: ''!

!EnteroPositivo class methodsFor: 'instance creation' stamp: 'MJDS 10/2/2022 18:04:37'!
isFibonacciType: aValue
	^ aValue > 1.! !


!classDefinition: #EnteroZero category: 'Numeros-Parte2-Ejercicio'!
Entero subclass: #EnteroZero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!EnteroZero methodsFor: 'accessing' stamp: 'MJDS 10/4/2022 11:51:09'!
fibonacci
	^Entero with: 1.! !


!EnteroZero methodsFor: 'initialization' stamp: 'MJDS 10/4/2022 09:33:02'!
initializeWith: aValue 
	value := aValue.! !


!EnteroZero methodsFor: 'private - arithmetic operations' stamp: 'MJDS 10/4/2022 12:20:09'!
dividirA: unDividendo
	^self error: Entero canNotDivideByZeroErrorDescription.! !

!EnteroZero methodsFor: 'private - arithmetic operations' stamp: 'MJDS 10/4/2022 12:35:50'!
dividirPor: unDivisor
	^Entero with: 0.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EnteroZero class' category: 'Numeros-Parte2-Ejercicio'!
EnteroZero class
	instanceVariableNames: ''!

!EnteroZero class methodsFor: 'instance creation' stamp: 'MJDS 10/4/2022 10:55:04'!
isFibonacciType: aValue
	^ aValue = 0.! !


!classDefinition: #Fraccion category: 'Numeros-Parte2-Ejercicio'!
Numero subclass: #Fraccion
	instanceVariableNames: 'numerator denominator'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Fraccion methodsFor: 'arithmetic operations' stamp: 'ln 10/1/2022 11:18:28'!
* aMultiplier 
	^aMultiplier multiplicarFraccion: self.! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'rt 9/30/2022 16:04:55'!
+ anAdder 
	^anAdder sumarFraccion: self.! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'ln 10/4/2022 14:49:42'!
- aSubtrahend 
	^aSubtrahend restarseALaFraccion: self.
! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'ln 10/4/2022 14:46:38'!
/ aDivisor 
	^aDivisor dividirALaFraccion: self
! !


!Fraccion methodsFor: 'comparing' stamp: 'ln 9/29/2022 00:04:05'!
= anObject

	^(anObject isKindOf: self class) and: [ (numerator * anObject denominator) = (denominator * anObject numerator) ]! !

!Fraccion methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:50'!
hash

	^(numerator hash / denominator hash) hash! !


!Fraccion methodsFor: 'accessing' stamp: 'HernanWilkinson 5/7/2016 21:56'!
denominator

	^ denominator! !

!Fraccion methodsFor: 'accessing' stamp: 'HernanWilkinson 5/7/2016 21:56'!
numerator

	^ numerator! !


!Fraccion methodsFor: 'initialization' stamp: 'ln 9/28/2022 23:59:54'!
initializeWith: aNumerator over: aDenominator

	"Estas precondiciones estan por si se comenten errores en la implementacion - Hernan"
	aNumerator isZero ifTrue: [ self error: 'una fraccion no puede ser cero' ].
	aDenominator isOne ifTrue: [ self error: 'una fraccion no puede tener denominador 1 porque sino es un entero' ].
	
	((aNumerator greatestCommonDivisorWith: aDenominator) = aDenominator) ifTrue: [
		^Entero with: (aNumerator // aDenominator)].
	numerator := aNumerator.
	denominator := aDenominator ! !


!Fraccion methodsFor: 'testing' stamp: 'NR 9/23/2018 23:41:38'!
isNegative
	
	^numerator < 0! !

!Fraccion methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:51'!
isOne
	
	^false! !

!Fraccion methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:51'!
isZero
	
	^false! !


!Fraccion methodsFor: 'printing' stamp: 'HAW 9/24/2018 08:54:46'!
printOn: aStream

	aStream 
		print: numerator;
		nextPut: $/;
		print: denominator ! !


!Fraccion methodsFor: 'private - dd' stamp: 'ln 10/4/2022 14:47:15'!
dividirALaFraccion: aDividend
	^ (self denominator * aDividend numerator) / (self numerator * aDividend denominator)! !

!Fraccion methodsFor: 'private - dd' stamp: 'ln 10/4/2022 14:47:46'!
dividirAlEntero: aDividend
	^Fraccion with: (self denominator * aDividend) over: self numerator.
! !

!Fraccion methodsFor: 'private - dd' stamp: 'ln 10/4/2022 14:48:35'!
multiplicarEntero: aMultiplicand
	^aMultiplicand multiplicarFraccion: self.! !

!Fraccion methodsFor: 'private - dd' stamp: 'ln 10/4/2022 14:48:45'!
multiplicarFraccion: aMultiplicand
	^(self numerator * aMultiplicand  numerator) / (self denominator * aMultiplicand denominator).
	! !

!Fraccion methodsFor: 'private - dd' stamp: 'ln 10/4/2022 14:49:10'!
restarseALaFraccion: aMinuend
	| newDenominator newNumerator |
	newNumerator := (aMinuend numerator * self denominator) - (self numerator * aMinuend denominator).
	newDenominator := self denominator * aMinuend denominator.
	
	^newNumerator / newDenominator 
! !

!Fraccion methodsFor: 'private - dd' stamp: 'ln 10/4/2022 14:49:25'!
restarseAlEntero: aMinuend
	
	| newNumerator newDenominator |
	
	newNumerator := (self denominator * aMinuend ) - (self numerator).
	newDenominator := self denominator.
	^newNumerator / newDenominator. ! !

!Fraccion methodsFor: 'private - dd' stamp: 'ln 10/4/2022 14:50:53'!
sumarEntero: anAddend
	^anAddend sumarFraccion: self.! !

!Fraccion methodsFor: 'private - dd' stamp: 'ln 10/4/2022 14:51:02'!
sumarFraccion: anAddend
	| newNumerator newDenominator |

	newNumerator := (self numerator * anAddend denominator) + (self denominator * anAddend numerator).
	newDenominator := self denominator * anAddend denominator.
	
	^newNumerator / newDenominator ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Fraccion class' category: 'Numeros-Parte2-Ejercicio'!
Fraccion class
	instanceVariableNames: ''!

!Fraccion class methodsFor: 'intance creation' stamp: 'MJDS 10/4/2022 15:31:35'!
with: aDividend over: aDivisor
	
	^aDividend dividirPor: aDivisor.! !

!Fraccion class methodsFor: 'intance creation' stamp: 'MJDS 10/4/2022 15:31:15'!
withNumerador: unDividendo yDenominador: unDivisor

	^self new initializeWith: unDividendo over: unDivisor! !
