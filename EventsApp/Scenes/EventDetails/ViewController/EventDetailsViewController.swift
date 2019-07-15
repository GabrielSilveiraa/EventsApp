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
        view.eventImageView.kf.setImage(with: viewModel.eventImageUrl,
                                        placeholder: UILabel(text: viewModel.imagePlaceholderTitle))
        view.priceLabel.text = viewModel.eventPrice
        view.dateLabel.text = viewModel.eventDate
        view.descriptionLabel.text = viewModel.eventDescription
        view.checkinButton.addTarget(self, action: #selector(didPressCheckinButton), for: .touchUpInside)
        view.shareButton.addTarget(self, action: #selector(didPressShareButton), for: .touchUpInside)
        view.mapsButton.addTarget(self, action: #selector(didPressMapsButton), for: .touchUpInside)
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
        title = viewModel.navigationTitle
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configBind()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    // MARK: - Functions
    private func configBind() {
        viewModel.successCheckin.bind { [weak self] message in
            guard let self = self, let message = message else { return }
            self.showAlert(message: message)
        }
        
        viewModel.error.bind { [weak self] error in
            guard let self = self, let error = error else { return }
            self.showAlert(message: error)
        }
    }
    
    // MARK: - Actions
    @objc private func didPressCheckinButton() {
        viewModel.checkin()
    }
    
    @objc private func didPressShareButton() {
        viewModel.share()
    }
    
    @objc private func didPressMapsButton() {
        viewModel.maps()
    }
}
