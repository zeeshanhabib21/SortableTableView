//
//  ViewController.swift
//  SortableTableView
//
//  Created by Apple on 15/08/2020.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet  var tableView: UITableView!
    
    var item =
    [
      "First","Second","Third"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }


}
extension ViewController: UITableViewDataSource,UITableViewDelegate
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return item.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "sortCell", for: indexPath)
        cell.textLabel?.text = item[indexPath.row]
        cell.textLabel?.font = UIFont(name: "Arial", size: 22)
        return cell
    }
    
    
    @IBAction func didTapSort()
    {
        if tableView.isEditing{
            tableView.isEditing = false
        }else
        {
            tableView.isEditing = true
        }
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        item.swapAt(sourceIndexPath.row, destinationIndexPath.row)
    }
    
    
    
}

