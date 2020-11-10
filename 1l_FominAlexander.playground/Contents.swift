import Foundation


//1. Решить квадратное уравнение.
let a: Double = 3
let b: Double = -14
let c: Double = -5

//вывод уравнения
let equation: String = "\(a) * x^2" + (b>0 ? " + " : " - ") + "\(abs(b)) * x" + (c>0 ? " + " : " - ") + "\(abs(c)) = 0"
print(equation)

let discr = b * b - 4 * a * c

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

//2. Даны катеты прямоугольного треугольника. Найти площадь, периметр и гипотенузу треугольника.
let a1 = 3
let b1 = 4
let c1 = sqrt(Double(a1 * a1) + Double(b1 * b1))
let area = Double(a1) * Double(b1) / 2
let perimeter = Double(a1) + Double(b1) + c1

print("a = \(a1), b = \(b1) c = \(c1)")
print("area = \(area)")
print("perimeter = \(perimeter)")

//3. * Пользователь вводит сумму вклада в банк и годовой процент. Найти сумму вклада через 5 лет.
let percent: Double = 15
let yearsCount = 5
var amount: Double = 10000

for _ in 1...yearsCount {
    amount = amount * (1 + percent / 100)
}

func formatMoney(_ val:Double) -> String {
  let nf = NumberFormatter()
    nf.numberStyle = .currency
    nf.locale = Locale(identifier: "ru_RU")
    nf.currencyGroupingSeparator = ""
    nf.minimumIntegerDigits = 1
    return nf.string(from: NSNumber(value: val)) ?? ""
}

print("Сумма вклада через \(yearsCount) лет составит " + formatMoney(amount))
