
/*
 1. Придумать класс, методы которого могут завершаться неудачей и возвращать либо значение, либо ошибку Error?. Реализовать их вызов и обработать результат метода при помощи конструкции if let, или guard let.
  2. Придумать класс, методы которого могут выбрасывать ошибки. Реализуйте несколько throws-функций. Вызовите их и обработайте результат вызова при помощи конструкции try/catch.
 */

import Foundation


enum ErrorList: Error {
    case discrLessThanZero, notQuadratic, noRoots
}



class Quadratic {
    let a: Double
    let b: Double
    let c: Double
    
    init(a: Double, b: Double, c: Double) {
        self.a = a
        self.b = b
        self.c = c
    }
    
    private func calcDiscrimenant() throws -> Double {
        let discr = b * b - 4 * a * c
        if discr < 0 {
            throw ErrorList.discrLessThanZero
        }
        return discr
    }
    
    func calcRoots() throws -> (Double?, Double?) {
        //как я понял это имелось ввиду под первым пунктом
        if let discr = try? calcDiscrimenant() {
            if a == 0 {
                throw ErrorList.notQuadratic
            }
            if discr == 0 {
                let x1 = (-1 * b) / 2 / a
                return (x1,nil)
            } else
            {
                let x1 = (-1 * b + sqrt(discr)) / 2 / a
                let x2 = (-1 * b - sqrt(discr)) / 2 / a
                return (x1, x2)
            }
        }
        throw ErrorList.noRoots
    }
    
}

let quadratic = Quadratic(a: 0, b: 2, c: 5)

do {
    let x = try quadratic.calcRoots()
    print(x)
} catch ErrorList.notQuadratic {
    print("Это не квадратное уравнение")
} catch ErrorList.noRoots {
    print("Нет корней")
}



