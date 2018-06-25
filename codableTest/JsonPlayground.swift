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
"num6": "4.7"
}
"""
    
    func start() {
        
        let jsonData = json.data(using: .utf8)!
        let decoder = JSONDecoder()
        let person = try! decoder.decode(Person.self, from: jsonData)
        print(person)
        
        //let blahNum = person.num1 - person.num3
        
        //let blahNum2 = person.num2 + 5
    
        let addCheck = 0.1 - person.num2 * 1.2
        
        let addCheck1 = person.num6 + 2
        
        let intDouble = person.num6 + person.num2
        print(addCheck1)
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
    
    enum CodingKeys : String, CodingKey {
        case name
        case num1
        case num2
        case num3
        case num4
        case num5
        case num6
    }
}



