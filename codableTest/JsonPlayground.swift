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
"num5": null
}
"""
    
    func start() {
        
        let jsonData = json.data(using: .utf8)!
        let decoder = JSONDecoder()
        let person = try! decoder.decode(Person.self, from: jsonData)
        print(person)
        
        let blahNum = person.num1 - person.num3
        
        let blahNum2 = person.num2 + 5
    
    }
}



struct Person: Codable {
    let name: String
    let num1: SafeInt
    let num2: SafeInt
    let num3: SafeInt
    let num4: SafeInt
    let num5: SafeInt?
    
    enum CodingKeys : String, CodingKey {
        case name
        case num1
        case num2
        case num3
        case num4
        case num5
    }
}



