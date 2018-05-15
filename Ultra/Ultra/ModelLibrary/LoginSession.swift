//
//  LoginSession.swift
//  Ultra
//
//  Created by Pär Majholm on 5/14/18.
//  Copyright © 2018 Pär Majholm. All rights reserved.
//

import Foundation

struct LoginSession: Codable {
    let user: User
    let sessionId: String
}
