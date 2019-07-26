//
//  ViewController.swift
//  progress
//
//  Created by User on 7/23/19.
//  Copyright © 2019 A-Bank. All rights reserved.
//

import UIKit

extension Sequence where Element: AdditiveArithmetic {
    func sum() -> Element {
        return reduce(.zero, +)
    }
}

class SomeClass: UITableViewCell {
    
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    
}

class CellClass: UITableViewCell, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    
    private var array: [Int]  = [1, 2, 3]
    private var heights: [Int: CGFloat] = [:]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell2") as! SomeClass
        cell.firstLabel.text = "\(indexPath.row) \n\n end"
        cell.secondLabel.text = "start \n\n end"
        heights[indexPath.row] = cell.frame.height
        return cell
    }
    
    func updateHeight() {
        heightConstraint.constant = heights.values.map { $0 }.sum()
        print(heights)
        layoutIfNeeded()
    }
    
    func workaround() {
        array.forEach { _ in
            self.tableView.reloadData()
            self.updateHeight()
        }
    }
    
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    private var array: [Int]  = [1, 2, 3, 4, 5]
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! CellClass
        cell.nameLabel.text = "\(indexPath.row)"
        cell.workaround()
        return cell
    }
    
}

