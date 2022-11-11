!classDefinition: #PortfolioTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!PortfolioTest methodsFor: 'testing' stamp: 'ln 11/11/2022 13:00:59'!
test01CrearUnPortfolioVacioTieneBalanceCero
	| portfolio |
	portfolio := Portfolio new.	
	
	self assert: 0 equals: portfolio balance.! !

!PortfolioTest methodsFor: 'testing' stamp: 'ln 11/11/2022 13:43:02'!
test02ElBalanceEsLaSumaDeLosBalancesDeLasCuentasYPortfoliosInternos
	| portfolio account1 account2 account3 portfolio2 |
	portfolio := Portfolio new.	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	Deposit register: 100*peso on: account1. 
	Deposit register: 400*peso on: account2. 
	portfolio añadir: account1.
	portfolio añadir: account2.
	portfolio2 := Portfolio new.
	account3 := ReceptiveAccount new.
	Deposit register: 200*peso on: account3. 
	portfolio2 añadir: account3.
	portfolio añadir: portfolio2.
	self assert: 700 * peso equals: portfolio balance.! !

!PortfolioTest methodsFor: 'testing' stamp: 'MD 11/11/2022 00:31:05'!
test03PortfolioConoceLasTransaccionesRegistradas 
	| portfolio account1 account2 transaction1 transaction2 portfolio2 account3 transaction3 |
	portfolio := Portfolio new.	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	transaction1 := Deposit register: 100*peso on: account1. 
	transaction2 := Deposit register: 400*peso on: account2. 
	portfolio añadir: account1.
	portfolio añadir: account2.
	
	portfolio2 := Portfolio new.
	account3 := ReceptiveAccount new.
	transaction3 := Withdraw register: 300 * peso on: account3.
	portfolio2 añadir: account3.
	portfolio añadir: portfolio2.
	self assert: (portfolio hasRegistered: transaction1).
	self assert: (portfolio hasRegistered: transaction2).
	self assert: (portfolio hasRegistered: transaction3).! !

!PortfolioTest methodsFor: 'testing' stamp: 'ln 11/11/2022 13:47:02'!
test04PortfolioConoceLasTransaccionesDeSusCuentas
	| portfolio account1 account2 transactions t1 t2 |
	portfolio := Portfolio new.	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	t1 := Deposit register: 100*peso on: account1. 
	t2 := Deposit register: 400*peso on: account2. 
	portfolio añadir: account1.
	portfolio añadir: account2.
	
	transactions := portfolio transactions.
	
	self assert: (transactions includes: t1).
	self assert: (transactions includes: t2).! !

!PortfolioTest methodsFor: 'testing' stamp: 'ln 11/11/2022 13:48:10'!
test05PortfolioConoceLasTransaccionesDeSusCuentasQueEstaDentroDeOtroPortfolio
	| portfolio1 account1 account2 transactions account3 portfolio2 account4 portfolio3 transaction |
	portfolio1 := Portfolio new.	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	Deposit register: 100*peso on: account1. 
	Deposit register: 400*peso on: account2. 
	portfolio1 añadir: account1.
	portfolio1 añadir: account2.
	
	account3 := ReceptiveAccount new.
	Deposit register: 500*peso on: account3. 
	Withdraw register: 200*peso on: account3. 
	portfolio2 := Portfolio new.
	portfolio2 añadir: account3.
	portfolio1 añadir: portfolio2.
	
	portfolio3 := Portfolio new.
	account4 := ReceptiveAccount new.
	Withdraw register: 200*peso on: account4. 
	transaction := Withdraw register: 200*peso on: account4. 
		
	portfolio3 añadir: account4.
	portfolio1 añadir: portfolio3.
	
	transactions := portfolio1 transactions.
	self assert: 6 equals: transactions size.
	self assert: transactions includes: transaction.
	self assert: transactions isEmpty not.! !

!PortfolioTest methodsFor: 'testing' stamp: 'MD 11/10/2022 23:20:44'!
test06UnPortfolioNoPuedeAgregarDosVecesLaMismaCuenta
	| portfolio account1 |
	portfolio := Portfolio new.	
	account1 := ReceptiveAccount new.
	portfolio añadir: account1.
	self should: [portfolio añadir: account1] raise: Error withExceptionDo: [:unError |
		self assert: unError messageText equals: Portfolio noSePuedeAgregarDosVecesLaMismaCuentaErrorDescription].! !

