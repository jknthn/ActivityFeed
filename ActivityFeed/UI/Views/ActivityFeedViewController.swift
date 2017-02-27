//
//  ActivityFeedViewController.swift
//  ActivityFeed
//
//  Created by Jeremi Kaczmarczyk on 19/02/2017.
//  Copyright © 2017 Jeremi Kaczmarczyk. All rights reserved.
//

import UIKit

class ActivityFeedViewController: UITableViewController, ActivityFeedView {
    
    private let presenter: ActivityFeedPresenter
    private let connector: ActivityFeedConnector
    
    // MARK: - Initialization 
    
    init(presenter: ActivityFeedPresenter, connector: ActivityFeedConnector) {
        self.presenter = presenter
        self.connector = connector
        super.init(nibName: nil, bundle: nil)
        setupController()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    
    func setupController() {
        title = "Activity"
        view.backgroundColor = UIColor.white
        
        tableView.tableFooterView = UIView()
        tableView.estimatedRowHeight = 100.0
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.registerCellsWithClass(ActivityTableViewCell.self)
        tableView.allowsSelection = false
        tableView.backgroundView = LoadingView()
    }
    
    // MARK: - UITableViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewReady()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.activitiesCount
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellOfType(type: ActivityTableViewCell.self, forIndexPath: indexPath)
        presenter.setupCell(cell, for: indexPath.row)
        return cell
    }
    
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        if velocity.y > 0.0 {
            presenter.loadMore()
        }
    }
    
    override func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? ActivityTableViewCell else {
            return
        }
        cell.cancelImageDownload()
    }

    // MARK: - ActivityFeedView
    
    func finishLoading() {
        tableView.backgroundView = nil
    }
    
    func addItems(at range: CountableClosedRange<Int>) {
        let paths = range.map { IndexPath(row: $0, section: 0) }
        tableView.beginUpdates()
        tableView.insertRows(at: paths, with: .none)
        tableView.endUpdates()
    }
}
