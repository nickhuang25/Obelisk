//
//  User.swift
//  Obelisk
//
//  Created by Nick Huang on 7/30/19.
//  Copyright © 2019 Nick Huang. All rights reserved.
//

import Foundation

class User {
    //-------------------------------Variables-------------------------------//
    var name: String?
    var password: String?
    
    
    
    //-------------------------------Constructor-------------------------------//
    init(name_in: String, password_in: String){
        name = name_in
        password = password_in
    }
}
