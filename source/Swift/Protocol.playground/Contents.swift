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


//protocol Resettable {
//  mutating func reset()
//}
//
//class Person: Resettable {
//
//  var name: String?
//  var age: Int?
//
//  func reset() {
//    self.name = nil
//    self.age = nil
//  }
//}
//
//struct Point: Resettable {
//  var x: Int = 0
//  var y: Int = 0
//
//  mutating func reset() {
//    self.x = 0
//    self.y = 0
//  }
//}
//
//enum Direction: Resettable {
//  case east, west, south, north, unknown
//
//  mutating func reset() {
//    self = Direction.unknown
//  }
//}

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
