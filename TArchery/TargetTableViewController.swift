//
//  TargetTableViewController.swift
//  TArchery
//
//  Created by Evgenii Kutasov on 29.11.2022.
//

import UIKit

var numberSerial = 1
//var objects = [Target(number: "", points: "", pointsText: "", isFavorite: false)]

class TargetTableViewController: UITableViewController {
    
  var objects = [Target(number: "", points: "", pointsText: "", isFavorite: false)]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.


        self.navigationItem.title = "Arrow Target - \(numberSerial)"


        
      self.navigationItem.leftBarButtonItem = self.editButtonItem
        
    }
    
    
    @IBAction func unwindSegue(segue: UIStoryboardSegue){
        guard segue.identifier == "saveSegue" else {return}
        let sourceVC = segue.source as! NewPointsTableViewController
        let point = sourceVC.point
        numberSerial += 1
        
        if let selectedIndexPath = tableView.indexPathForSelectedRow {
            objects[selectedIndexPath.row] = point
            tableView.reloadRows(at: [selectedIndexPath], with: .fade)
        } else{
            let newIndexPath = IndexPath(row: objects.count, section: 0)
            objects.append(point)
            tableView.insertRows(at: [newIndexPath], with: .fade)

        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        guard segue.identifier == "editPoints" else {return}
        let indexPath = tableView.indexPathForSelectedRow!
        let point = objects[indexPath.row]
        let navigationVC = segue.destination as! UINavigationController
        let newPointsVC = navigationVC.topViewController as! NewPointsTableViewController
        newPointsVC.point = point
        newPointsVC.title = "Edit"
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return objects.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "pointsCell", for: indexPath) as!
           PointsTableViewCell
        let object = objects[indexPath.row]
        cell.set(object: object)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
        
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            objects.remove(at: indexPath.row)
            tableView.deleteRows(at:  [indexPath], with: .fade)
        }
    }
   

}
