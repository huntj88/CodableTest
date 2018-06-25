//
//  SafeDouble.swift
//  codableTest
//
//  Created by James Hunt on 6/25/18.
//  Copyright © 2018 James Hunt. All rights reserved.
//

import Foundation

struct SafeDouble: Codable {
    private let value: Double
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        
        if let jsonVal = SafeDouble.checkForDouble(container: container) {
            value = jsonVal
        } else if let jsonVal = SafeDouble.checkForString(container: container) {
            value = jsonVal
        } else {
            throw SafeError.errors
        }
    }
    
    private static func checkForDouble(container: SingleValueDecodingContainer) -> Double? {
        return try? container.decode(Double.self)
    }
    
    private static func checkForString(container: SingleValueDecodingContainer) -> Double? {
        guard let stringValue = try? container.decode(String.self) else { return nil }
        
        if let doubleFromString = Double(stringValue) {
            return doubleFromString
        } else {
            return nil
        }
    }
}

extension SafeDouble {
    // equality for SafeInt, SafeInt
    static func ==(lhs: SafeDouble, rhs: SafeDouble) -> Bool {
        return lhs.value == rhs.value
    }
    
    static func !=(lhs: SafeDouble, rhs: SafeDouble) -> Bool {
        return lhs.value != rhs.value
    }
    
    static func >=(lhs: SafeDouble, rhs: SafeDouble) -> Bool {
        return lhs.value >= rhs.value
    }
    
    static func <=(lhs: SafeDouble, rhs: SafeDouble) -> Bool {
        return lhs.value <= rhs.value
    }
    
    static func >(lhs: SafeDouble, rhs: SafeDouble) -> Bool {
        return lhs.value > rhs.value
    }
    
    static func <(lhs: SafeDouble, rhs: SafeDouble) -> Bool {
        return lhs.value < rhs.value
    }
    
    
    
    // math operators for SafeInt, SafeInt
    static func -(lhs: SafeDouble, rhs: SafeDouble) -> Double {
        return lhs.value - rhs.value
    }
    
    static func +(lhs: SafeDouble, rhs: SafeDouble) -> Double {
        return lhs.value + rhs.value
    }
    
    static func /(lhs: SafeDouble, rhs: SafeDouble) -> Double {
        return lhs.value / rhs.value
    }
    
    static func *(lhs: SafeDouble, rhs: SafeDouble) -> Double {
        return lhs.value * rhs.value
    }
    
    
    
    
    
    
    // math operators for SafeInt, Int
    static func +(lhs: Double, rhs: SafeDouble) -> Double {
        return lhs + rhs.value
    }
    
    static func +(lhs: SafeDouble, rhs: Double) -> Double {
        return lhs.value + rhs
    }
    
    static func -(lhs: Double, rhs: SafeDouble) -> Double {
        return lhs - rhs.value
    }
    
    static func -(lhs: SafeDouble, rhs: Double) -> Double {
        return lhs.value - rhs
    }
    
    static func /(lhs: Double, rhs: SafeDouble) -> Double {
        return lhs / rhs.value
    }
    
    static func /(lhs: SafeDouble, rhs: Double) -> Double {
        return lhs.value / rhs
    }
    
    static func *(lhs: Double, rhs: SafeDouble) -> Double {
        return lhs * rhs.value
    }
    
    static func *(lhs: SafeDouble, rhs: Double) -> Double {
        return lhs.value * rhs
    }
    
    
    
    // equality for SafeInt, Int
    static func ==(lhs: Double, rhs: SafeDouble) -> Bool {
        return lhs == rhs.value
    }
    
    static func ==(lhs: SafeDouble, rhs: Double) -> Bool {
        return lhs.value == rhs
    }
    
    static func !=(lhs: Double, rhs: SafeDouble) -> Bool {
        return lhs != rhs.value
    }
    
    static func !=(lhs: SafeDouble, rhs: Double) -> Bool {
        return lhs.value != rhs
    }
    
    static func >=(lhs: Double, rhs: SafeDouble) -> Bool {
        return lhs >= rhs.value
    }
    
    static func >=(lhs: SafeDouble, rhs: Double) -> Bool {
        return lhs.value >= rhs
    }
    
    static func <=(lhs: Double, rhs: SafeDouble) -> Bool {
        return lhs <= rhs.value
    }
    
    static func <=(lhs: SafeDouble, rhs: Double) -> Bool {
        return lhs.value <= rhs
    }
    
    static func >(lhs: Double, rhs: SafeDouble) -> Bool {
        return lhs > rhs.value
    }
    
    static func >(lhs: SafeDouble, rhs: Double) -> Bool {
        return lhs.value > rhs
    }
    
    static func <(lhs: Double, rhs: SafeDouble) -> Bool {
        return lhs < rhs.value
    }
    
    static func <(lhs: SafeDouble, rhs: Double) -> Bool {
        return lhs.value < rhs
    }
    
    
    // other safe types
    static func +(lhs: SafeDouble, rhs: SafeInt) -> Double {
        return lhs.value + Double(rhs + 0)
    }
    
    static func -(lhs: SafeDouble, rhs: SafeInt) -> Double {
        return lhs.value - Double(rhs + 0)
    }
    
    static func /(lhs: SafeDouble, rhs: SafeInt) -> Double {
        return lhs.value / Double(rhs + 0)
    }
    
    static func *(lhs: SafeDouble, rhs: SafeInt) -> Double {
        return lhs.value * Double(rhs + 0)
    }
}
