!classDefinition: #EspecialReportTest category: 'ServiciosFinancieros-Solucion'!
TestCase subclass: #EspecialReportTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!EspecialReportTest methodsFor: 'tests' stamp: 'MD 11/17/2022 19:49:06'!
test01ReporteEspecialDeUnPortfolioVacio
	| portfolio portfolioTreePrinter portfolioTreePrinterReport |
	portfolio := Portfolio named: 'Portfolio vacio'.
	portfolioTreePrinter := PortfolioTreePrinter of: portfolio.
	
	portfolioTreePrinterReport := portfolioTreePrinter exportReport.
	
	self assert: 'Portfolio vacio' equals: (portfolioTreePrinterReport at: 1).
	
	
	! !

!EspecialReportTest methodsFor: 'tests' stamp: 'MD 11/17/2022 21:09:15'!
test02ReporteEspecialDeUnPortfolioQueContieneSoloCuentas
	| portfolio portfolioTreePrinter portfolioTreePrinterReport currentaccount savingsAccount |

	savingsAccount := ReceptiveAccount named: 'Mi cuenta de ahorros'.
	currentaccount := ReceptiveAccount named: 'Mi cuenta corriente'.
	
	portfolio := Portfolio named: 'Mi portfolio' with: savingsAccount with: currentaccount.
	portfolioTreePrinter := PortfolioTreePrinter of: portfolio.
	
	Deposit register: 100*peso on: savingsAccount.
	Withdraw register: 10*peso on: currentaccount.
	
	portfolioTreePrinterReport := portfolioTreePrinter exportReport.
	
	self assert: 'Mi portfolio' equals: (portfolioTreePrinterReport at: 1).
	self assert: '  Mi cuenta de ahorros' equals: (portfolioTreePrinterReport at: 2).
	self assert: '  Mi cuenta corriente' equals: (portfolioTreePrinterReport at: 3).
	
	! !

!EspecialReportTest methodsFor: 'tests' stamp: 'MD 11/17/2022 21:11:47'!
test03ReporteEspecialDeUnPorfolioQueContienePortfolios
	| angiesAccount childrenPortfolio familyPortfolio johnsAccount myAccount portfolioTreePrinter portfolioTreePrinterReport |
	johnsAccount := ReceptiveAccount named: 'Cuenta de Juan'. 
	angiesAccount := ReceptiveAccount named: 'Cuenta de Angeles'. 
	childrenPortfolio := Portfolio named: 'Portfolio de hijos' with: johnsAccount with: angiesAccount. 
	myAccount := ReceptiveAccount named: 'Cuenta mia'. 
	familyPortfolio := Portfolio named: 'Portfolio de la familia' with: myAccount with: childrenPortfolio.
	
	portfolioTreePrinter := PortfolioTreePrinter of: familyPortfolio.
	
	Transfer amount: 100*peso from: johnsAccount to: angiesAccount.
	
	portfolioTreePrinterReport := portfolioTreePrinter exportReport.
	
	self assert: 'Portfolio de la familia' equals: (portfolioTreePrinterReport at: 1).
	self assert: '  Cuenta mia' equals: (portfolioTreePrinterReport at: 2).
	self assert: '  Portfolio de hijos' equals: (portfolioTreePrinterReport at: 3).
	self assert: '    Cuenta de Juan' equals: (portfolioTreePrinterReport at: 4).
	self assert: '    Cuenta de Angeles' equals: (portfolioTreePrinterReport at: 5).
! !

!EspecialReportTest methodsFor: 'tests' stamp: 'MD 11/17/2022 19:51:25'!
test04ReporteEspecialDeUnPorfolioQueContineTantoCuentasComoPortfolios
	| angiesAccount childrenPortfolio familyPortfolio johnsAccount myAccount portfolioTreePrinter portfolioTreePrinterReport otherAccount |
	johnsAccount := ReceptiveAccount named: 'Cuenta de Juan'. 
	angiesAccount := ReceptiveAccount named: 'Cuenta de Angeles'. 
	childrenPortfolio := Portfolio named: 'Portfolio de hijos' with: johnsAccount with: angiesAccount. 
	myAccount := ReceptiveAccount named: 'Cuenta mia'. 
	familyPortfolio := Portfolio named: 'Portfolio de la familia' with: myAccount with: childrenPortfolio.
	
	portfolioTreePrinter := PortfolioTreePrinter of: familyPortfolio.
	otherAccount := ReceptiveAccount named: 'jajaja rompiste'.
	familyPortfolio add: otherAccount.
	
	portfolioTreePrinterReport := portfolioTreePrinter exportReport.
	
	self assert: 'Portfolio de la familia' equals: (portfolioTreePrinterReport at: 1).
	self assert: '  Cuenta mia' equals: (portfolioTreePrinterReport at: 2).
	self assert: '  Portfolio de hijos' equals: (portfolioTreePrinterReport at: 3).
	self assert: '    Cuenta de Juan' equals: (portfolioTreePrinterReport at: 4).
	self assert: '    Cuenta de Angeles' equals: (portfolioTreePrinterReport at: 5).
	self assert: '  jajaja rompiste' equals: (portfolioTreePrinterReport at: 6).
! !

!EspecialReportTest methodsFor: 'tests' stamp: 'MD 11/17/2022 18:38:00'!
test05ReporteEspecialDetalladoDeUnPortfolioVacio
	| portfolio portfolioDetailedTreePrinter portfolioDetailedTreePrinterReport |
	portfolio := Portfolio named: 'Portfolio vacio'.
	portfolioDetailedTreePrinter := PortfolioDetailedTreePrinter of: portfolio.
	
	portfolioDetailedTreePrinterReport := portfolioDetailedTreePrinter exportReport.

	self assert: 'Portfolio vacio' equals: (portfolioDetailedTreePrinterReport at: 1).
	self assert: '  Balance = 0 * pesos' equals: (portfolioDetailedTreePrinterReport at: 2).
	
	
	! !

!EspecialReportTest methodsFor: 'tests' stamp: 'MD 11/17/2022 19:52:27'!
test06ReporteEspecialDetalladoDeUnPortfolioQQueContieneSoloCuentas
	| portfolio currentaccount savingsAccount portfolioDetailedTreePrinter portfolioDetailedTreePrinterReport |

	savingsAccount := ReceptiveAccount named: 'Mi cuenta de ahorros'.
	currentaccount := ReceptiveAccount named: 'Mi cuenta corriente'.
	
	Withdraw register: 100 * peso on: savingsAccount.
	portfolio := Portfolio named: 'Mi portfolio' with: savingsAccount with: currentaccount.
	portfolioDetailedTreePrinter := PortfolioDetailedTreePrinter of: portfolio.
	
	portfolioDetailedTreePrinterReport := portfolioDetailedTreePrinter exportReport.
	
	self assert: 'Mi portfolio' equals: (portfolioDetailedTreePrinterReport at: 1).
	self assert: '  Mi cuenta de ahorros' equals: (portfolioDetailedTreePrinterReport at: 2).
	self assert: '    Extracción por 100 * pesos' equals: (portfolioDetailedTreePrinterReport at: 3).
	self assert: '    Balance = -100 * pesos' equals: (portfolioDetailedTreePrinterReport at: 4).
	self assert: '  Mi cuenta corriente' equals: (portfolioDetailedTreePrinterReport at: 5).
	self assert: '    Balance = 0 * pesos' equals: (portfolioDetailedTreePrinterReport at: 6).
	self assert: '  Balance = -100 * pesos' equals: (portfolioDetailedTreePrinterReport at: 7).
	
	! !