!PortfolioTest methodsFor: 'testing' stamp: 'MD 11/10/2022 23:20:53'!
test07UnPortfolioNoPuedeAgregarUnaCuentaYaIncluidaEnUnPortfolioPreviamenteAgregado
	| portfolio1 account1 account2 account3 portfolio2 |
	portfolio1 := Portfolio new.	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	portfolio1 añadir: account1.
	portfolio1 añadir: account2.
	
	portfolio2 := Portfolio new.
	account3 := ReceptiveAccount new.
	portfolio2 añadir: account3.
	portfolio1 añadir: portfolio2.
	self should: [portfolio1 añadir: account3] raise: Error withExceptionDo: [:unError |
		self assert: unError messageText equals: Portfolio noSePuedeAgregarDosVecesLaMismaCuentaErrorDescription].! !

!PortfolioTest methodsFor: 'testing' stamp: 'ln 11/11/2022 13:51:55'!
test08UnPortfolioNoSePuedeAgregarASiMismo
	| portfolio |
	portfolio := Portfolio new.	
	self should: [portfolio añadir: portfolio] raise: Error withExceptionDo: [:unError |
		self assert: unError messageText equals: Portfolio unPortfolioNoSePuedeIncluirASiMismoErrorDescription].! !

!PortfolioTest methodsFor: 'testing' stamp: 'MD 11/10/2022 23:22:35'!
test09UnPortfolioNoPuedeAgregarUnaCuentaCuandoSuPortfolioPadreYatieneDichaCuenta
	| portfolio1 account1 account2 portfolio2 |
	portfolio1 := Portfolio new.	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	portfolio1 añadir: account1.
	
	portfolio2 := Portfolio new.
	portfolio2 añadir: account2.
	portfolio1 añadir: portfolio2.

	self should: [portfolio2 añadir: account1] raise: Error withExceptionDo: [:unError |
		self assert: unError messageText equals: Portfolio estaCuentaYaEstaAgregadaEnUnPortfolioPadreErrorDescription].! !

!PortfolioTest methodsFor: 'testing' stamp: 'MD 11/10/2022 23:23:27'!
test10UnPorfolioNoPuedeSerAgregadoAOtroPorfolioSiYaTieneUnaCuentaDelSegundoPorfolio
	| portfolio1 account1 account2 portfolio2 |
	portfolio1 := Portfolio new.	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	portfolio1 añadir: account1.
	
	portfolio2 := Portfolio new.
	portfolio2 añadir: account1.
	portfolio2 añadir: account2.

	self should: [portfolio1 añadir: portfolio2] raise: Error withExceptionDo: [:unError |
		self assert: unError messageText equals: Portfolio unaDeLasCuentasDeEstePortfolioYaExisteEnElPortfolioPadreErrorDescription].! !


!classDefinition: #ReceptiveAccountTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccountTest methodsFor: 'testing' stamp: 'LL 7/1/2021 03:10:43'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'testing' stamp: 'LL 7/1/2021 03:14:20'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 * peso on: account.
		
	self assert: 100 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'testing' stamp: 'LL 7/1/2021 03:14:24'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	Withdraw register: 50 * peso on: account.
		
	self assert: 50 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'testing' stamp: 'LL 7/1/2021 03:10:14'!
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50 * peso.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) value
! !

!ReceptiveAccountTest methodsFor: 'testing' stamp: 'LL 7/1/2021 03:10:22'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 * peso on: account.
	withdraw := Withdraw register: 50 * peso on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'testing' stamp: 'LL 7/1/2021 03:12:14'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 100 * peso.
	withdraw := Withdraw for: 50 * peso.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'testing' stamp: 'LL 7/1/2021 03:12:23'!
test07AccountKnowsItsTransactions 

	| account deposit |
	
	account := ReceptiveAccount new.
	
	deposit := Deposit register: 50 * peso on: account.
		
	self assert: 1 equals: account transactions size.
	self assert: (account transactions includes: deposit).
! !

