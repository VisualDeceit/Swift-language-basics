import Foundation

// процент
let percent: Double = 17.8
//срок
let yearsCount = 12
//сумма
var amount: Double = 98280

for _ in 1...yearsCount {
    amount = amount * (1 + percent / 100 / 12)
    print(amount)
}
print("Сумма вклада через \(yearsCount) лет составит \(amount)")
