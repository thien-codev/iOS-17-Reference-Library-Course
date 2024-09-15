import UIKit

// MARK:  get & set

struct Currency {
    var value: Double
    var quantity: Int
    
    var rate: Double {
        get {
            return value / Double(quantity)
        }
        set(newRate) {
            value = newRate * Double(quantity)
        }
    }
    
    var didSetVar: Double {
        didSet(newValue) {
            didSetVar = newValue + 1
        }
    }
}

var currency = Currency(value: 12,
                        quantity: 4, 
                        didSetVar: 3)

currency.rate = 2

print(currency.value)

currency.didSetVar = 7.0

print("didSet ", currency.didSetVar)
