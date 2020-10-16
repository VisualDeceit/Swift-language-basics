import Foundation

//Написать функцию, которая определяет, четное число или нет.

func isEven(_ number: Int) -> Bool{
    
    return number % 2 == 0 ? true : false
}

isEven(10)
isEven(7)


//Написать функцию, которая определяет, делится ли число без остатка на 3.

func isNoRest3Div( _ number: Int) -> Bool{  //true - делится без остатка
   
    if number % 3 == 0 {
        return true
    }
    return false

}

isNoRest3Div(6)
isNoRest3Div(11)

//Создать возрастающий массив из 100 чисел.

func generateCascadeArray( _ length: Int) -> [Int]? {
    
    if length == 0 {
       return nil
    }
    
    var array = [Int]()
    
    for i in 0..<length {
         array.append(i + 1)
    }
    
    return array
}

generateCascadeArray(0)
var array = generateCascadeArray(100)


//Удалить из этого массива все четные числа и все числа, которые не делятся на 3.

if var _array = array { // Опциональная привязка
    
    // решил все-таки сделать с for
    for (i, value) in _array.enumerated().reversed(){
       
        if isEven(value) || !isNoRest3Div(value){
            _array.remove(at: i)
            
        }
    }
array = _array
}

/* Написать функцию, которая добавляет в массив новое число Фибоначчи, и добавить при помощи нее 50 элементов.
 */


//классический вариант c рекурсией
func fib(_ n: Int) -> Int {
    if n <= 2 {
        return 1
    } else {
           return fib(n-1) + fib(n-2)
    }
}

//Оптимизированный итерационный подход
func fibOpt(_ n: Int) -> Int {
    var a = 1
    var b = 1
    
    if n <= 2 {
        return 1
    } else {
        for _ in 3...n {
            let c = a
            a += b
            b = c
        }
        
        return a
    }
}

func generateFibArray(_ length: Int) -> [Int]{
    
    var array = [Int]()
    
    for i in 1...length {
       // array.append(fib(i)) не дождался, только до 30 шага, пожалел мак)
        array.append(fibOpt(i))
    }
    return array
}

generateFibArray(50)

/*
 Заполнить массив элементов различными простыми числами. Натуральное число, большее единицы, называется простым, если оно делится только на себя и на единицу. Для нахождения всех простых чисел не больше заданного числа n (пусть будет 100), следуя методу Эратосфена, нужно выполнить следующие шаги:
 a. Выписать подряд все целые числа от двух до n (2, 3, 4, ..., n).
 b. Пусть переменная p изначально равна двум — первому простому числу.
 c. Зачеркнуть в списке числа от 2 + p до n, считая шагом p.
 d. Найти первое не зачёркнутое число в списке, большее, чем p, и присвоить значению переменной p это число.
 e. Повторять шаги c и d, пока возможно.

 
 */

func generatePrimeNumberArray(_ lenght: Int) -> [Int]{
    
    var sieve = Array(repeating: true, count: lenght)
    sieve.count
    
    for p in 2...lenght where p*p < lenght{
        if sieve[p] == true{
            for i in stride(from: p*p, to: lenght, by: p) {
            sieve[i] = false
            }
        }
    }
    
    var primes  = [Int]()
    for i in 2..<lenght{
        if sieve[i] == true {
            primes.append(i)
        }
    }

    return primes
}
generatePrimeNumberArray(100)





