//
//  Template.swift
//  codableTest
//
//  Created by James Hunt on 6/29/18.
//  Copyright © 2018 James Hunt. All rights reserved.
//

import Foundation

class DoTemplateStuff {
    
    func doStuff() {
        let jsonData = simpleJson.data(using: .utf8)!
        let decoder = JSONDecoder()
        let templateDecoder = try! decoder.decode(TemplateDecoder.self, from: jsonData)

        let template = templateDecoder.decoderType.simplify()
        print(template)
    }
}
