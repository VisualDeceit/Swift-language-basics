/*
 1. Реализовать свой тип коллекции «очередь» (queue) c использованием дженериков.
 2. Добавить ему несколько методов высшего порядка, полезных для этой коллекции (пример: filter для массивов)
 3. * Добавить свой subscript, который будет возвращать nil в случае обращения к несуществующему индексу.
 */
import Foundation

enum Gender {
    case male, female
}


protocol Human: AnyObject {
    var name: String { get set }
    var age: Int { get set }
    var gender : Gender { get }
    var weight: Int { get set }
    var height: Int {get set }
}


class Doctor: Human {
    enum Specialty {
        case immunologist, anesthesiologist, cardiologist, therapist
    }
    
    var name: String
    var age: Int
    var gender: Gender
    var weight: Int
    var height: Int
    var specialty: Specialty
    
    
    init(name: String, age: Int, gender: Gender, weight: Int, height: Int, specialty: Specialty) {
        self.name = name
        self.age = age
        self.gender = gender
        self.weight = weight
        self.height = height
        self.specialty = specialty
    }
    
}


class Driver: Human {
    enum Category {
        case A1, B1, C1, D1, BE, CE, DE, C1E, D1E
    }

    var name: String
    var age: Int
    var gender: Gender
    var weight: Int
    var height: Int
    var category: [Category]
    
    init(name: String, age: Int, gender: Gender, weight: Int, height: Int, category: [Category]) {
        
        self.name = name
        self.age = age
        self.gender = gender
        self.weight = weight
        self.height = height
        self.category = category
    }
    
}
    
    
class Programmer: Human {
    enum Skill {
        case junior, middle, senior
    }
    
    var name: String
    var age: Int
    var gender: Gender
    var weight: Int
    var height: Int
    var language: [String]
    var skill: Skill
    
    init(name: String, age: Int, gender: Gender, weight: Int, height: Int, language: [String], skill: Skill) {
        self.name = name
        self.age = age
        self.gender = gender
        self.weight = weight
        self.height = height
        self.language = language
        self.skill = skill
        }
    }

struct Queue<T>  {
    var queue: [T] = []
    
    mutating func push(_ persona: T) {
        queue.append(persona)
    }
    
    mutating func pop() -> T? {
        return queue.removeFirst()
    }
    
     func myFilter( closure: (T) -> Bool ) -> [T] {
        var tmpArray = [T]()
        for element in queue {
            if closure(element) {
                tmpArray.append(element)
            }
        }
        return tmpArray
    }
    
    func printElements(element: (T) -> String){
        var result = [String]()
        queue.forEach { (item) in
            result.append(element(item))
        }
        print(result)
       
    }
    
 
    subscript(index: Int) -> T? {
        
        if index > self.queue.count {
            return nil
        } else {
            return self.queue[index]
        }
    }
    
}
    
    



let doc1 = Doctor(name: "Alex",  age: 34, gender: .male, weight: 72, height: 175, specialty: .anesthesiologist)
let doc2 = Doctor(name: "Liza", age: 29, gender: .female, weight: 50, height: 165, specialty: .therapist)
let driver1 = Driver(name: "John", age: 59, gender: .male, weight: 85, height: 170, category: [.B1, .C1, .D1E])
let driver2 = Driver(name: "Boris", age: 45, gender: .male, weight: 79, height: 172, category: [.A1])
let progr1 = Programmer(name: "Serg", age: 23, gender: .male, weight: 68, height: 176, language: ["Swift"], skill: .junior)
let progr2 = Programmer(name: "Root", age: 30, gender: .female, weight: 70, height: 171, language: ["Swift","Delphi"], skill: .middle)

var queue = Queue<Human>()
queue.push(doc1)
queue.push(progr2)
queue.push(driver1)
queue.push(doc2)
queue.push(driver2)
queue.push(progr1)

queue.printElements { (value) -> String in
    value.name + " \(value.age)"
}

print(queue.myFilter { $0.age <= 30 })

print(queue.myFilter { (value) -> Bool in
    value.age > 30
})


queue.pop()

queue.printElements { (value) -> String in
    value.name + " \(value.age)"
}

print(queue[2]) //Driver
print(queue[10]) //nil