!ReceptiveAccountTest methodsFor: 'testing' stamp: 'MD 11/10/2022 23:47:36'!
test08TransferIncreasesBalanceOnSourceAccountAndDecreasesBalanceOnDestinationAccount

	| sourceAccount destinationAccount  transferenciaDeposito transferenciaOrigen |
	
	sourceAccount := ReceptiveAccount new.
	destinationAccount := ReceptiveAccount new.
	
	transferenciaOrigen := Transfer conCuentaDeOrigen: sourceAccount.
	transferenciaDeposito := Transfer conCuentaDeDestino: destinationAccount.
	
	transferenciaOrigen transferirA: transferenciaDeposito elMonto: 50*peso.
	
	self assert: sourceAccount balance equals: -50*peso.
	self assert: destinationAccount balance equals: 50*peso.
! !

!ReceptiveAccountTest methodsFor: 'testing' stamp: 'ln 11/10/2022 19:03:39'!
test09SourceAccountAndDestinationAccountRegisterTransfer

	| sourceAccount destinationAccount transferenciaOrigen transferenciaDestino |
	
	sourceAccount := ReceptiveAccount new.
	destinationAccount := ReceptiveAccount new.
	
	transferenciaOrigen := Transfer conCuentaDeOrigen: sourceAccount.
	transferenciaDestino := Transfer conCuentaDeDestino: destinationAccount.
	
	transferenciaOrigen transferirA: transferenciaDestino elMonto: 100*peso.
	
	self assert: (sourceAccount hasRegistered: transferenciaOrigen).
	self assert: (destinationAccount hasRegistered: transferenciaDestino).
! !

!ReceptiveAccountTest methodsFor: 'testing' stamp: 'ln 11/10/2022 19:03:46'!
test10LasPatasDeLaTransferenciaConocenSuContraparte

	| sourceAccount destinationAccount transferenciaOrigen transferenciaDestino |
	
	sourceAccount := ReceptiveAccount new.
	destinationAccount := ReceptiveAccount new.
	
	transferenciaOrigen := Transfer conCuentaDeOrigen: sourceAccount.
	transferenciaDestino := Transfer conCuentaDeDestino: destinationAccount.
	
	transferenciaOrigen transferirA: transferenciaDestino elMonto: 100*peso.
	
	self assert: transferenciaOrigen contraparte equals: transferenciaDestino.
	self assert: transferenciaDestino contraparte equals: transferenciaOrigen.
! !


!classDefinition: #AccountTransaction category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'private - balance' stamp: 'MD 11/7/2022 18:46:31'!
aplicarA: amount
	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'NR 10/17/2019 03:22:00'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Deposit category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !


!Deposit methodsFor: 'private - balance' stamp: 'MD 11/7/2022 18:54:55'!
aplicarA: amount
	^value + amount.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'ServiciosFinancieros-Ejercicio'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Withdraw category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:33'!
value

	^ value! !


!Withdraw methodsFor: 'private - balance' stamp: 'MD 11/7/2022 19:07:15'!
aplicarA: amount
	^amount - value.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'ServiciosFinancieros-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #PataDeposito category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #PataDeposito
	instanceVariableNames: 'cuentaDeposito contraparte monto'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!PataDeposito methodsFor: 'operations' stamp: 'ln 11/10/2022 00:00:03'!
contraparte
	^contraparte.! !

!PataDeposito methodsFor: 'operations' stamp: 'ln 11/9/2022 23:59:09'!
recibirDe: pataExtraccion elMonto: amount
	monto := amount.
	contraparte := pataExtraccion.
	cuentaDeposito register: self.! !


!PataDeposito methodsFor: 'private - balance' stamp: 'ln 11/9/2022 23:50:27'!
aplicarA: montoTotal
	^montoTotal + monto.! !


!PataDeposito methodsFor: 'initialization' stamp: 'ln 11/9/2022 23:35:27'!
conCuenta: anAccount
	cuentaDeposito := anAccount.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PataDeposito class' category: 'ServiciosFinancieros-Ejercicio'!
PataDeposito class
	instanceVariableNames: ''!

!PataDeposito class methodsFor: 'initialization' stamp: 'ln 11/9/2022 23:37:47'!
withAccount: unaCuentaDeDeposito.
	 ^self new conCuenta: unaCuentaDeDeposito.! !