!EspecialReportTest methodsFor: 'tests' stamp: 'MD 11/17/2022 20:16:15'!
test07ReporteEspecialDetalladoDeUnPorfolioQueContienePortfolios
	| portfolioDetailedTreePrinter portfolioDetailedTreePrinterReport angiesAccount childrenPortfolio familyPortfolio johnsAccount myAccount lucasAccount |


	lucasAccount := ReceptiveAccount named: 'Cuenta de Lucas'. 
	johnsAccount := ReceptiveAccount named: 'Cuenta de Juan'. 
	angiesAccount := ReceptiveAccount named: 'Cuenta de Angeles'. 
	childrenPortfolio := Portfolio named: 'Portfolio de hijos' with: johnsAccount with: angiesAccount. 
	myAccount := ReceptiveAccount named: 'Cuenta mia'. 
	familyPortfolio := Portfolio named: 'Portfolio de la familia' with: myAccount with: childrenPortfolio.
	familyPortfolio add: lucasAccount.
	
	Deposit register: 100 * peso on: myAccount.
	Withdraw register: 100 * peso on: myAccount.
	Deposit register: 100*peso on: johnsAccount.
	Withdraw register: 100*peso on: johnsAccount.
	
	Transfer amount: 100*peso from: angiesAccount to: lucasAccount.
	
	portfolioDetailedTreePrinter := PortfolioDetailedTreePrinter of: familyPortfolio.
	
	portfolioDetailedTreePrinterReport := portfolioDetailedTreePrinter exportReport.
	
	self assert: 'Portfolio de la familia' equals: (portfolioDetailedTreePrinterReport at: 1).
	self assert: '  Cuenta mia' equals: (portfolioDetailedTreePrinterReport at: 2).
	self assert: '    Depósito por 100 * pesos' equals: (portfolioDetailedTreePrinterReport at: 3).
	self assert: '    Extracción por 100 * pesos' equals: (portfolioDetailedTreePrinterReport at: 4).
	self assert: '    Balance = 0 * pesos' equals: (portfolioDetailedTreePrinterReport at: 5).
	self assert: '  Portfolio de hijos'  equals: (portfolioDetailedTreePrinterReport at: 6).
	self assert: '    Cuenta de Juan' equals: (portfolioDetailedTreePrinterReport at: 7).
	self assert: '      Depósito por 100 * pesos' equals: (portfolioDetailedTreePrinterReport at: 8).
	self assert: '      Extracción por 100 * pesos' equals: (portfolioDetailedTreePrinterReport at: 9).
	self assert: '      Balance = 0 * pesos' equals: (portfolioDetailedTreePrinterReport at: 10).
	self assert: '    Cuenta de Angeles' equals: (portfolioDetailedTreePrinterReport at: 11).
	self assert: '      Salida por transferencia de 100 * pesos' equals: (portfolioDetailedTreePrinterReport at: 12).
	self assert: '      Balance = -100 * pesos' equals: (portfolioDetailedTreePrinterReport at: 13).
	self assert: '    Balance = -100 * pesos' equals: (portfolioDetailedTreePrinterReport at: 14).
	self assert: '  Cuenta de Lucas' equals: (portfolioDetailedTreePrinterReport at: 15).
	self assert: '    Entrada por transferencia de 100 * pesos' equals: (portfolioDetailedTreePrinterReport at: 16).
	self assert: '    Balance = 100 * pesos' equals: (portfolioDetailedTreePrinterReport at: 17).
	self assert: '  Balance = 0 * pesos' equals: (portfolioDetailedTreePrinterReport at: 18).
	
	! !


!classDefinition: #PortfolioTest category: 'ServiciosFinancieros-Solucion'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:16:26'!
test01BalanceOfPortfolioWithoutAccountsIsZero

	self assert: 0 equals: Portfolio new balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:00'!
test02BalanceOfPortfolioWithOneAccountIsAccountBalance

	| account portfolio |
	
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	portfolio := Portfolio with: account.
	
	self assert: account balance equals: portfolio balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:06'!
test03BalanceOfPortfolioIsCalculatedRecursivelyOnPortfolios

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortofolio |
	
	simplePortfolioAccount := ReceptiveAccount new.
	Deposit register: 100 * peso on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	Withdraw register: 50 * peso on: composedPortfolioAccount.
	composedPortofolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	self assert: (composedPortfolioAccount balance + simplePortfolio balance) equals: composedPortofolio balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:12'!
test04PortfolioWithoutAccountsHasNoRegisteredTransaction

	self deny: (Portfolio new hasRegistered: (Deposit for: 100 * peso))! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:18'!
test05PortfolioHasRegisteredItsAccountsTransactions

	| account portfolio deposit |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 * peso on: account.
	portfolio := Portfolio with: account.
	
	self assert: (portfolio hasRegistered: deposit)! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:26'!
