//
//  TemplateData.swift
//  codableTest
//
//  Created by James Hunt on 6/29/18.
//  Copyright © 2018 James Hunt. All rights reserved.
//

import Foundation

protocol Template {}

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
