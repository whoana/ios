import UIKit

var str = "Hello, playground"

print("Hello teo")

/// Optional Chain example :
struct Person {
    var age: Int
    var residence: Residence?
}

struct Residence {
    var address: Address?
}

struct Address {
    var buildingNumber: String
    var street: String
    var apartmentNumber: String?
}
var address = Address(buildingNumber: "333", street: "supungro", apartmentNumber: "202-703")
var residence = Residence(address: address)
var whoana = Person(age: 50, residence:residence)

if let num = whoana.residence?.address?.apartmentNumber {
    print("whoana's residence address apartmentNumber: \(num)" )
} else {
    print("whoana's residence address apartmentNumber none" )
}
 

