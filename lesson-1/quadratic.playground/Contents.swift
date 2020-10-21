import Foundation

//ax^2 + bx + c = 0
//переменные сразу определяю как double чтобы не возиться с преобразованием
let a: Double = 3
let b: Double = -14
let c: Double = -5

pow(5, 2)

//вывод уравнения
let equation: String = "\(a) * x^2" + (b>0 ? " + " : " - ") + "\(abs(b)) * x" + (c>0 ? " + " : " - ") + "\(abs(c)) = 0"
print(equation)

// дискриминант
let discr = b * b - 4 * a * c
//let discr = pow(b, 2) - 4 * a * c // pow навреное будет работать медленнее


//корни
if discr > 0 {
    //2 корня
    let x1 = (-1 * b + sqrt(discr)) / 2 / a
    print("x1 = \(x1)")
    
    let x2 = (-1 * b - sqrt(discr)) / 2 / a
    print("x2 = \(x2)")
    
} else if discr == 0 {
    // 1 корень
    let x1 = (-1 * b) / 2 / a
    print("x = \(x1)")
    
} else {
    print("Нет корней")
}

