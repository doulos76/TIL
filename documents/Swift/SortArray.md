# Sort Array

* Array를 정렬할 때 `sort`와 `sortby`를 이용할 수 있다.
* `sort`는 주어진 array를 직접 정렬할 때 사용하고
* `sortby`는 별도의 array를 return 함

## Code

```Swift
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
```

![screen shot](/documents/Swift/images/sortArrayImage.png)
