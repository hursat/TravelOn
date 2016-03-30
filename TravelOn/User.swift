//
//  User.swift
//  TravelOn
//
//  Created by Hursat Demir on 30.03.2016.
//  Copyright © 2016 Demir LLC. All rights reserved.
//

import Foundation
import Firebase

struct User {
    let uid: String;
    let email: String;
    
    // Initialize from Firebase
    init(authData: FAuthData) {
        uid = authData.uid;
        email = authData.providerData["email"] as! String;
    }
    
    // Initialize from arbitrary data
    init(uid: String, email: String) {
        self.uid = uid;
        self.email = email;
    }
}