test06PortfolioLooksForRegisteredTransactionsRecursively

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortfolio composedPortfolioAccountWithdraw simplePortfolioAccountDeposit |
	
	simplePortfolioAccount := ReceptiveAccount new.
	simplePortfolioAccountDeposit := Deposit register: 100 * peso on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	composedPortfolioAccountWithdraw := Withdraw register: 50 * peso on: composedPortfolioAccount.
	composedPortfolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	self assert: (composedPortfolio hasRegistered: simplePortfolioAccountDeposit).
	self assert: (composedPortfolio hasRegistered: composedPortfolioAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:10'!
test07PortfolioHasNoTransactionWhenHasNoAccounts

	self assert: Portfolio new transactions isEmpty! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:28:08'!
test08PortfolioTransactionsIncludesAllItsAccountsTransactions

	| account portfolio accountDeposit portfolioTransactions anotherAccountWithdraw |
	
	account := ReceptiveAccount new.
	accountDeposit := Deposit register: 100 * peso on: account.
	anotherAccountWithdraw := Withdraw register: 100 * peso on: account.
	portfolio := Portfolio with: account.
	
	portfolioTransactions := portfolio transactions.
	
	self assert: 2 equals: portfolioTransactions size.
	self assert: (portfolioTransactions includes: accountDeposit).
	self assert: (portfolioTransactions includes: anotherAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:28:20'!
test09PortfolioTransactionsAreCalculatedRecursively

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortfolio composedPortfolioAccountWithdraw simplePortfolioAccountDeposit composedPortfolioTransactions |
	
	simplePortfolioAccount := ReceptiveAccount new.
	simplePortfolioAccountDeposit := Deposit register: 100 * peso on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	composedPortfolioAccountWithdraw := Withdraw register: 50 * peso on: composedPortfolioAccount.
	composedPortfolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	composedPortfolioTransactions := composedPortfolio transactions.
	self assert: 2 equals: composedPortfolioTransactions size.
	self assert: (composedPortfolioTransactions includes: simplePortfolioAccountDeposit).
	self assert: (composedPortfolioTransactions includes: composedPortfolioAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:24'!
test10PortfolioCanNotIncludeTheSameAccountMoreThanOnce

	| account portfolio |
	
	account := ReceptiveAccount new.
	portfolio := Portfolio with: account.
	
	self 
		should: [ portfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: portfolio accountsSize.
			self assert: (portfolio accountsIncludes: account) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:28'!
test11PortfolioCanNotIncludeAccountOfItsPortfolios

	| account simplePortfolio composedPortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio with: account.
	composedPortfolio := Portfolio with: simplePortfolio.
	
	self 
		should: [ composedPortfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: composedPortfolio accountsSize.
			self assert: (composedPortfolio accountsIncludes: simplePortfolio) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:32'!
test12PortfolioCanNotIncludeItself

	| account simplePortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio with: account.
	
	self 
		should: [ simplePortfolio add: simplePortfolio ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: simplePortfolio accountsSize.
			self assert: (simplePortfolio accountsIncludes: account) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 12:01:51'!
test13ComposedPortfolioCanNotHaveParentPortfolioAccount

	| account simplePortfolio composedPortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio new.
	composedPortfolio := Portfolio with: simplePortfolio.
	composedPortfolio add: account.
	
	self 
		should: [ simplePortfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: simplePortfolio accountsIsEmpty ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 12:12:16'!
test14ComposedPortfolioCanNotHaveAccountOfAnyRootParentRecursively

	| account leftParentPortfolio leftRootParentPortfolio portfolio rightParentPortfolio rightRootParentPortfolio |
	
	account := ReceptiveAccount new.
	portfolio := Portfolio new.
	leftParentPortfolio := Portfolio with: portfolio .
	leftRootParentPortfolio := Portfolio with: leftParentPortfolio.
	leftRootParentPortfolio add: account.
	
	rightParentPortfolio := Portfolio with: portfolio .
	rightRootParentPortfolio := Portfolio with: rightParentPortfolio.
	rightRootParentPortfolio add: account.

	self 
		should: [ portfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: portfolio accountsIsEmpty ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/29/2019 16:31:18'!
test15PortfolioCanNotIncludeAnyOfTheComposedAccountOfPortfolioToAdd

	| portfolioToAdd portfolioToModify rootPortfolio sharedAccount |
	
	sharedAccount := ReceptiveAccount new.
	portfolioToModify := Portfolio new.
	rootPortfolio := Portfolio with: sharedAccount with: portfolioToModify.
	portfolioToAdd := Portfolio with: sharedAccount.
	
	self 
		should: [ portfolioToModify add: portfolioToAdd ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError | 
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: portfolioToModify accountsIsEmpty ]! !


!classDefinition: #ReceptiveAccountTest category: 'ServiciosFinancieros-Solucion'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:43'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:14:20'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 * peso on: account.
		
	self assert: 100 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:14:24'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	Withdraw register: 50 * peso on: account.
		
	self assert: 50 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:14'!
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50 * peso.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) value
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:22'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 * peso on: account.
	withdraw := Withdraw register: 50 * peso on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:12:14'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 100 * peso.
	withdraw := Withdraw for: 50 * peso.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:12:23'!
test07AccountKnowsItsTransactions 

	| account deposit |
	
	account := ReceptiveAccount new.
	
	deposit := Deposit register: 50 * peso on: account.
		
	self assert: 1 equals: account transactions size.
	self assert: (account transactions includes: deposit).
! !


!classDefinition: #ReportTest category: 'ServiciosFinancieros-Solucion'!
TestCase subclass: #ReportTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!ReportTest methodsFor: 'testing' stamp: 'MD 11/16/2022 16:05:27'!
test01ResumenDeCuentaParaUnaCuentaSinTransaccionesSoloObtieneUnBalanceDeCeroPesos
	
	| account accountSumary reportAccountSumary|
	
	account := ReceptiveAccount new.
	accountSumary := AccountSumary of: account. 
	
	reportAccountSumary := accountSumary exportReport.

	self assert: (reportAccountSumary size) equals: 1.
	self assert: 'Balance = 0 * pesos' equals: (reportAccountSumary at: 1). ! !

!ReportTest methodsFor: 'testing' stamp: 'MD 11/16/2022 16:07:09'!
test02UnResumenDeCuentaDeUnaCuentaConSoloUnDepositoDevuelveLosValoresEsperados
	
	| account accountSumary reportAccountSumary |
	
	account := ReceptiveAccount new.
	accountSumary := AccountSumary of: account. 
	
	Deposit register: 100 * peso on: account.
	
	reportAccountSumary := accountSumary exportReport.

	self assert: reportAccountSumary size  equals: 2.
	self assert: 'Depósito por 100 * pesos' equals: (reportAccountSumary at: 1).
	self assert: 'Balance = 100 * pesos' equals: (reportAccountSumary at: 2).! !

!ReportTest methodsFor: 'testing' stamp: 'MD 11/16/2022 16:14:13'!
test03UnResumenDeCuentaDeUnaCuentaConSoloUnaExtraccionDevuelveLosValoresEsperados
	
	| account accountSumary reportAccountSumary |
	
	account := ReceptiveAccount new.
	accountSumary := AccountSumary of: account. 
	
	Withdraw register: 50 * peso on: account.
	
	reportAccountSumary := accountSumary exportReport.

	self assert: reportAccountSumary size  equals: 2.
	self assert: 'Extracción por 50 * pesos' equals: (reportAccountSumary at: 1).
	self assert: 'Balance = -50 * pesos' equals: (reportAccountSumary at: 2).! !

!ReportTest methodsFor: 'testing' stamp: 'MD 11/16/2022 16:24:56'!
test04UnResumenDeCuentaDeUnaCuentaQueHizoUnaTransferenciaEsElEsperado
	
	| reportAccountSumary accountSumary originAccount destinationAccount|
	
	originAccount := ReceptiveAccount new.
	destinationAccount := ReceptiveAccount  new.
	accountSumary := AccountSumary of: originAccount. 
	
	Transfer amount: 20 * peso from: originAccount to: destinationAccount .
	
	reportAccountSumary := accountSumary exportReport .

	self assert: reportAccountSumary size  equals: 2.
	self assert: 'Salida por transferencia de 20 * pesos' equals: (reportAccountSumary at: 1).
	self assert: 'Balance = -20 * pesos' equals: (reportAccountSumary at: 2).! !

!ReportTest methodsFor: 'testing' stamp: 'MD 11/16/2022 16:29:39'!
test05ResumenDeCuentaParaUnaCuentaQueRecibeUnaTransferenciaEsElEsperado
	
	| reportAccountSumary accountSumary originAccount destinationAccount|
	
	originAccount := ReceptiveAccount new.
	destinationAccount := ReceptiveAccount  new.
	accountSumary := AccountSumary of: destinationAccount. 
	
	Transfer amount: 30 * peso from: originAccount to: destinationAccount .
	
	reportAccountSumary := accountSumary exportReport.

	self assert: reportAccountSumary size equals: 2.
	self assert: 'Entrada por transferencia de 30 * pesos' equals: (reportAccountSumary at: 1).
	self assert: 'Balance = 30 * pesos' equals: (reportAccountSumary at: 2).! !

!ReportTest methodsFor: 'testing' stamp: 'MD 11/16/2022 16:32:14'!
test06ResumenDeCuentaParaUnaCuentaQueTieneTodoTipoDetransaccionesNoDeberiaFallar
	"Este test despues de implemetar todos los anteriores ya logro pasar, pero parece necesario mas alla de que logré pasar a al primera, debido a que lo pide la consigna"
	| reportAccountSumary accountSumary originAccount destinationAccount|
	
	originAccount := ReceptiveAccount new.
	destinationAccount := ReceptiveAccount  new.
	accountSumary := AccountSumary of: originAccount. 
	
	Deposit register: 100 * peso on: originAccount.
	Withdraw register: 50 * peso on: originAccount.
	Transfer amount: 20 * peso from: originAccount to: destinationAccount .
	Transfer amount: 30 * peso from: destinationAccount to: originAccount .
	
	reportAccountSumary := accountSumary exportReport.

	self assert: reportAccountSumary size equals: 5.
	self assert: 'Depósito por 100 * pesos' equals: (reportAccountSumary at: 1).
	self assert: 'Extracción por 50 * pesos' equals: (reportAccountSumary at: 2).
	self assert: 'Salida por transferencia de 20 * pesos' equals: (reportAccountSumary at: 3).
	self assert: 'Entrada por transferencia de 30 * pesos' equals: (reportAccountSumary at: 4).
	self assert: 'Balance = 60 * pesos' equals: (reportAccountSumary at: 5).! !

!ReportTest methodsFor: 'testing' stamp: 'ln 11/16/2022 16:49:02'!
test07ElNetoDeUnaTransferenciaEsCeroSiLaCuentaNoHaRealizadoTransferencias

	| originAccount reportTransferNet transferNet |
	
	originAccount := ReceptiveAccount new.
	transferNet := TransferNet of: originAccount.
	reportTransferNet := transferNet exportReport.

	self assert: (0 * peso) equals: reportTransferNet.
! !

!ReportTest methodsFor: 'testing' stamp: 'ln 11/16/2022 17:01:49'!
test08ElNetoDeUnaTransferenciaDebeDevolverElResultadoDeSumarTodosLosDepositosYRestarleTodasLasExtraccionesPorTransferencia

	| reportTransferNetOriginAccount reportTransferNetDestinationAccount originAccount destinationAccount transferNetDestinationAccount transferNetOriginAccount |
	
	originAccount := ReceptiveAccount new.
	destinationAccount := ReceptiveAccount  new.
	
	Transfer amount: 20 * peso from: originAccount to: destinationAccount .
	transferNetOriginAccount := TransferNet of: originAccount.
	transferNetDestinationAccount := TransferNet of: destinationAccount.
	reportTransferNetOriginAccount := transferNetOriginAccount exportReport.
	reportTransferNetDestinationAccount := transferNetDestinationAccount exportReport.

	self assert: (-20 * peso) equals: reportTransferNetOriginAccount.
	self assert: (20 * peso) equals: reportTransferNetDestinationAccount.
! !

!ReportTest methodsFor: 'testing' stamp: 'ln 11/16/2022 17:07:00'!
test09ElNetoDeUnaTransferenciaDebeDevolverseCorrectamenteAunqueExistanOtroTipoDeTransacciones

	| originAccount destinationAccount reportTransferNet transferNet |
	
	originAccount := ReceptiveAccount new.
	destinationAccount := ReceptiveAccount  new.
	
	Deposit register: 100 * peso on: originAccount.
	Transfer amount: 20 * peso from: originAccount to: destinationAccount .
	transferNet := TransferNet of: originAccount.
	reportTransferNet := transferNet exportReport.

	self assert: (-20 * peso) equals: reportTransferNet.
! !

!ReportTest methodsFor: 'testing' stamp: 'MD 11/16/2022 16:34:07'!
test10ResumenDeCuentaParaPortfolioConCuentasVacias

	| reportAccountSumary accountSumary originAccount destinationAccount portfolio|
	
	originAccount := ReceptiveAccount new.
	destinationAccount := ReceptiveAccount  new. 
	
	portfolio := Portfolio with: originAccount.
	portfolio add: destinationAccount.
	
	accountSumary := AccountSumary of: portfolio.
	
	reportAccountSumary :=  accountSumary exportReport.

	self assert: 'Balance = 0 * pesos' equals: (reportAccountSumary at: 1).
! !

!ReportTest methodsFor: 'testing' stamp: 'MD 11/16/2022 16:34:30'!
test11ResumenDeCuentaParaPortfolioConCuentasQueTienenTransaccionesDeDepositoYExtraccion

	| reportAccountSumary accountSumary originAccount destinationAccount portfolio|
	
	originAccount := ReceptiveAccount new.
	destinationAccount := ReceptiveAccount  new.
	
	portfolio := Portfolio with: originAccount.
	portfolio add: destinationAccount.
	
	Withdraw register: 50 * peso on: originAccount.
	Deposit register: 100 * peso on: originAccount.
	
	accountSumary := AccountSumary of: portfolio.
	
	reportAccountSumary :=  accountSumary exportReport.

	self assert: 'Extracción por 50 * pesos' equals: (reportAccountSumary at: 1).
	self assert: 'Depósito por 100 * pesos' equals: (reportAccountSumary at: 2).
	self assert: 'Balance = 50 * pesos' equals: (reportAccountSumary at: 3).
! !

!ReportTest methodsFor: 'testing' stamp: 'MD 11/16/2022 16:35:06'!
test12ResumenDeCuentaParaPortfolioConCuentasQueTienenTodoTipoDeTransacciones

	| reportAccountSumary accountSumary originAccount destinationAccount portfolio|
	
	originAccount := ReceptiveAccount new.
	destinationAccount := ReceptiveAccount  new.
	
	portfolio := Portfolio with: originAccount.
	portfolio add: destinationAccount.
	
	Withdraw register: 50 * peso on: originAccount.
	Deposit register: 100 * peso on: originAccount.
	Transfer amount: 20 * peso from: originAccount to: destinationAccount .
	
	accountSumary := AccountSumary of: portfolio.
	
	reportAccountSumary :=  accountSumary exportReport.

	self assert: 'Extracción por 50 * pesos' equals: (reportAccountSumary at: 1).
	self assert: 'Depósito por 100 * pesos' equals: (reportAccountSumary at: 2).
	self assert: 'Salida por transferencia de 20 * pesos' equals: (reportAccountSumary at: 3).
	self assert: 'Entrada por transferencia de 20 * pesos' equals: (reportAccountSumary at: 4).
	self assert: 'Balance = 50 * pesos' equals: (reportAccountSumary at: 5).
! !

!ReportTest methodsFor: 'testing' stamp: 'MD 11/16/2022 16:36:09'!
test13ResumenDeCuentaParaPortfolioQueIncluyePortfoliosConCuentas

	| reportAccountSumary accountSumary originAccount destinationAccount portfolio portfolioHijo|
	
	originAccount := ReceptiveAccount new.
	destinationAccount := ReceptiveAccount  new.
	
	portfolio := Portfolio with: originAccount.
	portfolioHijo := Portfolio with: destinationAccount.
	portfolio add: portfolioHijo.
	
	Withdraw register: 50 * peso on: originAccount.
	Deposit register: 100 * peso on: originAccount.
	Transfer amount: 20 * peso from: originAccount to: destinationAccount .
	
	accountSumary := AccountSumary of: portfolio.
	
	reportAccountSumary :=  accountSumary exportReport.

	self assert: 'Extracción por 50 * pesos' equals: (reportAccountSumary at: 1).
	self assert: 'Depósito por 100 * pesos' equals: (reportAccountSumary at: 2).
	self assert: 'Salida por transferencia de 20 * pesos' equals: (reportAccountSumary at: 3).
	self assert: 'Entrada por transferencia de 20 * pesos' equals: (reportAccountSumary at: 4).
	self assert: 'Balance = 50 * pesos' equals: (reportAccountSumary at: 5).
! !

!ReportTest methodsFor: 'testing' stamp: 'ln 11/16/2022 17:11:36'!
test14TransferenciaNetaParaPortfolioQueIncluyeCuentasVacias

	| originAccount destinationAccount portfolio reportTransferNet transferNet |
	
	originAccount := ReceptiveAccount new.
	destinationAccount := ReceptiveAccount  new.
	
	portfolio := Portfolio with: originAccount.
	transferNet := TransferNet of: portfolio.
	reportTransferNet := transferNet exportReport.
	
	self assert: 0 * peso equals: reportTransferNet.
! !

!ReportTest methodsFor: 'testing' stamp: 'ln 11/16/2022 17:14:23'!
test15TransferenciaNetaParaPortfolioQueIncluyeCuentasConTranferencias

	| originAccount destinationAccount portfolio reportTransferNet transferNet |
	
	originAccount := ReceptiveAccount new.
	destinationAccount := ReceptiveAccount  new.
	
	portfolio := Portfolio with: originAccount.
	
	Transfer amount: 20 * peso from: originAccount to: destinationAccount .
	
	transferNet := TransferNet of: portfolio.
	reportTransferNet := transferNet exportReport.
	
	self assert: -20 * peso equals: reportTransferNet.
! !

!ReportTest methodsFor: 'testing' stamp: 'ln 11/16/2022 17:16:30'!
test16TransferenciaNetaParaPortfolioQueIncluyePortfolios

	| originAccount destinationAccount portfolio portfolioHijo reportTransferNet transferNet |
	
	originAccount := ReceptiveAccount new.
	destinationAccount := ReceptiveAccount  new.
	
	portfolio := Portfolio with: originAccount.
	portfolioHijo := Portfolio with: destinationAccount.
	portfolio add: portfolioHijo.
	
	Transfer amount: 20 * peso from: originAccount to: destinationAccount .
	transferNet := TransferNet of: portfolio.
	reportTransferNet := transferNet exportReport.
	self assert: 0 * peso equals: reportTransferNet.
! !

!ReportTest methodsFor: 'testing' stamp: 'MD 11/17/2022 21:03:54'!
test17TransferenciaNetaParaPortfolioQueIncluyePortfoliosConOtrasTransacciones

	| originAccount destinationAccount portfolio portfolioHijo reportTransferNet transferNet |
	
	originAccount := ReceptiveAccount new.
	destinationAccount := ReceptiveAccount  new.
	
	portfolio := Portfolio with: originAccount.
	portfolioHijo := Portfolio with: destinationAccount.
	portfolio add: portfolioHijo.
	
	Deposit register: 20*peso on: originAccount.
	Withdraw register: 20*peso on: originAccount.
	Transfer amount: 20 * peso from: originAccount to: destinationAccount .
	
	transferNet := TransferNet of: portfolio.
	reportTransferNet := transferNet exportReport.
	self assert: 0 * peso equals: reportTransferNet.
! !


!classDefinition: #TransferTest category: 'ServiciosFinancieros-Solucion'!
TestCase subclass: #TransferTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!TransferTest methodsFor: 'tests' stamp: 'LL 9/20/2020 21:07:03'!
test01ATransferDecreasesBalanceFromOriginAccountAndIncreasesItForDestinationAccount

	| destinationAccount originAccount |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: 8 * peso equals: originAccount balance.
	self assert: 12 * peso equals: destinationAccount balance.! !

!TransferTest methodsFor: 'tests' stamp: 'LL 9/20/2020 21:12:28'!
test02ATransferKnowsItsValue

	| destinationAccount originAccount transfer |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	transfer := Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: 2 * peso equals: transfer value.! !

!TransferTest methodsFor: 'tests' stamp: 'LL 9/20/2020 23:01:44'!
test03DepositLegKnowsItsWithdrawCounterpart

	| destinationAccount originAccount transfer |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	transfer := Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: transfer withdrawLeg equals: transfer depositLeg withdrawLeg! !

!TransferTest methodsFor: 'tests' stamp: 'LL 9/20/2020 23:01:51'!
test04WithdrawLegKnowsItsDepositCounterpart

	| destinationAccount originAccount transfer |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	transfer := Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: transfer depositLeg equals: transfer withdrawLeg depositLeg! !

!TransferTest methodsFor: 'tests' stamp: 'LL 9/20/2020 23:02:36'!
test05OriginAndDestinationAccountsCannotBeTheSame

	| originAccount |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	self should: [ Transfer amount: 2 * peso from: originAccount to: originAccount ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Transfer cannotTransferToOriginErrorDescription equals: anError messageText.
			self assert: 10 * peso equals: originAccount balance.
		]
! !

!TransferTest methodsFor: 'tests' stamp: 'LL 9/20/2020 23:02:44'!
test06CannotTransferAZeroAmount

	| originAccount destinationAccount |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 5 * peso on: destinationAccount.
	
	self should: [ Transfer amount: 0 from: originAccount to: destinationAccount ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Transfer cannotTransferZeroErrorDescription equals: anError messageText.
			self assert: 10 * peso equals: originAccount balance.
		]
! !


!classDefinition: #Account category: 'ServiciosFinancieros-Solucion'!
Object subclass: #Account
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Account methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 12:23:40'!
balance

	self subclassResponsibility ! !

!Account methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 12:23:47'!
hasRegistered: aTransaction

	self subclassResponsibility ! !

!Account methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 12:23:15'!
transactions

	self subclassResponsibility ! !


!Account methodsFor: 'composition' stamp: 'LL 7/8/2021 21:45:50'!
addedTo: aPortfolio

	self subclassResponsibility! !

!Account methodsFor: 'composition' stamp: 'LL 7/8/2021 21:46:48'!
isComposedBy: anAccount

	self subclassResponsibility! !


!Account methodsFor: 'private' stamp: 'HAW 5/25/2019 12:23:27'!
addTransactionsTo: aCollectionOfTransactions

	self subclassResponsibility ! !


!classDefinition: #Portfolio category: 'ServiciosFinancieros-Solucion'!
Account subclass: #Portfolio
	instanceVariableNames: 'accounts parents name'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Portfolio methodsFor: 'initialization' stamp: 'HAW 5/25/2019 12:03:18'!
initialize

	accounts := OrderedCollection new.
	parents := OrderedCollection new.! !

!Portfolio methodsFor: 'initialization' stamp: 'ln 11/16/2022 17:36:19'!
initializeWith: aName
	name := aName.
	accounts := OrderedCollection new.
	parents := OrderedCollection new.! !


!Portfolio methodsFor: 'main protocol' stamp: 'MD 11/16/2022 21:57:32'!
balance
	
	^accounts sum: [ :anAccount | anAccount balance ] ifEmpty: [ 0*peso ]! !

!Portfolio methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 11:28:29'!
hasRegistered: aTransaction

	^accounts anySatisfy: [ :anAccount | anAccount hasRegistered: aTransaction ]! !

!Portfolio methodsFor: 'main protocol' stamp: 'MD 11/18/2022 01:47:43'!
injectInto: aObjet with: aString
	aObjet add: self with: aString.! !

!Portfolio methodsFor: 'main protocol' stamp: 'MD 11/18/2022 00:17:01'!
name
	^name copy.! !

!Portfolio methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 11:38:32'!
transactions
	
	| transactions |
	
	transactions := OrderedCollection new.
	accounts do: [ :anAccount | anAccount addTransactionsTo: transactions ].
	
	^transactions ! !


!Portfolio methodsFor: 'accounts management' stamp: 'MD 11/18/2022 01:07:27'!
accounts
	^accounts copy.! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 11:49:20'!
accountsIncludes: anAccount

	^accounts includes: anAccount ! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 12:05:04'!
accountsIsEmpty
	
	^accounts isEmpty ! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 11:49:06'!
accountsSize
	
	^accounts size! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 12:19:20'!
add: accountToAdd

	self assertCanAdd: accountToAdd.
		
	accounts add: accountToAdd.
	accountToAdd addedTo: self 
	! !


!Portfolio methodsFor: 'private' stamp: 'HAW 5/25/2019 11:42:55'!
addTransactionsTo: aCollectionOfTransactions

	accounts do: [ :anAccount | anAccount addTransactionsTo: aCollectionOfTransactions ]! !

!Portfolio methodsFor: 'private' stamp: 'ln 11/16/2022 18:00:40'!
named: aName
	name := aName.! !


!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:17:31'!
addRootParentsTo: rootParents

	parents 
		ifEmpty: [ rootParents add: self ] 
		ifNotEmpty: [ parents do: [ :aParent | aParent addRootParentsTo: rootParents ]]! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:02:59'!
addedTo: aPortfolio 
	
	parents add: aPortfolio ! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:20:56'!
anyRootParentIsComposedBy: accountToAdd

	^self rootParents anySatisfy: [ :aParent | aParent isComposedBy: accountToAdd]! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:20:36'!
assertCanAdd: accountToAdd

	(self anyRootParentIsComposedBy: accountToAdd) ifTrue: [ self signalCanNotAddAccount ].
! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/29/2019 16:24:54'!
isComposedBy: anAccount

	^ self = anAccount or: [ accounts anySatisfy: [ :composedAccount | (composedAccount isComposedBy: anAccount) or: [ anAccount isComposedBy: composedAccount ]]]! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:17:31'!
rootParents
	
	| rootParents |
	
	rootParents := Set new.
	self addRootParentsTo: rootParents.
	
	^ rootParents! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 11:48:34'!
signalCanNotAddAccount
	
	self error: self class canNotAddAccountErrorMessage! !


!Portfolio methodsFor: 'iteration' stamp: 'MD 11/18/2022 02:09:29'!
do: aBlock with: aReport
	accounts do: [:account | account do: aBlock with: aReport].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: 'ServiciosFinancieros-Solucion'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'HAW 5/25/2019 11:48:55'!
canNotAddAccountErrorMessage
	
	^'Can not add repeated account to a portfolio'! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'HAW 5/25/2019 11:18:21'!
with: anAccount

	^self new 
		add: anAccount;
		yourself! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'HAW 5/25/2019 11:23:59'!
with: anAccount with: anotherAccount

	^self new 
		add: anAccount;
		add: anotherAccount;
		yourself! !


!Portfolio class methodsFor: 'category-name' stamp: 'ln 11/16/2022 18:27:05'!
named: aName 
	^self new initializeWith: aName! !


!Portfolio class methodsFor: 'initialization' stamp: 'ln 11/16/2022 18:00:11'!
named: aName with: anAccount with: anAnotherAccount 
	^self new 
		named: aName;
		add: anAccount;
		add: anAnotherAccount;
		yourself.! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Solucion'!
Account subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions name'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:35'!
initialize

	super initialize.
	transactions := OrderedCollection new.! !

!ReceptiveAccount methodsFor: 'initialization' stamp: 'ln 11/16/2022 17:53:10'!
initializeWith: aName 
	name := aName.! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'MD 11/18/2022 01:15:27'!
accounts
	^OrderedCollection new.! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'MD 11/16/2022 15:50:59'!
addedTo: aPortfolio 
	! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'MD 11/14/2022 22:28:50'!
balance

	^transactions 
		inject: 0 * peso
		into: [ :currentBalance :transaction | transaction affectBalance: currentBalance ]! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'NR 10/21/2019 18:55:56'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'MD 11/18/2022 00:21:45'!
name

	^ name copy! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !


!ReceptiveAccount methodsFor: 'private' stamp: 'HAW 5/25/2019 11:38:52'!
addTransactionsTo: aCollectionOfTransactions

	aCollectionOfTransactions addAll: transactions ! !

!ReceptiveAccount methodsFor: 'private' stamp: 'MD 11/18/2022 01:59:53'!
injectInto: aObjet with: aString
	aObjet inject: self with: aString.! !


!ReceptiveAccount methodsFor: 'composition' stamp: 'HAW 5/25/2019 11:54:51'!
isComposedBy: anAccount

	^self = anAccount ! !


!ReceptiveAccount methodsFor: 'iteration' stamp: 'MD 11/18/2022 02:09:29'!
do: aBlock with: aReport 
	transactions do: [:transaction | aBlock value: transaction value: aReport].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ReceptiveAccount class' category: 'ServiciosFinancieros-Solucion'!
ReceptiveAccount class
	instanceVariableNames: ''!

!ReceptiveAccount class methodsFor: 'category-name' stamp: 'ln 11/16/2022 17:52:48'!
named: aName 
	^self new initializeWith: aName.! !


!classDefinition: #AccountTransaction category: 'ServiciosFinancieros-Solucion'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:39'!
affectBalance: aBalance

	self subclassResponsibility ! !


!classDefinition: #Deposit category: 'ServiciosFinancieros-Solucion'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !


!Deposit methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:02'!
affectBalance: aBalance

	^aBalance + value ! !


!Deposit methodsFor: 'report' stamp: 'MD 11/17/2022 20:11:37'!
reportText: aReport
	^aReport reportTextDepositWith: value.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'ServiciosFinancieros-Solucion'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!Deposit class methodsFor: 'as yet unclassified' stamp: 'LL 7/8/2021 21:45:00'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #TransferLeg category: 'ServiciosFinancieros-Solucion'!
AccountTransaction subclass: #TransferLeg
	instanceVariableNames: 'transfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!TransferLeg methodsFor: 'value' stamp: 'LL 9/20/2020 22:27:32'!
value

	^transfer value! !


!TransferLeg methodsFor: 'initialization' stamp: 'LL 9/20/2020 22:28:14'!
initializeWith: aTransfer

	transfer := aTransfer! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferLeg class' category: 'ServiciosFinancieros-Solucion'!
TransferLeg class
	instanceVariableNames: ''!

!TransferLeg class methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 22:45:01'!
of: aTransfer on: anAccount

	| transaction |
	
	transaction := self new initializeWith: 	aTransfer.
	anAccount register: transaction.	
	
	^transaction! !


!classDefinition: #TransferDepositLeg category: 'ServiciosFinancieros-Solucion'!
TransferLeg subclass: #TransferDepositLeg
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!TransferDepositLeg methodsFor: 'accessing' stamp: 'LL 9/20/2020 22:26:10'!
withdrawLeg

	^transfer withdrawLeg! !


!TransferDepositLeg methodsFor: 'balance' stamp: 'LL 9/20/2020 22:27:49'!
affectBalance: aBalance

	^aBalance + self value! !


!TransferDepositLeg methodsFor: 'report' stamp: 'MD 11/16/2022 16:30:46'!
reportText: aReport
	^aReport reportTextTransferDepositWith: transfer value.! !


!classDefinition: #TransferWithdrawLeg category: 'ServiciosFinancieros-Solucion'!
TransferLeg subclass: #TransferWithdrawLeg
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!TransferWithdrawLeg methodsFor: 'accessing' stamp: 'LL 9/20/2020 22:25:47'!
depositLeg

	^transfer depositLeg! !


!TransferWithdrawLeg methodsFor: 'balance' stamp: 'LL 9/20/2020 22:27:55'!
affectBalance: aBalance

	^aBalance - self value! !


!TransferWithdrawLeg methodsFor: 'report' stamp: 'MD 11/16/2022 22:14:48'!
reportText: aReport
	^aReport reportTextTransferWithdrawWith: transfer value.! !


!classDefinition: #Withdraw category: 'ServiciosFinancieros-Solucion'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:33'!
value

	^ value! !


!Withdraw methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:15'!
affectBalance: aBalance

	^aBalance - value! !


!Withdraw methodsFor: 'report' stamp: 'MD 11/17/2022 23:55:34'!
reportText: aReport
	^aReport reportTextWithdrawWith: value. ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'ServiciosFinancieros-Solucion'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!Withdraw class methodsFor: 'as yet unclassified' stamp: 'LL 7/8/2021 21:45:05'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Report category: 'ServiciosFinancieros-Solucion'!
Object subclass: #Report
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!


!classDefinition: #AccountSumary category: 'ServiciosFinancieros-Solucion'!
Report subclass: #AccountSumary
	instanceVariableNames: 'account accountSumary'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!AccountSumary methodsFor: 'inicialize' stamp: 'MD 11/16/2022 16:02:50'!
initializeWith: anAccount 
	account := anAccount.! !


!AccountSumary methodsFor: 'adding' stamp: 'MD 11/18/2022 01:53:26'!
addBalanceInfo: aValueOfTransaction with: indentation 
	^'Balance = ', aValueOfTransaction asString.! !

!AccountSumary methodsFor: 'adding' stamp: 'MD 11/17/2022 20:32:48'!
reportTextDepositWith: aValueOfTransaction
	accountSumary add: 'Depósito por ', aValueOfTransaction asString.! !

!AccountSumary methodsFor: 'adding' stamp: 'MD 11/17/2022 20:32:54'!
reportTextTransferDepositWith: aValueOfTransaction
	accountSumary add: 'Entrada por transferencia de ', aValueOfTransaction asString.! !

!AccountSumary methodsFor: 'adding' stamp: 'MD 11/17/2022 20:33:03'!
reportTextTransferWithdrawWith: aValueOfTransaction
	accountSumary add: 'Salida por transferencia de ', aValueOfTransaction asString.! !

!AccountSumary methodsFor: 'adding' stamp: 'MD 11/17/2022 23:55:33'!
reportTextWithdrawWith: aValueOfTransaction
	accountSumary add: 'Extracción por ', aValueOfTransaction asString.! !


!AccountSumary methodsFor: 'report' stamp: 'MD 11/18/2022 02:09:29'!
exportReport

	accountSumary := OrderedCollection new.
	account do: [:transaction :report | transaction reportText: report] with: self.
	accountSumary add: (self addBalanceInfo: account balance with: '  ').
	
	^accountSumary.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountSumary class' category: 'ServiciosFinancieros-Solucion'!
AccountSumary class
	instanceVariableNames: ''!

!AccountSumary class methodsFor: 'initialization' stamp: 'MD 11/16/2022 16:01:06'!
of: anAccount 
	^self new initializeWith: anAccount.! !


!classDefinition: #PortfolioDetailedTreePrinter category: 'ServiciosFinancieros-Solucion'!
Report subclass: #PortfolioDetailedTreePrinter
	instanceVariableNames: 'portfolio tree'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!PortfolioDetailedTreePrinter methodsFor: 'initialize' stamp: 'ln 11/16/2022 19:27:41'!
initializeWith: aPortfolio 
	portfolio := aPortfolio.! !


!PortfolioDetailedTreePrinter methodsFor: 'report' stamp: 'MD 11/18/2022 01:58:28'!
exportReport

	tree := OrderedCollection new.
	
	tree add: portfolio name.
	portfolio accounts do: [:account |  account injectInto: self with: '  '].
	tree add: (self addBalanceInfo: portfolio balance with: '  ').
	
	^tree.! !


!PortfolioDetailedTreePrinter methodsFor: 'adding' stamp: 'MD 11/18/2022 02:05:20'!
add: anAccount with: indentation
	tree add: indentation, anAccount name.
	anAccount accounts do: [:account | account injectInto: self with: indentation, '  '].
	self addBalanceInfo: anAccount balance with: indentation, '  '.! !

!PortfolioDetailedTreePrinter methodsFor: 'adding' stamp: 'MD 11/18/2022 01:53:26'!
addBalanceInfo: aBalance with: indentation 
	tree add: (indentation copy), 'Balance = ', aBalance asString.! !

!PortfolioDetailedTreePrinter methodsFor: 'adding' stamp: 'MD 11/18/2022 01:40:55'!
reportTextDepositWith: aValueOfTransaction
	^'Depósito por ', aValueOfTransaction asString.! !

!PortfolioDetailedTreePrinter methodsFor: 'adding' stamp: 'MD 11/18/2022 01:41:04'!
reportTextTransferDepositWith: aValueOfTransacction
	^'Entrada por transferencia de ', aValueOfTransacction asString.! !

!PortfolioDetailedTreePrinter methodsFor: 'adding' stamp: 'MD 11/18/2022 01:41:11'!
reportTextTransferWithdrawWith: aValueOfTransacction
	^ 'Salida por transferencia de ', aValueOfTransacction asString.! !

!PortfolioDetailedTreePrinter methodsFor: 'adding' stamp: 'MD 11/18/2022 01:41:22'!
reportTextWithdrawWith: aValueOfTransaction
	^'Extracción por ', aValueOfTransaction asString.! !


!PortfolioDetailedTreePrinter methodsFor: 'private' stamp: 'MD 11/18/2022 02:02:58'!
inject:  account with: indentation
	tree add: indentation, account name.
	account transactions do: [:transaction | tree add: indentation, '  ', (transaction reportText: self)].
	self addBalanceInfo: account balance with: indentation, '  '.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PortfolioDetailedTreePrinter class' category: 'ServiciosFinancieros-Solucion'!
PortfolioDetailedTreePrinter class
	instanceVariableNames: ''!

!PortfolioDetailedTreePrinter class methodsFor: 'initialization' stamp: 'ln 11/16/2022 19:26:44'!
of: aPortfolio 
	^self new initializeWith: aPortfolio.! !


!classDefinition: #PortfolioTreePrinter category: 'ServiciosFinancieros-Solucion'!
Report subclass: #PortfolioTreePrinter
	instanceVariableNames: 'portfolio tree'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!PortfolioTreePrinter methodsFor: 'initialize' stamp: 'ln 11/16/2022 17:37:35'!
initializeWith: aPortfolio 
	portfolio := aPortfolio.! !


!PortfolioTreePrinter methodsFor: 'report' stamp: 'MD 11/18/2022 01:29:28'!
exportReport	
	
	tree := OrderedCollection new.
	tree add: portfolio name.
	
	portfolio accounts do: [:account |  self add: account with: '  '].
	
	^tree.
! !


!PortfolioTreePrinter methodsFor: 'adding' stamp: 'MD 11/18/2022 01:29:29'!
add: anAccount with: myIndentation
	tree add: myIndentation, anAccount name.
	anAccount accounts do: [:account | self add: account with: myIndentation, '  '].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PortfolioTreePrinter class' category: 'ServiciosFinancieros-Solucion'!
PortfolioTreePrinter class
	instanceVariableNames: ''!

!PortfolioTreePrinter class methodsFor: 'category-name' stamp: 'ln 11/16/2022 17:37:59'!
of: aPortfolio 
	^self new initializeWith: aPortfolio.! !


!classDefinition: #TransferNet category: 'ServiciosFinancieros-Solucion'!
Report subclass: #TransferNet
	instanceVariableNames: 'account transferNet'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!TransferNet methodsFor: 'report' stamp: 'MD 11/18/2022 02:09:29'!
exportReport
	
	transferNet := 0 * peso.
	account do: [:transaction :report | transaction reportText: report] with: self.
	^ transferNet.! !


!TransferNet methodsFor: 'initialize' stamp: 'ln 11/16/2022 16:58:30'!
initializeWith: anAccount
	account := anAccount! !


!TransferNet methodsFor: 'adding' stamp: 'MD 11/17/2022 20:59:25'!
reportTextDepositWith: aValueOfTransaction! !

!TransferNet methodsFor: 'adding' stamp: 'MD 11/17/2022 20:58:53'!
reportTextTransferDepositWith: aValueOfTransaction
	transferNet := transferNet + aValueOfTransaction.! !

!TransferNet methodsFor: 'adding' stamp: 'MD 11/17/2022 20:58:15'!
reportTextTransferWithdrawWith: aValueOfTransaction
	transferNet := transferNet - aValueOfTransaction.! !

!TransferNet methodsFor: 'adding' stamp: 'MD 11/17/2022 23:55:34'!
reportTextWithdrawWith: aValueOfTransaction! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferNet class' category: 'ServiciosFinancieros-Solucion'!
TransferNet class
	instanceVariableNames: 'account'!

!TransferNet class methodsFor: 'category-name' stamp: 'ln 11/16/2022 16:58:11'!
of: anAccount 
	^self new initializeWith: anAccount.! !


!classDefinition: #Transfer category: 'ServiciosFinancieros-Solucion'!
Object subclass: #Transfer
	instanceVariableNames: 'value withdrawLeg depositLeg'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Transfer methodsFor: 'value' stamp: 'LL 9/20/2020 21:13:00'!
value

	^value! !


!Transfer methodsFor: 'accessing' stamp: 'LL 9/20/2020 22:39:46'!
depositLeg

	^depositLeg! !

!Transfer methodsFor: 'accessing' stamp: 'LL 9/20/2020 21:25:56'!
withdrawLeg
	
	^withdrawLeg! !


!Transfer methodsFor: 'initialization' stamp: 'LL 9/20/2020 21:25:21'!
initializeWith: aValue withdrawLeg: aWithdraw depositLeg: aDeposit

	value := aValue.
	withdrawLeg := aWithdraw.
	depositLeg := aDeposit! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transfer class' category: 'ServiciosFinancieros-Solucion'!
Transfer class
	instanceVariableNames: ''!

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 22:57:30'!
cannotTransferToOriginErrorDescription
	
	^'Transfer destionation cannot be the origin account'! !

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 23:00:53'!
cannotTransferZeroErrorDescription

	^'Transfer amount should be positive'! !

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 22:56:35'!
signalCannotTransferToOrigin
	
	self error: self cannotTransferToOriginErrorDescription! !

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 23:06:17'!
signalCannotTransferZero

	self error: self cannotTransferZeroErrorDescription! !


!Transfer class methodsFor: 'assertions' stamp: 'LL 9/20/2020 23:05:22'!
assert: anAmountOfMoney canBeTransferedTo: destinationAccount from: originAccount

	self assertCanTransferTo: destinationAccount from: originAccount.
	self assertCanTransfer: anAmountOfMoney! !

!Transfer class methodsFor: 'assertions' stamp: 'LL 9/20/2020 23:11:50'!
assertCanTransfer: anAmountOfMoney

	^ anAmountOfMoney isZero ifTrue: [ self signalCannotTransferZero ]! !

!Transfer class methodsFor: 'assertions' stamp: 'LL 9/20/2020 23:04:58'!
assertCanTransferTo: destinationAccount from: originAccount

	^ originAccount = destinationAccount ifTrue: [ self signalCannotTransferToOrigin ]! !


!Transfer class methodsFor: 'instance creation' stamp: 'LL 9/20/2020 23:11:34'!
amount: anAmountOfMoney from: originAccount to: destinationAccount 
	
	| transfer depositLeg withdrawLeg |
	
	self assert: anAmountOfMoney canBeTransferedTo: destinationAccount from: originAccount.
	
	transfer := self new.
	
	withdrawLeg := TransferWithdrawLeg of: transfer on: originAccount.
	depositLeg := TransferDepositLeg of: transfer on: destinationAccount.
	
	^transfer initializeWith: anAmountOfMoney withdrawLeg: withdrawLeg depositLeg: depositLeg
	
	
	! !
