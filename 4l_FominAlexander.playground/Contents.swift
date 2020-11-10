import Foundation

class Car{
    
    let brand: String
    let year: Int
    let power: Int

    init(brand : String, year: Int, power: Int) {
        self.brand = brand
        self.year = year
        self.power = power
    }
    
    func launchEngine(){
        print("Запуск мотора")
    }
    
}

class SportCar: Car{
    enum TyreType: String{
        case super_soft, soft, medium, hard
    }
    
    var tyreType: TyreType
    
    //подчеркивания просто поставил для себя, чтобы лучше понимать что куда передается
    init(_brand : String, _year: Int, _power: Int, _tyreType: TyreType) {
        self.tyreType = _tyreType
        super.init(brand: _brand, year: _year, power: _power)
    }
    
    func changeTyre(tyre: TyreType) {
        self.tyreType = tyre
        print("Шины заменены на " + self.tyreType.rawValue)
    }
    
    override func launchEngine() {
        super.launchEngine()
        print("Начало диагностики")
    }
    
}

class TruckCar: Car{
    
    let truckVolumeMax: Int
    var truckVolume: Int = 0
    
    
    init(_brand : String, _year: Int, _power: Int, _truckVolumeMax: Int) {
        self.truckVolumeMax = _truckVolumeMax
        super.init(brand: _brand, year: _year, power: _power)
        
    }
    
    func upLoad (_ volume: Int){
        volume + self.truckVolume <= self.truckVolumeMax ? self.truckVolume += volume : print("Перегруз!")
        
    }
    
    func downLoad (_ volume : Int){
        self.truckVolume - volume >= 0 ? self.truckVolume -= volume : (self.truckVolume = 0)
    }
    
    override func launchEngine() {
        print("Прокачка масла")
        super.launchEngine()
    }
}

let sportCar1 = SportCar(_brand: "Porsche", _year: 2019, _power: 320, _tyreType: .medium)
let sportCar2 = SportCar(_brand: "Aston Martin", _year: 2017, _power: 419, _tyreType: .hard)
sportCar1.launchEngine()
sportCar1.changeTyre(tyre: .soft)

let truckCar1 = TruckCar(_brand: "MAN", _year: 2000, _power: 540, _truckVolumeMax: 12000)
let truckCar2 = TruckCar(_brand: "Mercedes", _year: 2003, _power: 530, _truckVolumeMax: 11500)
truckCar1.launchEngine()
truckCar1.upLoad(6400)
truckCar2.upLoad(9765)









