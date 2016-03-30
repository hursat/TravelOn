//
//  DatabaseHandler.swift
//  TravelOn
//
//  Created by Hursat Demir on 29.03.2016.
//  Copyright © 2016 Demir LLC. All rights reserved.
//

import Foundation
import Firebase

class DatabaseHandler{
    
    let ref = Firebase(url: "https://travelon.firebaseio.com");
    
    func registerUser(newUserEmail :String, newUserPassword: String) {
        
        self.ref.createUser(newUserEmail, password: newUserPassword) {(error: NSError!) in
            
            if (error == nil) {
                
                self.ref.authUser(newUserEmail, password: newUserPassword,
                                  withCompletionBlock: { (error, auth) -> Void in
                });
                
            }else{
                print(error);
                
                //error kodu alıp ona göre hata ver
            }
        }
    }
    
    func userLogin(userEmail: String, userPassword: String) -> Bool{
        
        var result: Bool = false;
        
        self.ref.authUser(userEmail, password: userPassword, withCompletionBlock: {error, auth in
            if(error == nil){
                result = true;
            }else{
                result = false;
            }
        });
        
        print(result.description + " hey2");
        
        return result;
    }
}

