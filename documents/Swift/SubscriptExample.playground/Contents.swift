import UIKit

class MyClass {
  let data = ["iPhone", "iPad", "iPod", "Mac Pro"]
  
  subscript(index: Int) -> String {
    return data[index]
  }
}

let myClass = MyClass()
print(myClass.data[0])
print(myClass.data[1])
print(myClass.data[2])
print(myClass.data[3])


struct TimesTable { // 구구단!
  let multiplier: Int
  subscript(index: Int) -> Int {
    return multiplier * index
  }
}
let threeTimesTable = TimesTable(multiplier: 3)
print("six times three is \(threeTimesTable[6])")

