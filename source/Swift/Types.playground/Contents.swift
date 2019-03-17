import UIKit

//: ## Type Conversion
var integer: Int = 100
var decimal: Double = 12.5
integer = Int(decimal)

//: ## Operators with mixed types
let hourlyRate: Double = 19.5
let hoursWorked: Int = 10
let totalCost: Double = hourlyRate * Double(hoursWorked)

//: ## Type inference
let typeInferredInt = 42
let typeInferredDouble = 3.14159

//: # String

//: ## Strings in Swift

//: ### Characters and strings

let characterA: Character = "a"
let characterDog: Character = "🐶"
let stringDog: String = "Dog"
let stringDog2 = "Dog"

//: ### Concatenation
var message = "Hello" + " my name is "
let name = "Matt"
message += name

let exclamationMark: Character = "!"
message += String(exclamationMark)

//: ### Interpolation
message = "Hello my name is \(name)!"

let oneThird = 1.0 / 3.0
let oneThirdLongString = "One third is \(oneThird) as a decimal."

let bigString = """
  You can have a string
  that contains multiple
  lines
  by
  doing this.
"""

print(bigString)

//: ## Tuples
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
