//
//  TemplateDecoder.swift
//  codableTest
//
//  Created by James Hunt on 6/29/18.
//  Copyright © 2018 James Hunt. All rights reserved.
//

import Foundation

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
