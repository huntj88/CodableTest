//
//  SafeBool.swift
//  codableTest
//
//  Created by James Hunt on 6/25/18.
//  Copyright © 2018 James Hunt. All rights reserved.
//

import Foundation

struct SafeBool: Codable {
    private let value: Bool
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        
        if let jsonVal = SafeBool.checkForBool(container: container) {
            value = jsonVal
        } else if let jsonVal = SafeBool.checkForString(container: container) {
            value = jsonVal
        } else {
            throw SafeError.errors
        }
    }
    
    private static func checkForBool(container: SingleValueDecodingContainer) -> Bool? {
        return try? container.decode(Bool.self)
    }
    
    private static func checkForString(container: SingleValueDecodingContainer) -> Bool? {
        guard let stringValue = try? container.decode(String.self).lowercased() else { return nil }
        
        switch stringValue {
            case "true":
                return true
            case "false":
                return false
            default:
                return nil
        }
    }
}

extension SafeBool {
    
    static func ==(lhs: SafeBool, rhs: SafeBool) -> Bool {
        return lhs.value == rhs.value
    }
    
    static func !=(lhs: SafeBool, rhs: SafeBool) -> Bool {
        return lhs.value != rhs.value
    }
    
    
    static func ==(lhs: Bool, rhs: SafeBool) -> Bool {
        return lhs == rhs.value
    }
    
    static func ==(lhs: SafeBool, rhs: Bool) -> Bool {
        return lhs.value == rhs
    }
    
    static func !=(lhs: Bool, rhs: SafeBool) -> Bool {
        return lhs != rhs.value
    }
    
    static func !=(lhs: SafeBool, rhs: Bool) -> Bool {
        return lhs.value != rhs
    }
}
