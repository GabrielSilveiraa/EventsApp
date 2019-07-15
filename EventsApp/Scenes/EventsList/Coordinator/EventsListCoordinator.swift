//
//  EventsListCoordinator.swift
//  EventsApp
//
//  Created by Gabriel Silveira on 11/07/19.
//  Copyright © 2019 Gabriel Silveira. All rights reserved.
//

import UIKit

protocol EventsListNavigationDelegate: AnyObject {
    func goToDetails(event: Event)
    func share(_ itens: [Any])
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
        let viewModel = EventsListViewModel(navigationDelegate: self)
        let viewController = EventsListViewController(viewModel: viewModel)
        navigationController.viewControllers = [viewController]
    }
}

extension EventsListCoordinator: EventsListNavigationDelegate {
    func goToDetails(event: Event) {
        let viewModel = EventDetailsViewModel(event: event, navigationDelegate: self)
        let viewController = EventDetailsViewController(viewModel: viewModel)
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func share(_ itens: [Any]) {
        let activityVC = UIActivityViewController(activityItems: itens, applicationActivities: nil)
        navigationController.present(activityVC, animated: true)
    }
}
