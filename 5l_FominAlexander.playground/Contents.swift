//:1. Создать протокол «Car» и описать свойства, общие для автомобилей, а также метод действия.
//:2. Создать расширения для протокола «Car» и реализовать в них методы конкретных действий с автомобилем: открыть/закрыть окно, запустить/заглушить двигатель и т.д. (по одному методу на действие, реализовывать следует только те действия, реализация которых общая для всех автомобилей).
//:3. Создать два класса, имплементирующих протокол «Car» - trunkCar и sportСar. Описать в них свойства, отличающиеся для спортивного автомобиля и цистерны.
//:4. Для каждого класса написать расширение, имплементирующее протокол CustomStringConvertible.
//:5. Создать несколько объектов каждого класса. Применить к ним различные действия.
//:6. Вывести сами объекты в консоль.

import Foundation

enum WindowsState {
    case opened, closed
}

enum EngineState {
        case launched, stoped
    }

    
protocol Car: AnyObject {
    
    var engineState: EngineState { get set }
    var windowsState: WindowsState { get set }
    var headlightsState : Bool { get set }
    
}

extension Car {
     func changeEngineState(state: EngineState)  {
        engineState = state
    }
    
     func changeWindowsState(state: WindowsState) {
       windowsState = state
    }
    
     func switchHeadlights() {
        headlightsState.toggle()
    }
}

class SportCar: Car {
    var engineState: EngineState
    var windowsState: WindowsState
    var headlightsState: Bool
    var hp: Int
    var topSpeed: Int
    
    init(engineState: EngineState, windowsState: WindowsState, headlightsState: Bool, hp: Int, topSpeed: Int) {
        self.engineState = engineState
        self.windowsState = windowsState
        self.headlightsState = headlightsState
        self.hp = hp
        self.topSpeed = topSpeed
    }
}

extension SportCar: CustomStringConvertible {
    var description: String {
        return "sport car - engine: \(engineState), windows: \(windowsState), headlights: \(headlightsState), hp: \(hp), top speed: \(topSpeed)"
    }
}

class TruckCar: Car {
    var engineState: EngineState
    var windowsState: WindowsState
    var headlightsState: Bool
    var maxWeight: Int
    var tankVolume: Int
    
    init(engineState: EngineState, windowsState: WindowsState, headlightsState: Bool, maxWeight: Int, tankVolume: Int) {
        self.engineState = engineState
        self.windowsState = windowsState
        self.headlightsState = headlightsState
        self.maxWeight = maxWeight
        self.tankVolume = tankVolume
    }

}

extension TruckCar: CustomStringConvertible{
    var description: String {
        return "truck car - engine: \(engineState), windows: \(windowsState), headlights: \(headlightsState), max Weight: \(maxWeight), tank Volume: \(tankVolume)"
    }
}

var truck1 = TruckCar(engineState: .stoped, windowsState: .closed, headlightsState: false, maxWeight: 12000, tankVolume: 5000)
var car1 =  SportCar(engineState: .stoped, windowsState: .closed, headlightsState: false, hp: 450, topSpeed: 320)

truck1.switchHeadlights()
truck1.changeEngineState(state: .launched)
truck1.changeWindowsState(state: .opened)
print(truck1.description)
print(car1.description)

