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
"num1": 6,
"num2": 5.6,
"num3": "5.6",
"num4": "6",
"num5": null,
"num6": "4.7",
"num7": 5.8,
"bool1": true,
"bool2": "False",
"bool3": null
}
"""
    func start() {
        
        let jsonData = json.data(using: .utf8)!
        let decoder = JSONDecoder()
        let person = try! decoder.decode(Person.self, from: jsonData)
        print(person)
        
        print(person.num1 - person.num3)
        print(person.num2 + 5)
        print(0.1 - person.num2 * 1.2)
        print(person.num6 + 2)
        print(person.num6 + person.num2)
        print(person.bool2 == false)
        
        let blah: Int = 0 + person.num1
    }
}

struct Person: Codable {
    let name: String
    let num1: SafeInt
    let num2: SafeInt
    let num3: SafeInt
    let num4: SafeInt
    let num5: SafeInt?
    let num6: SafeDouble
    let num7: SafeDouble
    let bool1: SafeBool
    let bool2: SafeBool
    let bool3: SafeBool?
}



