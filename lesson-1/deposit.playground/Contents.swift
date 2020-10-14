import Foundation

// процент
let percent: Double = 15
//срок
let yearsCount = 5
//сумма
var amount: Double = 10000

for _ in 1...yearsCount {
    amount = amount * (1 + percent / 100)
}
print("Сумма вклада через \(yearsCount) лет составит \(amount)")
