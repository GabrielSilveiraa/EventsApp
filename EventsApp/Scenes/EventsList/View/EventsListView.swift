//
//  EventsListView.swift
//  EventsApp
//
//  Created by Gabriel Silveira on 11/07/19.
//  Copyright © 2019 Gabriel Silveira. All rights reserved.
//

import UIKit
import SnapKit

final class EventsListView: BaseView {
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(EventsListTableViewCell.self,
                           forCellReuseIdentifier: EventsListTableViewCell.identifier)
        return tableView
    }()
    
    let activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(style: .white)
        return activityIndicator
    }()
    
    override func initialize() {
        addSubview(tableView)
        addSubview(activityIndicator)
    }
    
    override func setupConstraints() {
        setupTableViewConstraints()
        setupActivityIndicatorConstraints()
    }
    
    private func setupTableViewConstraints() {
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    private func setupActivityIndicatorConstraints() {
        activityIndicator.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }

}
