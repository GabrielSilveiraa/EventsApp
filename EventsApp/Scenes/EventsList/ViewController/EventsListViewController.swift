//
//  EventsListViewController.swift
//  EventsApp
//
//  Created by Gabriel Silveira on 11/07/19.
//  Copyright © 2019 Gabriel Silveira. All rights reserved.
//

import UIKit

final class EventsListViewController: UIViewController {
    private(set) lazy var baseView: EventsListView = {
        let view = EventsListView()
        view.tableView.delegate = self
        view.tableView.dataSource = self
        return view
    }()
    
    let viewModel: EventsListViewModelProtocol
    
    init(viewModel: EventsListViewModelProtocol) {
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
        viewModel.eventCells.bind { [weak self] _ in
            guard let self = self else { return }
            self.baseView.tableView.reloadData()
        }
        
        viewModel.loading.bindAndFire { [weak baseView] isLoading in
            guard let baseView = baseView else { return }
            isLoading ? baseView.activityIndicator.startAnimating() : baseView.activityIndicator.stopAnimating()
        }
        
        viewModel.error.bind { [weak self] error in
            guard let self = self, let error = error else { return }
            
        }
    }
}

extension EventsListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        viewModel.didSelect(row: indexPath.row)
    }
}

extension EventsListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.eventCells.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: EventsListTableViewCell.identifier,
                                                       for: indexPath) as? EventsListTableViewCell else {
                                                        return UITableViewCell()
        }
        let cellViewModel = viewModel.eventCells.value[indexPath.row]
        cell.configure(viewModel: cellViewModel)
        return cell
    }
}
