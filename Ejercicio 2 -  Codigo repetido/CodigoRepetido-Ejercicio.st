!classDefinition: #CantSuspend category: 'CodigoRepetido-Ejercicio'!
Error subclass: #CantSuspend
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #NotFound category: 'CodigoRepetido-Ejercicio'!
Error subclass: #NotFound
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #CustomerBookTest category: 'CodigoRepetido-Ejercicio'!
TestCase subclass: #CustomerBookTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBookTest methodsFor: 'testing' stamp: 'LR 9/24/2022 20:30:18'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds

	| methodToValidate customerBook |

	customerBook := CustomerBook new.
	methodToValidate := [customerBook addCustomerNamed: 'John Lennon'].
	
	self assertExecutionTimeOf: methodToValidate lessThan: (50*millisecond).
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'LR 9/24/2022 20:30:27'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

	| customerBook methodToValidate paulMcCartney |
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	customerBook addCustomerNamed: 'Paul McCartney'.
	  
	methodToValidate := [customerBook removeCustomerNamed: paulMcCartney].
	
	self assertExecutionTimeOf: methodToValidate lessThan: (100*millisecond).

	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'LR 9/24/2022 19:11:09'!
test03CanNotAddACustomerWithEmptyName 

	| customerBook addEmptyCustomer |
			
	customerBook := CustomerBook new.
	addEmptyCustomer := [ customerBook addCustomerNamed: ''.self fail ].
	
	self should: addEmptyCustomer raise: Error withExceptionDo: [ :anError | 
			self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage.
			self assert: customerBook isEmpty ].! !

!CustomerBookTest methodsFor: 'testing' stamp: 'LR 9/24/2022 19:08:14'!
test04CanNotRemoveAnInvalidCustomer
	
	| customerBook johnLennon removePaulMcCartney |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	removePaulMcCartney := [ customerBook removeCustomerNamed: 'Paul McCartney'.self fail ].
	
	self should: removePaulMcCartney raise: NotFound withExceptionDo: [ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: johnLennon) ].! !

!CustomerBookTest methodsFor: 'testing' stamp: 'LR 9/24/2022 20:12:09'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	customerBook addCustomerNamed: paulMcCartney.
	customerBook suspendCustomerNamed: paulMcCartney.
	
	self assertCustomers: customerBook numberOfActive: 0 numberOfSuspended: 1.

	self assert: (customerBook includesCustomerNamed: paulMcCartney).
	

	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'LR 9/24/2022 20:11:18'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	customerBook addCustomerNamed: paulMcCartney.
	customerBook suspendCustomerNamed: paulMcCartney.
	customerBook removeCustomerNamed: paulMcCartney.
	
	self assertCustomers: customerBook numberOfActive: 0 numberOfSuspended: 0.
	self deny: (customerBook includesCustomerNamed: paulMcCartney).


	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'LR 9/24/2022 19:13:21'!
test07CanNotSuspendAnInvalidCustomer
	
	| customerBook johnLennon suspendCustomer |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	suspendCustomer := [ customerBook suspendCustomerNamed: 'Ringo Starr'.self fail ].
	
	self should: suspendCustomer raise: CantSuspend withExceptionDo: [ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: johnLennon) ].! !

!CustomerBookTest methodsFor: 'testing' stamp: 'LR 9/24/2022 19:23:05'!
test08CanNotSuspendAnAlreadySuspendedCustomer
	
	| customerBook johnLennon suspendCustomer |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	customerBook suspendCustomerNamed: johnLennon.
	suspendCustomer := [ customerBook suspendCustomerNamed: johnLennon. self fail ].
	
	self should: suspendCustomer raise: CantSuspend withExceptionDo: [ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: johnLennon) ].
! !


!CustomerBookTest methodsFor: 'assertions' stamp: 'LR 9/24/2022 20:11:18'!
assertCustomers: customerBook numberOfActive: aCantActive numberOfSuspended: aCantSuspended
	self assert: aCantActive equals: customerBook numberOfActiveCustomers.
	self assert: aCantSuspended equals: customerBook numberOfSuspendedCustomers.
	self assert: aCantActive + aCantSuspended equals: customerBook numberOfCustomers.! !

!CustomerBookTest methodsFor: 'assertions' stamp: 'LR 9/26/2022 20:10:12'!
assertExecutionTimeOf: aMethod lessThan: aTimeMilliseconds

	self assert: (aMethod millisecondsToRun) < (aTimeMilliseconds)! !


!classDefinition: #CustomerBook category: 'CodigoRepetido-Ejercicio'!
Object subclass: #CustomerBook
	instanceVariableNames: 'suspended active'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
includesCustomerNamed: aName

	^(active includes: aName) or: [ suspended includes: aName ]! !

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
isEmpty
	
	^active isEmpty and: [ suspended isEmpty ]! !


!CustomerBook methodsFor: 'initialization' stamp: 'NR 4/3/2019 10:14:26'!
initialize

	super initialize.
	active := OrderedCollection new.
	suspended:= OrderedCollection new.! !


!CustomerBook methodsFor: 'customer management' stamp: 'MJDS 9/24/2022 17:50:34'!
addCustomerNamed: aName

	aName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].
	(self includesCustomerNamed: aName) ifTrue: [ self signalCustomerAlreadyExists ].
	
	active add: aName ! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
numberOfActiveCustomers
	
	^active size! !

!CustomerBook methodsFor: 'customer management' stamp: 'LR 9/24/2022 18:18:49'!
numberOfCustomers
	
	^self numberOfActiveCustomers + self numberOfSuspendedCustomers.! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 9/19/2018 17:36:09'!
numberOfSuspendedCustomers
	
	^suspended size! !

!CustomerBook methodsFor: 'customer management' stamp: 'MJDS 9/24/2022 17:48:47'!
removeCustomerNamed: aName 
 
	active remove: aName ifAbsent: [
		suspended remove: aName ifAbsent: [^ NotFound signal.]
	].

	
! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:52'!
signalCustomerAlreadyExists 

	self error: self class customerAlreadyExistsErrorMessage! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:51'!
signalCustomerNameCannotBeEmpty 

	self error: self class customerCanNotBeEmptyErrorMessage ! !

!CustomerBook methodsFor: 'customer management' stamp: 'MJDS 9/24/2022 17:54:14'!
suspendCustomerNamed: aName 
	
	active remove: aName ifAbsent:  [^CantSuspend signal].
	
	suspended add: aName.
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerBook class' category: 'CodigoRepetido-Ejercicio'!
CustomerBook class
	instanceVariableNames: ''!

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/30/2020 09:05:18'!
customerAlreadyExistsErrorMessage

	^'Customer Already Exists'! !

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/30/2020 09:05:25'!
customerCanNotBeEmptyErrorMessage

	^'Customer Name Cannot Be Empty'! !
