
//
//  Json.swift
//  codableTest
//
//  Created by James Hunt on 6/29/18.
//  Copyright © 2018 James Hunt. All rights reserved.
//

import Foundation

let simpleJson = """
{
    "type": "Page",
    "children":[
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
            "children": [
                {
                    "type": "CardHeaderTwo",
                    "title": "hello",
                    "navigation": "Home/Portfolio"
                },
                {
                    "type": "CardThreeValue",
                    "title": "sup",
                    "data": "cool data",
                    "extra": "some extra text"
                }
            ]
        }
    ]
}
"""

/*
 Page(children: [
    codableTest.Card(children: [
        codableTest.CardHeaderOne(title: "hello")
    ]),
    codableTest.Card(children: [
        codableTest.CardHeaderTwo(title: "hello", navigation: "Home/Portfolio"),
        codableTest.CardThreeValue(title: "sup", data: "cool data", extra: "some extra text")
    ])
 ])

 */
