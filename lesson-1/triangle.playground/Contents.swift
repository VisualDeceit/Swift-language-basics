import Foundation

/*
        /|
       / |
      /  |
   c /   | b
    /    |
   /     |
  /      |
 /_______|
     a
 */

// дано
let a = 3
let b = 4

// гипотенуза
 let c = sqrt(Double(a * a) + Double(b * b))

// площадь
let area = Double(a) * Double(b) / 2

//периметр

let perimeter = Double(a) + Double(b) + c

print("a = \(a), b = \(b) c = \(c)")
print("area = \(area)")
print("perimeter = \(perimeter)")


