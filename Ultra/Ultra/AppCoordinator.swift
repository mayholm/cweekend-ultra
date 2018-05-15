//
//  AppCoordinator.swift
//  Ultra
//
//  Created by Pär Majholm on 5/12/18.
//  Copyright © 2018 Pär Majholm. All rights reserved.
//

import UIKit
import Firebase

@UIApplicationMain
class AppCoordinator: NSObject {

    private let model = AppModel()
    private var mainWindow: UIWindow!

    private func start() {
        // Here we:
        // * Create the main window and make it the key window
        // * Set the root view controller
        // * Configure Firebase
        let window = UIWindow()
        mainWindow = window
        window.rootViewController = DashboardViewController.newFromStoryboard()
        window.makeKeyAndVisible()
        FirebaseApp.configure()

        let loginSession = LoginSession(user: User(id: 24, email: "email@email.com"), sessionId: "sessionID woidjiawjdiawjd")

        let dict = createDictionaryFrom(loginSession)
    }
}

extension AppCoordinator: UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        start()
        return true
    }
}
