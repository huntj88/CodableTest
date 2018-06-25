//
//  JsonPlayground.swift
//  codableTest
//
//  Created by James Hunt on 6/22/18.
//  Copyright © 2018 James Hunt. All rights reserved.
//

import Foundation


class DoStuff {
    
    let json = """
{
"name": "James",
"age": null,
}
"""
    
    func start() {
        let jsonData = json.data(using: .utf8)!
        let decoder = JSONDecoder()
        let person = try! decoder.decode(Person.self, from: jsonData)
        print(person)
    }
}

enum SafeError : Error {
    case errors
}

struct SafeInt: Codable {
    var value: Int
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.singleValueContainer()
        
        if let blah = SafeInt.checkForInt(container: container) {
            value = blah
        } else if let blah2 = SafeInt.checkForDouble(container: container) {
            value = blah2
        } else if let blah3 = SafeInt.checkForString(container: container) {
            value = blah3
        } else {
            throw SafeError.errors
        }
    }
        
    static func checkForInt(container: SingleValueDecodingContainer) -> Int? {
        return try? container.decode(Int.self)
    }
    
    static func checkForDouble(container: SingleValueDecodingContainer) -> Int? {
        if let blah = try? container.decode(Double.self).rounded(FloatingPointRoundingRule.toNearestOrEven) {
            return Int(blah)
        }
        
        return nil
    }
    
    static func checkForString(container: SingleValueDecodingContainer) -> Int? {
        if let blah = try? container.decode(String.self) {
            //todo if double, also round
            return Int(blah)
        }
        
        return nil
    }
}

struct Person: Codable {
    let name: String
    let age: SafeInt?
    
    enum CodingKeys : String, CodingKey {
        case name
        case age
    }
}



