//
//  SafeInt.swift
//  codableTest
//
//  Created by James Hunt on 6/25/18.
//  Copyright © 2018 James Hunt. All rights reserved.
//

import Foundation

struct SafeInt: Codable {
    private let value: Int
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        
        if let jsonVal = SafeInt.checkForInt(container: container) {
            value = jsonVal
        } else if let jsonVal = SafeInt.checkForDouble(container: container) {
            value = jsonVal
        } else if let jsonVal = SafeInt.checkForString(container: container) {
            value = jsonVal
        } else {
            throw SafeError.errors
        }
    }
    
    private static func checkForInt(container: SingleValueDecodingContainer) -> Int? {
        return try? container.decode(Int.self)
    }
    
    private static func checkForDouble(container: SingleValueDecodingContainer) -> Int? {
        guard let blah = try? container.decode(Double.self) else { return nil }
        
        return roundDouble(value: blah)
    }
    
    private static func checkForString(container: SingleValueDecodingContainer) -> Int? {
        guard let stringValue = try? container.decode(String.self) else { return nil }
        
        if let doubleFromString = Double(stringValue) {
            return roundDouble(value: doubleFromString)
        } else if let intFromString = Int(stringValue) {
            return intFromString
        } else {
            return nil
        }
    }
    
    private static func roundDouble(value: Double) -> Int {
        return Int(value.rounded(FloatingPointRoundingRule.toNearestOrEven))
    }
}

extension SafeInt {
    // equality for SafeInt, SafeInt
    static func ==(lhs: SafeInt, rhs: SafeInt) -> Bool {
        return lhs.value == rhs.value
    }
    
    static func !=(lhs: SafeInt, rhs: SafeInt) -> Bool {
        return lhs.value != rhs.value
    }
    
    static func >=(lhs: SafeInt, rhs: SafeInt) -> Bool {
        return lhs.value >= rhs.value
    }
    
    static func <=(lhs: SafeInt, rhs: SafeInt) -> Bool {
        return lhs.value <= rhs.value
    }
    
    static func >(lhs: SafeInt, rhs: SafeInt) -> Bool {
        return lhs.value > rhs.value
    }
    
    static func <(lhs: SafeInt, rhs: SafeInt) -> Bool {
        return lhs.value < rhs.value
    }
    
    
    
    // math operators for SafeInt, SafeInt
    static func -(lhs: SafeInt, rhs: SafeInt) -> Int {
        return lhs.value - rhs.value
    }
    
    static func +(lhs: SafeInt, rhs: SafeInt) -> Int {
        return lhs.value + rhs.value
    }
    
    static func /(lhs: SafeInt, rhs: SafeInt) -> Int {
        return lhs.value / rhs.value
    }
    
    static func *(lhs: SafeInt, rhs: SafeInt) -> Int {
        return lhs.value * rhs.value
    }
    
    
    
    
    
    
    // math operators for SafeInt, Int
    static func +(lhs: Int, rhs: SafeInt) -> Int {
        return lhs + rhs.value
    }
    
    static func +(lhs: SafeInt, rhs: Int) -> Int {
        return lhs.value + rhs
    }
    
    static func -(lhs: Int, rhs: SafeInt) -> Int {
        return lhs - rhs.value
    }
    
    static func -(lhs: SafeInt, rhs: Int) -> Int {
        return lhs.value - rhs
    }
    
    static func /(lhs: Int, rhs: SafeInt) -> Int {
        return lhs / rhs.value
    }
    
    static func /(lhs: SafeInt, rhs: Int) -> Int {
        return lhs.value / rhs
    }
    
    static func *(lhs: Int, rhs: SafeInt) -> Int {
        return lhs * rhs.value
    }
    
    static func *(lhs: SafeInt, rhs: Int) -> Int {
        return lhs.value * rhs
    }
    
    
    
    // equality for SafeInt, Int
    static func ==(lhs: Int, rhs: SafeInt) -> Bool {
        return lhs == rhs.value
    }
    
    static func ==(lhs: SafeInt, rhs: Int) -> Bool {
        return lhs.value == rhs
    }
    
    static func !=(lhs: Int, rhs: SafeInt) -> Bool {
        return lhs != rhs.value
    }
    
    static func !=(lhs: SafeInt, rhs: Int) -> Bool {
        return lhs.value != rhs
    }
    
    static func >=(lhs: Int, rhs: SafeInt) -> Bool {
        return lhs >= rhs.value
    }
    
    static func >=(lhs: SafeInt, rhs: Int) -> Bool {
        return lhs.value >= rhs
    }
    
    static func <=(lhs: Int, rhs: SafeInt) -> Bool {
        return lhs <= rhs.value
    }
    
    static func <=(lhs: SafeInt, rhs: Int) -> Bool {
        return lhs.value <= rhs
    }
    
    static func >(lhs: Int, rhs: SafeInt) -> Bool {
        return lhs > rhs.value
    }
    
    static func >(lhs: SafeInt, rhs: Int) -> Bool {
        return lhs.value > rhs
    }
    
    static func <(lhs: Int, rhs: SafeInt) -> Bool {
        return lhs < rhs.value
    }
    
    static func <(lhs: SafeInt, rhs: Int) -> Bool {
        return lhs.value < rhs
    }
    
    
    // other safe types
    static func +(lhs: SafeInt, rhs: SafeDouble) -> Double {
        return Double(lhs + 0) + rhs
    }
    
    static func -(lhs: SafeInt, rhs: SafeDouble) -> Double {
        return Double(lhs + 0) - rhs
    }
    
    static func /(lhs: SafeInt, rhs: SafeDouble) -> Double {
        return Double(lhs + 0) / rhs
    }
    
    static func *(lhs: SafeInt, rhs: SafeDouble) -> Double {
        return Double(lhs + 0) * rhs
    }
    
    
    //other types
    static func +(lhs: SafeInt, rhs: Double) -> Double {
        return Double(lhs + 0) + rhs
    }
    
    static func -(lhs: SafeInt, rhs: Double) -> Double {
        return Double(lhs + 0) - rhs
    }
    
    static func /(lhs: SafeInt, rhs: Double) -> Double {
        return Double(lhs + 0) / rhs
    }
    
    static func *(lhs: SafeInt, rhs: Double) -> Double {
        return Double(lhs + 0) * rhs
    }
    
    static func +(lhs: Double, rhs: SafeInt) -> Double {
        return lhs + (rhs + 0)
    }
    
    static func -(lhs: Double, rhs: SafeInt) -> Double {
        return lhs - (rhs + 0)
    }
    
    static func /(lhs: Double, rhs: SafeInt) -> Double {
        return lhs / (rhs + 0)
    }
    
    static func *(lhs: Double, rhs: SafeInt) -> Double {
        return lhs * (rhs + 0)
    }
}
