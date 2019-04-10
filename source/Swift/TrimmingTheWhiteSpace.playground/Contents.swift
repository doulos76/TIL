import UIKit

let str = "  Taylor Swift  "
let str2 = "Taylor\n Swift\r \n \t "
let trimmed = str.trimmingCharacters(in: .whitespacesAndNewlines)
print(trimmed)
