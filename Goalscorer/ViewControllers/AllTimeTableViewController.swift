//
//  AllTimeTableViewController.swift
//  Goalscorer
//
//  Created by tichinose1 on 2018/11/13.
//  Copyright © 2018 example.com. All rights reserved.
//

import UIKit

class AllTimeTableViewController: UITableViewController {

    private lazy var items = RealmDAO<OverallScorer>()
        .findAll()
        .sorted(byKeyPath: "competition.order")

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        setScreenName("Alltime")
    }
}

// MARK: - UITableViewDataSource

extension AllTimeTableViewController {

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "allTimeCell", for: indexPath)
        cell.textLabel?.text = item.competition.name
        cell.imageView?.image = item.competition.association.image
        return cell
    }
}

// MARK: - UITableViewDelegate

extension AllTimeTableViewController {

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = items[indexPath.row]
        presentSafariViewController(url: item.url, contentType: "overall_scorer", itemID: item.competition.name)
    }
}
