//
//  User.swift
//  taiga-ios
//
//  Created by Rhonan Carneiro on 21/10/15.
//  Copyright © 2015 Taiga. All rights reserved.
//

import Foundation

final class User: ResponseObjectSerializable {
    let fullName: String?
    let authToken: String?
    let id: Int?
    
    init?(response: NSHTTPURLResponse, representation: AnyObject) {
        self.fullName = representation.valueForKeyPath("full_name") as? String
        self.authToken = representation.valueForKeyPath("auth_token") as? String
        self.id = representation.valueForKeyPath("id") as? Int
    }
}