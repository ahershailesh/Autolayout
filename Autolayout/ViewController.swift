//
//  ViewController.swift
//  Autolayout
//
//  Created by Shailesh Aher on 3/14/18.
//  Copyright © 2018 Shailesh Aher. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    private let ruseId = "NoteCellTableViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 100
        tableView.register(UINib(nibName: ruseId, bundle: nil), forCellReuseIdentifier: ruseId)
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ruseId, for: indexPath)
        if let thisCell = cell as? NoteCellTableViewCell {
            thisCell.addNote(note: "This tutorial has been updated by Tony Dahbura. The original post was written by Gustavo Ambrozio. Learn how to submit an app to Apple in this two-part series. This tutorial documents every step of becoming an Apple iOS developer – from literally no account, to published on the App Store!")
            return thisCell
        }
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    
}
