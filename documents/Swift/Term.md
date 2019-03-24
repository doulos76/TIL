# Terms

## Token

keyword, identifier, constant, literial과 같이 문법적으로 더 이상 나눌 수 없는 가장 기본적인 요소

> ```2 + 3;```

4개의 token으로 구성

## Expression

값, 변수, 연산자, 함수 등이 모여 하나의 값으로 표현되는 코드를 표현식(Expression)이라고 함.

> x
> 
> x + 1
> 
> x > 10
> 

* lvalue: 표현식 중 메모리 공간을 가리키는 표현식
* rvalue: 특정 위치에 저장될 데이터를 나타내는 표현식

## 문장(Statement)

하나 이사으이 푯현식이 모여 명령을 실행하는 코드를 문장(Statement) 또는 구문이라고 함

## 리터럴

코드 내에서 의미가 변하지 않는 값
ex) 숫자 1, 영문자 a 등


## Comment

코드 문서화 : Programmer가 프로젝트를 진행하는 동안 가장 적은 시간을 투자하는 작업 

### Single line comment

* 한 줄 주석은 `//`뒤에 오는 모든 내용을 주석으로 처리

> ```
>// Single Line Comment
> int a = 0	// Integer Variable
> 
> ```

### Inline Comment

> ```
> int a = /* Inline Comment */ 0;
> ```

### BLock Comment

두 줄 이상의 라인을 주석으로 처리할 때 사용

>```
>/* Multi-line
>
>Comment */
>
>```


## 식별자(Identifier)

변수, 자료형, 함수 등의 요소를 구분하기 위해 사용하는 토큰

## 예약어( 또는 키워드)

프로그래밍 언어에서 사용용도가 미리 지정된 단어를 예약어(Reserved World) 또는 키워드(Keyword)라고 부름

>```SWift
>let x = 7
>```

* Swift Keyword

>Keywords used in declarations: associatedtype, class, deinit, enum, extension, fileprivate, func, import, init, inout, internal, let, open, operator, private, protocol, public, static, struct, subscript, typealias, and var.
>Keywords used in statements: break, case, continue, default, defer, do, else, fallthrough, for, guard, if, in, repeat, return, switch, where, and while.
>Keywords used in expressions and types: as, Any, catch, false, is, nil, rethrows, super, self, Self, throw, throws, true, and try.
>Keywords used in patterns: _.
>Keywords that begin with a number sign (#): #available, #colorLiteral, #column, #else, #elseif, #endif, #error, #file, #fileLiteral, #function, #if, #imageLiteral, #line, #selector, #sourceLocation, and #warning.
>Keywords reserved in particular contexts: associativity, convenience, dynamic, didSet, final, get, infix, indirect, lazy, left, mutating, none, nonmutating, optional, override, postfix, precedence, prefix, Protocol, required, right, set, Type, unowned, weak, and willSet. Outside the context in which they appear in the grammar, they can be used as identifiers.
>

## 선언과 정의

코드에서 사용할 요소는 반드시 선언(Declaration)을 통해 이름과 성격을 지정해야 함
선언은 컴파일러가 해당 요소를 인식할 수 있게함

함수의 경우 함수의 이름, 리턴형, 파라미터를 선언한 후 함수에서 실행한 코드를 정의(Definition)해야 함, 정의는 선언된 요소와 메모리 공간을 연결함.

## Initialization

변수나 상수의 값을 의미 있는 값으로 설정하는 것을 초기화라고 함
초기화 되지 않은 값을 사용할 경우 오류가 발생할 가능성이 크기 때문에 모든 요소는 사용 전에 반드시 초기화 되어야 함

## Bit

0 또는 1을 저장할 수 있는 데이터 단위 또는 메모리 공간의 크기

## Byte

8개의 비트가 모여 하나의 바인트를 구성함, 바이트는 하나의 아스키 문자를 저장할 수 있고 프로그래밍 언어에서 데이터를 처리하는 기본 단위로 사용됨

## Compile

Compile은 일반적인 텍스트로 작성된 소스 코드를 컴퓨터가 해석할 수 있는 기계어로 변환하는 과정, 

변환된 이진 코드를 목적 파일이라고 함.

이 과정을 수행하는 것은 컴파일러임

Swift는 LLVM 컴파일러를 사용함

## Link

compiler를 통해 생성된 이진 코드에 라이브러리를 연결하고 실행파일을 생성하는 과정

이 과정을 담당하는 것은 Linker임

대부분의 컴파일러는 링커를 내장하고 있기 때무에 컴파일이 완료된 후 링크를 자동적으로 수행함

링크가 정상적으로 완료되면 실행 가능한 파일이 생성됨.

## Build

compile과 링크를 하나의 작업으로 묶어서 수행하는 것
IDE에 따라서 빌드 과정에 정적 분석, 단위 테스트, 설치 파일 생성 등 부가적인 작업이 추가되기도 함

## Debug mode, Release Mode

* Debug mode : 주로 프로그램 개발과정에서 사용, Object file이나 Execute file에 디버깅을 위한 정보가 추가 되어 파일 크기가 커짐. 추가된 정보를 통해 프로그램의 문제점을 비교적 쉽게 발견할 수 있음
* Release Mode : 프로그램 개발이 왼료된 후 User들에게 배포하거나 판매할 프로그램을 생성하는데 사용됨, debug 정보가 추가되지 않아 비교적 크기가 작음, release mode에서 최적화를 수행하기 때문에 생성된 실행 파일이 더 빠르게 동작함.

## Debugging

Source code에 존재하는 문법적, 논리적 오류를 발견하고 수정하는 과정임. 배부분의 개발 툴은 디버깅에 도움을 주는 디버거를 내장하고 있으며 특정 시점의 변수 값을 확인하거나 Breakpoint를 통해 프로그램의 실행 상태를 제어할 수 있음

## Compile Time, Runtime

* Compile Time: 소스 코드를 작성하는 시점부터 컴파일이 완료되기까지의 기간
* Runtime: 프로그램이 실제 디바이스 또는 IDE가 제공하는 시뮬레이터에서 실행되고 있는 기간


## Cocoa

Apple이 제공하는 OOP개발환경. 

## Framework

특정 OS 또는 개발 환경에서 프로그램을 개발하는데 사용하는 class와 library 집합. 프로그래머는 프로그램을 구성하는 모든 기능을 직접 구현하지 않고 프래임워크가 제공하는 API를 활용함.

## API(Application Programming Interface)

OS와 프로그래밍 언어, 프레임워크가 제공하는 메서드.

## First-class Citizen

First-class Citizen은 프로그래밍 요소 중 다음 조건을 만족하는 요소를 의미

1. 변수와 상수로 저장할 수 있음
2. 파라미터로 전달할 수 있음
3. 리턴 값으로 사용할 수 있음
























