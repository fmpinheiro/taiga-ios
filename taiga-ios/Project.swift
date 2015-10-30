//
//  Project.swift
//  taiga-ios
//
//  Created by Rhonan Carneiro on 30/10/15.
//  Copyright © 2015 Taiga. All rights reserved.
//

import Foundation

final class Project: ResponseObjectSerializable, ResponseCollectionSerializable {
    let id: Int?
    let name: String?
    let description: String?
    
    init?(response: NSHTTPURLResponse, representation: AnyObject) {
        self.id = representation.valueForKeyPath("id") as? Int
        self.name = representation.valueForKeyPath("name") as? String
        self.description = representation.valueForKeyPath("description") as? String
    }
    
    class func collection(response response: NSHTTPURLResponse, representation: AnyObject) -> [Project] {
        let projectArray = representation as? [AnyObject]
        if projectArray != nil {
            return projectArray!.map({ Project(response:response, representation: $0)! })
        } else {
            return [Project]()
        }
    }
}