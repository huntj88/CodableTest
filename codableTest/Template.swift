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
}

protocol Template {}

let simpleJson = """
{
    "type": "Page",
    "children": [
        {
            "type": "Card",
            "children": [
                {
                "type": "CardHeaderOne",
                "title": "hello"
                }
            ]
        },
        {
            "type": "Card",
            "children": []
        }
    ]
}
"""


protocol DecoderType {}

struct TemplateDecoder: Decodable {
    
    let decoderType: DecoderType
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let templateType = try container.decode(String.self, forKey: .type)
        
        switch templateType {
        case "Page":
            decoderType = try PageDecoder(from: decoder)
        case "Card":
            decoderType = try CardDecoder(from: decoder)
        case "CardHeaderOne":
            decoderType = try CardHeaderOneDecoder(from: decoder)
        default:
            throw SafeError.errors
        }
    }
    
    enum CodingKeys: String, CodingKey {
        case type
    }
}

struct PageDecoder: Decodable, DecoderType {
    
    let children: [TemplateDecoder]
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        children = try container.decode(Array<TemplateDecoder>.self, forKey: .children)
    }
    
    enum CodingKeys: String, CodingKey {
        case children
    }
}

struct CardDecoder: Decodable, DecoderType {

    let children: [TemplateDecoder]
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        children = try container.decode(Array<TemplateDecoder>.self, forKey: .children)
    }
    
    enum CodingKeys: String, CodingKey {
        case children
    }
    
}

struct CardHeaderOneDecoder: Decodable, DecoderType {
    
    let title: String
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        title = try container.decode(String.self, forKey: .title)
    }
    
    enum CodingKeys: String, CodingKey {
        case title
    }
    
}

struct Page: Template {
    let children: [Template]
}

struct Card: Template {
    let children: [Template]
}

struct CardHeaderOne: Template {
    let title: String
}

struct CardHeaderTwo: Template {
    let title: String
    let navigation: String
}

struct CardThreeValue: Template {
    let title: String
    let data: String
    let extra: String
}
