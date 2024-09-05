import UIKit

/// creating key paths
struct Item {
    var name: String
    var price: Double
}
let keyPrice = \Item.price
let keyName = \Item.name

var purchase = Item(name: "Fan", price: 20.5)
purchase[keyPath: keyPrice] = 30
print(purchase[keyPath: keyPrice])
