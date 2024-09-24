import UIKit
import RegexBuilder

// MARK: Rex
// example: /Name: \s+[a-zA-Z]+/
// \s+: the string must be followed one or more spaces

// single value name
//let string = "Name: John"
//let rexPattern = /Name:\s+[a-zA-Z]+/
//
//if let match = string.firstMatch(of: rexPattern) {
//    print(match.output)
//}

// multi value name
//let string = "Name: John"
//let rexPattern = /Name:\s+([a-zA-Z]+)/
//
//if let match = string.firstMatch(of: rexPattern) {
//    print(match.output)
//}

// MARK: Regex builder

//let regex = Regex {
//    "Name:"
//    OneOrMore(.whitespace)
//    OneOrMore {
//        CharacterClass("a"..."z", "A"..."Z")
//    }
//}
//
//let message = "Name: John"
//let match = message.matches(of: regex)
//print(match.first?.output)

//let message = "09 units, stock 190"
//let regex = Regex {
//    Capture {
//        OneOrMore(.digit)
//    } transform: { value in
//        Int(value)
//    }
//    
//    OneOrMore(.any, .reluctant)
//    
//    Capture {
//        OneOrMore(.digit)
//    } transform: { value in
//        Int(value)
//    }
//}
//
//let result = message.matches(of: regex)
//
//if let units = result.first?.output.1, let stock = result.first?.output.2 {
//    let total = units + stock
//}

var a = [1, 2, 3, 4, 5]

a.insert(6, at: 5)

print(a)
