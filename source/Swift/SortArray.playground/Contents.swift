import UIKit

//: Array sort ascending order, descending order
var array = [40, 10, 20, 80, 100]
array.sort()
print(array)
array.reverse()
print(array)
       
//: Array sort descending order, return array
var arr = [40, 10, 20, 70, 100]
arr.sorted()
print(arr)

arr.sorted(by: <)

arr.sorted { (int1, int2) -> Bool in
  return int1 < int2
}
