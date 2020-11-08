import Foundation

enum EngineState: String{
    case launched = "запущен"
    case stopped = "заглушен"
    
}

enum WindowState: String{
    case opened = "открыто"
    case closed = "закрыто"
    
}

enum WindowSide: Int{
    case left
    case right
    
    static let mapper: [WindowSide: String] = [
        .left: "левое",
        .right: "правое"
    ]
    
    var string: String {
        return WindowSide.mapper[self]!
    }
}

struct SportCar{
    
    let carBrand: String
    let issueYear: Int
    let trunkVolume: Int
    let engineState: EngineState
    
}

struct TrunkCar{
    
    let carBrand: String
    let issueYear: Int
    let maxTrunkVolume: Int
    var trunkVolume: Int
    var engineState: EngineState = .stopped{
        willSet{
            print(self.carBrand + ": двигатель \(newValue.rawValue)")
        }
    }
    
    var windowState  = [WindowState](repeating: .closed, count: 2){
        willSet{
            for i in (0...1){
                if self.windowState[i] != newValue[i] {
                    if let value = WindowSide(rawValue: i) {
                        print(self.carBrand + ": " + value.string + " окно \(newValue[i].rawValue)")
                        
                    }
            }
        }
     }
    }

    //если объявляешь свойство как private  то без инициалиизатора начинает ругаться
  /* init(carBrand: String, issueYear: Int, trunkVolume: Int = 0, maxTrunkVolume: Int = 20000) {
          self.carBrand = carBrand
          self.issueYear = issueYear
          self.trunkVolume = trunkVolume
          self.maxTrunkVolume = maxTrunkVolume
          
      }
    */
    
    mutating func launchEngine(){
        self.engineState = EngineState.launched
    }
    
    mutating func stopEngine(){
        self.engineState = EngineState.stopped
    }
    
    mutating func openWindow(_ side: WindowSide){
        self.windowState[side.rawValue] = .opened
    }
    
    mutating func closeWindow(_ side: WindowSide){
        self.windowState[side.rawValue] = .closed
    }
    
    mutating func upLoad (_ volume: Int) -> Int{
        guard volume + self.trunkVolume <= self.maxTrunkVolume else {
            self.trunkVolume = self.maxTrunkVolume
            return self.trunkVolume
        }
        self.trunkVolume += volume
        return self.trunkVolume
        
    }
    
    mutating func downLoad (_ volume : Int) -> Int{
        guard self.trunkVolume - volume >= 0 else {
            self.trunkVolume = 0
            return self.trunkVolume
        }
        self.trunkVolume -= volume
        return self.trunkVolume
    }
    
    func showStatus(){
        print ("""
                марка :  \(carBrand)
                год: \(issueYear)
                макс.загрузка: \(maxTrunkVolume)
                вес груза: \(trunkVolume)
                мотор: \(engineState.rawValue)
                окна: \(windowState[0...1])
            """)
    }
    // окна: \(windowState[0...1]) выводит  [__lldb_expr_21.WindowState.opened, __lldb_expr_21.WindowState.closed] - это нормально или можно как-то вывести в более читабельном виде?
    
    }

var firstTruck = TrunkCar(carBrand: "MAN", issueYear: 2020, maxTrunkVolume: 20000, trunkVolume: 0)
firstTruck.launchEngine()
firstTruck.openWindow(.left)
firstTruck.openWindow(.right)
firstTruck.closeWindow(.right)
firstTruck.upLoad(10000)
firstTruck.downLoad(3000)
firstTruck.showStatus()
firstTruck.upLoad(15000)
firstTruck.downLoad(40000)
firstTruck.stopEngine()

var secondTruck = TrunkCar(carBrand: "Scania", issueYear: 2019, maxTrunkVolume: 35000, trunkVolume: 0)
secondTruck.openWindow(.left)
secondTruck.showStatus()
