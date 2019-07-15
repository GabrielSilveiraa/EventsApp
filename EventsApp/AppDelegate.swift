//
//  AppDelegate.swift
//  EventsApp
//
//  Created by Gabriel Silveira on 09/07/19.
//  Copyright © 2019 Gabriel Silveira. All rights reserved.
//
// swiftlint:disable discouraged_optional_collection

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    private var appCoordinator: Coordinator?
    var window: UIWindow?
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        appCoordinator = AppCoordinator(window: window)
        appCoordinator?.start()
        self.window = window
        
        return true
    }
}
