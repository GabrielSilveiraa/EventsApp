//
//  AppCoordinator.swift
//  DragonsApp
//
//  Created by Gabriel Silveira on 11/07/19.
//  Copyright © 2019 Gabriel Silveira. All rights reserved.
//

import UIKit

class AppCoordinator {
    private let window: UIWindow
    var childCoordinators: [Coordinator] = []
    let navigationController: UINavigationController = {
        let navigation = UINavigationController()
        navigation.setupAppearance()
        return navigation
    }()
    
    init(window: UIWindow) {
        self.window = window
    }
}

extension AppCoordinator: Coordinator {
    func start() {
        let eventsListCoordinator = EventsListCoordinator(navigationController: navigationController)
        eventsListCoordinator.start()
        add(childCoordinator: eventsListCoordinator)
        
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}