!classDefinition: #PataExtraccion category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #PataExtraccion
	instanceVariableNames: 'cuentaExtraccion monto contraparte'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!PataExtraccion methodsFor: 'initialization' stamp: 'ln 11/9/2022 23:36:00'!
conCuenta: anAccount
	cuentaExtraccion := anAccount.! !


!PataExtraccion methodsFor: 'operations' stamp: 'ln 11/10/2022 00:00:08'!
contraparte
	^contraparte.! !

!PataExtraccion methodsFor: 'operations' stamp: 'ln 11/9/2022 23:58:48'!
transferirA: pataDeposito elMonto: amount
	monto := amount.
	contraparte := pataDeposito.
	pataDeposito recibirDe: self elMonto: amount.
	
	cuentaExtraccion register: self.! !


!PataExtraccion methodsFor: 'private - balance' stamp: 'ln 11/9/2022 23:50:12'!
aplicarA: montoTotal
	^montoTotal - monto.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PataExtraccion class' category: 'ServiciosFinancieros-Ejercicio'!
PataExtraccion class
	instanceVariableNames: ''!

!PataExtraccion class methodsFor: 'initialization' stamp: 'ln 11/9/2022 23:38:05'!
withAccount: unaCuentaDeExtraccion.
	 ^self new conCuenta: unaCuentaDeExtraccion.! !


!classDefinition: #Portfolio category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Portfolio
	instanceVariableNames: 'cuentas padre'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Portfolio methodsFor: 'private - operations' stamp: 'MD 11/10/2022 22:47:17'!
contiene: unaCuenta
	^cuentas includes: unaCuenta.! !

!Portfolio methodsFor: 'private - operations' stamp: 'MD 11/10/2022 23:32:16'!
cuentas
	| todasLasCuentas |
	todasLasCuentas := OrderedCollection new.
	cuentas do: [:unConjuntoDeCuentas | 
		todasLasCuentas addAll: unConjuntoDeCuentas cuentas.
		].
	^todasLasCuentas.! !

!Portfolio methodsFor: 'private - operations' stamp: 'MD 11/11/2022 00:01:23'!
estaIncluidaDentroDe: unaColleccionDeCuentas

	^(cuentas select: [:unaCuenta | unaCuenta isKindOf: ReceptiveAccount]) anySatisfy: [:cuenta | unaColleccionDeCuentas includes: cuenta].! !

!Portfolio methodsFor: 'private - operations' stamp: 'MD 11/10/2022 23:53:02'!
obtenerMisCuentasYLasDeMisPadres
	| listaCuentas listaCuentasTotalesDePadres |
	listaCuentasTotalesDePadres := OrderedCollection new.
	listaCuentas := cuentas select: [:unaCuenta | unaCuenta isKindOf: ReceptiveAccount].
	(padre isKindOf: Portfolio) ifTrue: [
		listaCuentasTotalesDePadres := padre obtenerMisCuentasYLasDeMisPadres.
		].
	listaCuentasTotalesDePadres addAll: listaCuentas.
	^listaCuentasTotalesDePadres.! !

!Portfolio methodsFor: 'private - operations' stamp: 'ln 11/10/2022 20:41:13'!
padre: unPortfolioPadre
	padre := unPortfolioPadre.! !

!Portfolio methodsFor: 'private - operations' stamp: 'MD 11/11/2022 00:01:23'!
sePuedeAgregarComoHijoDe: unPortfolioPadre
	
	(unPortfolioPadre = self) ifTrue: [self error: self class unPortfolioNoSePuedeIncluirASiMismoErrorDescription].
	
	(self estaIncluidaDentroDe: (unPortfolioPadre obtenerMisCuentasYLasDeMisPadres)) ifTrue: [
			self error: self class unaDeLasCuentasDeEstePortfolioYaExisteEnElPortfolioPadreErrorDescription.
		].
	
	self padre: unPortfolioPadre.! !


!Portfolio methodsFor: 'initialization' stamp: 'ln 11/9/2022 15:28:01'!
initialize
	cuentas := OrderedCollection new.! !


!Portfolio methodsFor: 'main protocol' stamp: 'MD 11/10/2022 23:48:39'!
añadir: anAccount
	
	
	anAccount sePuedeAgregarComoHijoDe: self.
	
	
	
	cuentas add: anAccount.! !

