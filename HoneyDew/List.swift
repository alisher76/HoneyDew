//
//  List.swift
//  HoneyDew
//
//  Created by Alisher Abdukarimov on 5/22/17.
//  Copyright © 2017 MrAliGorithm. All rights reserved.
//

import Foundation

enum Permission: Hashable {
    case canEdit
}

class List {
    
    var title: String
    var toDo: ToDo
    var createdBy: User
    var sharedWith: User
    
    init(title: String, toDo: ToDo, createdBy: User, sharedWith: User) {
        self.title = title
        self.toDo = toDo
        self.createdBy = createdBy
        self.sharedWith = sharedWith
    }
    
   
    
}
