//
//  AppModel.swift
//  Ultra
//
//  Created by Pär Majholm on 5/13/18.
//  Copyright © 2018 Pär Majholm. All rights reserved.
//

import Foundation
import FirebaseDatabase

class AppModel {

    /** The currently logged in/selected user. Because there currently is
     no authentication, this is just a client side memory of which
     user we are operating against on the backend. Obviously we need
     to use authentication at some point (soon). This would then be
     replaced by a log in session which would need to be authenticated
     with the server. **/
    public var user: User?

    //    /** Retrieve the userID from UserDefaults. If there wasn't one then create
    //     a new userID, save it, and return the new userID. **/
    //    private func getLoggedInUser() -> User {
    //        let defaults = UserDefaults.standard
    //        if let userIDFromDefaults = defaults.string(forKey: "userID") {
    //            return userIDFromDefaults
    //        } else {
    //            let newUserID = UUID.init().uuidString
    //            defaults.set(newUserID, forKey: "UserID")
    //            return newUserID
    //        }
    //    }

    private func loadUserFromBackend() {

    }

    private func createNewUser() {

    }
}