!Portfolio methodsFor: 'main protocol' stamp: 'ln 11/9/2022 15:31:00'!
balance
	^cuentas sum: [:unaCuenta | unaCuenta balance] ifEmpty: 0 * peso.! !

!Portfolio methodsFor: 'main protocol' stamp: 'ln 11/9/2022 16:07:47'!
hasRegistered: aTransaction
	^cuentas anySatisfy: [:cuenta | cuenta hasRegistered: aTransaction].! !

!Portfolio methodsFor: 'main protocol' stamp: 'MD 11/10/2022 23:00:45'!
transactions
	| totalDeTransacciones |
	totalDeTransacciones := OrderedCollection new.
	cuentas do: [:conjuntoDeCuentas | 
		totalDeTransacciones addAll: (conjuntoDeCuentas transactions).
		].
	^totalDeTransacciones.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: 'ServiciosFinancieros-Ejercicio'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'error' stamp: 'ln 11/10/2022 19:55:04'!
estaCuentaYaEstaAgregadaEnUnPortfolioPadreErrorDescription
	^'esta cuenta ya esta agregada en un portfolio padre'! !

!Portfolio class methodsFor: 'error' stamp: 'ln 11/10/2022 19:11:08'!
noSeEncontroLaCuentaErrorDescription
	^'No se encontro la cuenta'.! !

!Portfolio class methodsFor: 'error' stamp: 'ln 11/10/2022 19:11:52'!
noSePuedeAgregarDosVecesLaMismaCuentaErrorDescription
	^'no se puede agregar dos veces la misma cuenta'! !

!Portfolio class methodsFor: 'error' stamp: 'ln 11/10/2022 19:27:46'!
unPortfolioNoSePuedeIncluirASiMismoErrorDescription
	^'un portfolio no se puede incluir a si mismo'! !

!Portfolio class methodsFor: 'error' stamp: 'ln 11/10/2022 21:23:09'!
unaDeLasCuentasDeEstePortfolioYaExisteEnElPortfolioPadreErrorDescription
	^'una de las cuentas de este portfolio ya existe en el portfolio padre'! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'NR 10/17/2019 15:06:56'!
initialize

	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'MD 11/7/2022 19:04:46'!
balance
	|totalAmount|
	totalAmount  := 0.
	transactions do: [ :aTransaction | totalAmount := aTransaction aplicarA: totalAmount ].
	^totalAmount.! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'NR 10/17/2019 03:28:43'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !


!ReceptiveAccount methodsFor: 'private - operations' stamp: 'MD 11/10/2022 23:33:04'!
cuentas
	^OrderedCollection with: self.! !

!ReceptiveAccount methodsFor: 'private - operations' stamp: 'MD 11/11/2022 00:01:23'!
estaIncluidaDentroDe: unaColleccionDeCuentas
	^unaColleccionDeCuentas includes: self.! !

!ReceptiveAccount methodsFor: 'private - operations' stamp: 'MD 11/11/2022 00:16:45'!
sePuedeAgregarComoHijoDe: unPortfolio

	(unPortfolio contiene: self)ifTrue: [self error: Portfolio noSePuedeAgregarDosVecesLaMismaCuentaErrorDescription].
	
	(self estaIncluidaDentroDe: unPortfolio obtenerMisCuentasYLasDeMisPadres) ifTrue: [
			self error: Portfolio estaCuentaYaEstaAgregadaEnUnPortfolioPadreErrorDescription
		].
	
	((unPortfolio cuentas) includes: self )ifTrue: [
		self error: Portfolio noSePuedeAgregarDosVecesLaMismaCuentaErrorDescription].! !


!classDefinition: #Transfer category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Transfer
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transfer class' category: 'ServiciosFinancieros-Ejercicio'!
Transfer class
	instanceVariableNames: ''!

!Transfer class methodsFor: 'initialization' stamp: 'ln 11/10/2022 19:02:25'!
conCuentaDeDestino: destinationAccount 
	^PataDeposito withAccount: destinationAccount.! !

!Transfer class methodsFor: 'initialization' stamp: 'ln 11/10/2022 19:01:55'!
conCuentaDeOrigen: sourceAccount 
	^PataExtraccion withAccount: sourceAccount.! !
