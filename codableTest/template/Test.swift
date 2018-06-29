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
        print(templateDecoder.decoderType)
        
        let template = try! simplify(templateDecoder: templateDecoder)
        print(template)
    }
    
    
}

func simplify(templateDecoder: TemplateDecoder) throws -> Template {
    switch templateDecoder.decoderType {
    case is PageDecoder:
        let childTemplates = try (templateDecoder.decoderType as! PageDecoder).children.map { child in
            try simplify(templateDecoder: child)
        }
        return Page(children: childTemplates)
        
    case is CardDecoder:
        let childTemplates = try (templateDecoder.decoderType as! CardDecoder).children.map { child in
            try simplify(templateDecoder: child)
        }
        return Card(children: childTemplates)
        
    case is CardHeaderOneDecoder:
        let title = (templateDecoder.decoderType as! CardHeaderOneDecoder).title
        return CardHeaderOne(title: title)
        
    default:
        print("fail")
        print(templateDecoder)
        throw SafeError.errors
    }
}




