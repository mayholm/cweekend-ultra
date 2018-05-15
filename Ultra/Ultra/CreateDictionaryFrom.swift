//
//  CreateDictionaryFrom.swift
//  Ultra
//
//  Created by Pär Majholm on 5/14/18.
//  Copyright © 2018 Pär Majholm. All rights reserved.
//

import Foundation

func createDictionaryFrom<T: Encodable>(_ object: T) -> Dictionary<String, Any> {
    let jsonEncoder = JSONEncoder()
    jsonEncoder.outputFormatting = .prettyPrinted
    let jsonData = try! jsonEncoder.encode(object)
    return try! JSONSerialization.jsonObject(with: jsonData, options: .mutableContainers) as! Dictionary<String, Any>
}
