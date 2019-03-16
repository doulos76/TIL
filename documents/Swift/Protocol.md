# Protocol

## Protocol이란?

__Protocol__은 __특정 역할을 하기 위한 method, property, 기타 요구사항등의 청사진__을 정의함.

struct, class, enum은 protocol을 채택(adopted)해서 특정 기능을 실행하기 위한 protocol의 요구 사항을 실제로 구현할 수 있음. 
어떤 protocol의 요구사항을 모두 따르는 타입은 '해당 프로토콜을 준수한다(conform)'고 표현함. 

Type에서 protocol의 요구사항을 충족시키려면 protocol이 제시하는 청사진의 기능을 모두 구현해야 함. 

즉, __protocol은 정의를 하고 제시를 할 뿐, 스스로 기능을 구현하지 않음__.

## protocol 정의

`protocol` Keyword를 사용

> ```Swift
> protocol ProtocolName {
> 	protocol definition
> }

### example

* Type의 Protocol 채택

	```Swift
	struct SomeStruct: AProtocol, AnotherProtocol {
		// 구조체 정의
	}
	
	class SomeClass: AProtocol, AnotherProtocol {
		// class 정의
	}
	
	enum SomeEnum: AProtocol, AnotherProtocol {
		// Enum 정의
	}
	```
	
* SuperClass를 상속받는 Class의 Protocol 채택

	```Swift
	class SomeClass: SuperClass, AProtocol, AnotherProtocol {
		// class 정의
	}
	```

## Protocol 요구사항

Protocol은 type이 특정 기능을 실행하기 위해 필요한 기능을 요구함

protocol이 자신을 채택한 타입에 요구하는 사항을 proprety나 method와 같은 기능들임

### Property 요구

protocol은 자신을 채택한 Type이 어떤 property를 구현해야 하는 지 요구할 수 있음.

그 Property의 종류(연산 property, 저장 property 등)는 따로 신경 쓰지 않음

Property 이름, 타입, 읽기, 쓰기 구분 가능하게 정해야 함

* Property 요구

```Swift
protocol SomeProtocol {
	var settableProperty: String { get set }
	var notNeedToBeSettableProperty: String { get }
}

protocol AnotherProtocol {
	static var someTypeProperty: Int { get set }
	static var anotherTypeProperty: Int { get }
}
```

* Example

```Swift
protocol Sendable {
  var from: String { get }
  var to: String { get }
}

class Message: Sendable {
  var sender: String
  var from: String {
    return self.sender
  }
  
  var to: String
  
  init(sender: String, receiver: String) {
    self.sender = sender
    self.to = receiver
  }
}

class Mail: Sendable {
  var from: String
  var to: String
  
  init(sender: String, receiver: String) {
    self.from = sender
    self.to = receiver
  }
}
```

### Method 요구

```Swift
import UIKit

// 무언가를 수신 받을 수 있는 기능
protocol Receiveable {
  func received(data: Any, from: Sendable)
}

// 무언가를 발신할 수 있는 기능
protocol Sendable {
  var from: Sendable { get }
  var to: Receiveable? { get }
  
  func send(data: Any)
  
  static func isSendableInstance(_ instance: Any) -> Bool
}

class Message: Sendable, Receiveable {
  // 발신은 발신 가능한 객체, 즉 Sendable protocol을 준수하는 Type의 Instance여야 함.
  var from: Sendable {
    return self
  }
  
  // 상대방은 수신 가능한 객체, 즉 Receiveable protocol을 준수하는 Type의 Instance여야 함.
  var to: Receiveable?
  
  // 메시지를 발신합니다.
  func send(data: Any) {
    guard let receiver: Receiveable = self.to else {
      print("Message has no receiver")
      return
    }
    // 수신 가능한 인스턴스의 received 메서드를 호출합니다.
    receiver.received(data: data, from: self.from)
  }
  
  // 메시지를 수신합니다.
  func received(data: Any, from: Sendable) {
    print("Message received \(data) from \(from)")
  }
  
  // class 메서드이므로 상속이 가능합니다.
  class func isSendableInstance(_ instance: Any) -> Bool {
    if let sendableInstance: Sendable = instance as? Sendable {
      return sendableInstance.to != nil
    }
    return false
  }
  
}

class Mail: Sendable, Receiveable {
  var from: Sendable {
    return self
  }
  
  var to: Receiveable?
  
  func send(data: Any) {
    guard let receiver: Receiveable = self.to else {
      print("Mail has no receiver")
      return
    }
    receiver.received(data: data, from: self.from)
  }
  
  func received(data: Any, from: Sendable) {
    print("Mail received \(data) from \(from)")
  }
  
  // static 메서드이므로 상속이 불가능합니다.
  static func isSendableInstance(_ instance: Any) -> Bool {
    if let sendableInstance: Sendable = instance as? Sendable {
      return sendableInstance.to != nil
    }
    return false
  }
}


