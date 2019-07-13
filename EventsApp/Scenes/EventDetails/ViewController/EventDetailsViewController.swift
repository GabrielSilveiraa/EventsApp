//
//  EventDetailsViewController.swift
//  EventsApp
//
//  Created by Gabriel Silveira on 13/07/19.
//  Copyright © 2019 Gabriel Silveira. All rights reserved.
//

import UIKit

final class EventDetailsViewController: UIViewController {
    private(set) lazy var baseView: EventDetailsView = {
        let view = EventDetailsView()
        return view
    }()
    
    let viewModel: EventDetailsViewModelProtocol
    
    init(viewModel: EventDetailsViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: Bundle.main)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    override func loadView() {
        super.loadView()
        view = baseView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configBind()
    }
    
    private func configBind() {
        //Config the binds to viewModel here
    }
}
