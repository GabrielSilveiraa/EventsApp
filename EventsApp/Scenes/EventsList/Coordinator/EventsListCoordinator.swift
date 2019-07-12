//
//  EventsListCoordinator.swift
//  EventsApp
//
//  Created by Gabriel Silveira on 11/07/19.
//  Copyright © 2019 Gabriel Silveira. All rights reserved.
//

import UIKit

protocol EventsListNavigationDelegate: AnyObject {
    
}

class EventsListCoordinator {
    var childCoordinators: [Coordinator] = []
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
}

extension EventsListCoordinator: Coordinator {
    func start() {
        let viewModel = EventsListViewModel()
        let viewController = EventsListViewController(viewModel: viewModel)
        navigationController.viewControllers = [viewController]
    }
}

extension EventsListCoordinator: EventsListNavigationDelegate {
  
}
