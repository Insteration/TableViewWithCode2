//
//  ViewController.swift
//  TableViewWithCode
//
//  Created by Артём Кармазь on 5/17/19.
//  Copyright © 2019 Artem Karmaz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var myTableView: UITableView!
    private var identifier = "MyCell"
    
    private var array = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createTable()
        
    }
    
    private func createTable() {
        myTableView = UITableView(frame: self.view.bounds, style: .grouped)
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: identifier)
        myTableView.delegate = self
        myTableView.dataSource = self
        myTableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.view.addSubview(myTableView)
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return array.count
        case 1:
            return array.count
        default:
            ()
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
//        cell.textLabel?.text = "Section = \(indexPath.section), Cell = \(indexPath.row)"
        cell.textLabel?.text = array[indexPath.row]
        switch indexPath.section {
        case 0:
            cell.backgroundColor = .purple
            cell.accessoryType = .checkmark
        case 1:
            cell.backgroundColor = .yellow
            cell.accessoryType = .detailDisclosureButton
        default:
            ()
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row, array[indexPath.row])
    }
}
