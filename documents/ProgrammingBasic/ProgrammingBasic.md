# Programming Basic

## 용어정리

###  Token

* programming 언어를 구성하는 요소 중 공백이나, 구두점으로 분리할 수 없는 가장 기본적인 요소.
* 원자처럼 나눌 수 없는 단위임.

	```Swift
	2+3;
	2 + 3;
	```
위의 예에서 각각 4개의 Token으로 구성됨
identifire, keyword, punctuation, literal, operator 모두 Token임

### Expression

* 표현식 : 값, 변수, 연산자, 함수 등이 하나 이상 모여서 하나의 값으로 표현되는 코드
* 어떤 코드를 실행했을 때 하나의 결과가 도출된다면 그 코드를 표현식이라 함.
* 다양한 형태
* _표현식을 평가한다_ : 표현식을 통해 하나의 결과 값을 도출하는 것

	```Swift
	let a = 3
	a + 2	// 산술 표현식 (Arithmetic Expression)
	a < 5	// 논리 표현식 (Logic Expression or Boolean Expression)
	```

### Statements(구문)

* 구문(or 문장 or 문): 하나 이상의 표현식이 모여 특정 작업을 실행하는 코드
* 일반적인 문장의 끝에는 `;`이 붙으나, Swift의 경우엔 생략해서 사용함.

### Literals

* Literals: 코드 내에서 의미가 변하지 않고 있는 그대로 사용되는 값.
* Example

	```Swift
	let x = 3			// literal: 3
	let y = 5 + 7		// literals: 5, 7
	let x2 = x > 6		// literal: 6
	```
	- 3, 5, 7, 6 이 리터럴임

### Identifiers

* Identifire(식별자) : 코드에 표함된 요소를 구별하는데 사용하는 이름,
* 예) 변수이름, 형식이름, 함수의 이름

	```Swift
	let x = 7
	let number = 1
	let Number = 2
	let _Number = 3
	```
	- 식별자 : `x`, `number`, `Number`, `_Number`

### Keywords

* Keyword: Programming 언어가 제공하는 기능을 위해서 예약된 단어, 예약어(Reserved Words)라고 부르기도 함

	```Swift
	let x = 7
	var y = 3
	```
	- Keywords: `let`, `var`

* Swift에서 사용되는 Keywords

	```Swift
	associatedtype
	class
	deinit
	enum
	extension
	fileprivate
	func
	import
	init
	inout
	internal
	let
	open
	operator
	private
	protocol
	typealias
	var
	break
	do
	case
	continue
	default
	defer
	do
	else
	fallthrough
	for
	guard
	if
	in
	repeat
	return
	switch
	where
	while
	as
	Any
	catch
	false
	is
	nil
	rethrows
	true
	try
	#available
	#colorLiteral
	#column
	#else
	#elseif
	#endif
	#file
	#fileLiteral
	#function
	#if
	#imageLiteral
	#line
	#selector
	#sourceLocation
	associativity
	convenience
	dynamic
	didSet
	final
	get
	infix
	indirect
	lazy
	left
	mutating
	none
	nonmutatiing
	optional
	override
	postfix
	precedence
	prefix
	Protocol
	required
	right
	set
	Type
	unowned
	weak
	willSet
	```