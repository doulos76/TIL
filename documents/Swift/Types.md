# Types

A __Type__ describes a set of values and the operations that can be performed on them.

## Type conversion

```Swift
var integer: Int = 100
var decimal: Double = 12.5
integer = decimal
=======================
error: Types.playground:5:11: error: cannot assign value of type 'Double' to type 'Int'
integer = decimal
          ^~~~~~~
          Int(   )
```

```Swift
var integer: Int = 100
var decimal: Double = 12.5
integer = Int(decimal)
```

## Operators with mixed types

```Swift
let hourlyRate: Double = 19.5
let hoursWorked: Int = 10
let totalCost: Double = hourlyRate * hoursWorked

==========================

error: Types.playground:3:36: error: binary operator '*' cannot be applied to operands of type 'Double' and 'Int'
let totalCost: Double = hourlyRate * hoursWorked
                        ~~~~~~~~~~ ^ ~~~~~~~~~~~
                                     Double(    )

Types.playground:3:36: note: expected an argument list of type '(Double, Double)'
let totalCost: Double = hourlyRate * hoursWorked
```

```Swift
let hourlyRate: Double = 19.5
let hoursWorked: Int = 10
let totalCost: Double = hourlyRate * Double(hoursWorked)
```

## Type inference

```Swift
let typeInferredInt = 42
let typeInferredDouble = 3.14159
```

# Strings

## Characters and strings

```Swift
let characterA: Character = "a"
let characterDog: Character = "🐶"
let stringDog: String = "Dog"
let stringDog2 = "Dog"
```

## Concatenation

```Swift
var message = "Hello" + " my name is "
let name = "Matt"
message += name
=======================
"Hello my name is Matt"
```

```Swift
let exclamationMark: Character = "!"
message += String(exclamationMark)
=======================
"Hello my name is Matt!"
```

## Interpolation

```Swift
message = "Hello my name is \(name)!"
===================
"Hello my name is Matt!"
```

```Swift
let oneThird = 1.0 / 3.0
let oneThirdLongString = "One third is \(oneThird) as a decimal."
====================
"One third is 0.3333333333333333 as a decimal."
```

## Multi-line strings

```Swift
let bigString = """
  You can have a string
  that contains multiple
  lines
  by
  doing this.
"""

print(bigString)

==================
  You can have a string
  that contains multiple
  lines
  by
  doing this.
```


## Tuples

```Swift
let coordinates: (Int, Int) = (2, 3)
let coordinates2 = (2, 3)
let coordinatesDouble = (2.1, 3.5)
let coordinatesMixed = (2.1, 3)

let x1 = coordinates.0
let y1 = coordinates.1

let coordinatesNamed = (x: 2, y: 3)

let x2 = coordinatesNamed.x
let y2 = coordinatesNamed.y

let coordinates3D = (x: 2, y: 3, z: 1)
let (x3, y3, ze) = coordinates3D
let x4 = coordinates3D.x
let y4 = coordinates3D.y
let z4 = coordinates3D.z

let (x5, y5, _) = coordinates3D
```
