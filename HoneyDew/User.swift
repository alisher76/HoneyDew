//
//  User.swift
//  HoneyDew
//
//  Created by Alisher Abdukarimov on 5/22/17.
//  Copyright © 2017 MrAliGorithm. All rights reserved.
//

import Foundation

class User {
    
    let displayName: String
    let userName: String
    let list: List
    
    init(displayName: String, userName: String, list: List) {
        self.displayName = displayName
        self.userName = userName
        self.list = list
    }
    
    var hashValue: Int {
        return displayName.hashValue &+ userName.hashValue
    }
    
//    static func ==(lhs: User, rhs: User) -> Bool {
//    return lhs.displayName == rhs.displayName && lhs.userName == rhs.userName && lhs.list == rhs.list
//    }
}