// 두 Message인스턴스를 생성함
let myPhoneMessage: Message = Message()
let yourPhoneMesage: Message = Message()

// 아직 수신받을 인스턴스가 없습니다.
myPhoneMessage.send(data: "Hello")

// Message 인스턴스는 발신과 수신이 모두 가능하므로 메시지를 주고 받을 수 있음
myPhoneMessage.to = yourPhoneMesage
myPhoneMessage.send(data: "Hello")

// 두 Mail 인스턴스를 생성함
let myMail: Mail = Mail()
let yourMail: Mail = Mail()

myMail.send(data: "Hi")

// Mail과 Message 모두 Sendable과 Receiveable 프로토콜을 준수하므로 서로 주고 받을 수 있음
myMail.to = yourMail
myMail.send(data: "Hi")

myMail.to = myPhoneMessage
myMail.send(data: "Bye")

// String은 Sendable protocol을 준수하지 않음
Message.isSendableInstance("Hello")

// Mail과 Message는 Sendable protocol을 준수함
Message.isSendableInstance(myPhoneMessage)

// yourPhoneMessage는 to property가 설정되지 않아서 보낼 수 없는 상태임
Message.isSendableInstance(yourPhoneMesage)
Mail.isSendableInstance(myPhoneMessage)
Mail.isSendableInstance(myMail)
```

> __Type으로서의 Protocol__
> 
> Protocol은 요구만 하고 스스로 기능을 구현하지 않음. 하지만 Protocol은 코드에서 완전한 하나의 type으로 사용되기에 여러 위치에서 protocol을 타입으로 사용할 수 있음
> 
> * 함수, 메서드, initializer에서의 매개변수 타입이나 반환 타입으로 사용될 수 있음
> * Property, var, let 등 
> * Array, dictionary등 container type

### 가변 메서드 요구

method가 instance내부의 값을 변경할 필요가 있을 때,

구조체와 열거형의 인스턴스 메서드에서 자신 내부의 값을 변경하고자 할 때는 메서드의 func 키워드 앞에 `mutating`키워드를 적어 메서드에서 인스턴스 내부의 값을 변경함.

참조 타입의 경우에는 명시하지 않음

```Swift
protocol Resettable {
  mutating func reset()
}

class Person: Resettable {

  var name: String?
  var age: Int?
  
  func reset() {
    self.name = nil
    self.age = nil
  }
}

struct Point: Resettable {
  var x: Int = 0
  var y: Int = 0
  
  mutating func reset() {
    self.x = 0
    self.y = 0
  }
}

enum Direction: Resettable {
  case east, west, south, north, unknown
  
  mutating func reset() {
    self = Direction.unknown
  }
}
```

### Initializer 요구

프로토콜에서 프로퍼티, 메서드 등과 같이 특정한 이니셜라이저를 요구할 수 있음.

정의만 하고 구현은 하지 않음.

```Swift
protocol Named {
  var name: String { get }
  
  init(name: String)
}

struct Pet: Named {
  var name: String
  
  init(name: String) {
    self.name = name
  }
}
```

```Swift
protocol Named {
  var name: String { get }
  
  init(name: String)
}

struct Pet: Named {
  var name: String
  
  init(name: String) {
    self.name = name
  }
}

class Person: Named {
  var name: String
  
  required init(name: String) {
    self.name = name
  }
}
```
class type에서 protocol의 생성자 요구에 부합하는 구현할 때는 `required` 식별자를 붙인 요구 이니셜라이저로 구현해야 함

상속 불가능한 클래스의 경우는 붙이지 않음

재정의의 경우엔 `override`를 추가로 붙임

실패가능한 이니셜라이져의 경우엔 프로토콜을 준수하는 타입은 실패가능한 생성자나 일반 생성자로 구현해도 무방함.


## Protocol의 상속과 class 전용 protocol

프로토콜의 상속 리스트에 `class` 키워드를 추가해 프로토콜이 클래스 타입에만 채택될 수 있도록 제한할 수도 있음.


## Protocol 조합과 Protocol 준수 확인

하나의 메개변수가 여러 프로토콜을 모두 준수하는 타입이어야 한다면 하나의 메개변수에 여러프로토콜을 한 번에 조합하여 요구할 수 있음

프로토콜을 조합하여 요구할 때는 `SomeProtocol & AnotherProtocol`과 같이 표현함

* `is` 연산자를 통해 해당 인스턴스가 특정 프로토콜을 준수하는지 확인 할 수 있음
* `as?` 다운캐스팅 연산자를 통해 다른 프로토콜로 다운캐스팅을 시도해볼 수 있음
* `as!` 다운캐스팅 연산자를 통해 다른 프로토콜로 강제 다운캐시팅을 할 수 있음

## Protocol의 선택적 요구

## Protocol 변수와 상수

## 위임을 위한 Protocol
