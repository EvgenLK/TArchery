//
//  NewPointsTableViewController.swift
//  TArchery
//
//  Created by Evgenii Kutasov on 30.11.2022.
//

import UIKit

class NewPointsTableViewController: UITableViewController {
    
    var point = Target(number: "", points: "", pointsText: "", isFavorite: false)
    
    @IBOutlet weak var numberTextField: UITextField!
    @IBOutlet weak var countTextField: UITextField!
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()

        updateUI()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        updateSaveButtonState()
    }
    
    private func updateSaveButtonState(){
        let numberSerialTF = numberTextField.text ?? ""
        let countTF = countTextField.text ?? ""
        
        saveButton.isEnabled = !numberSerialTF.isEmpty && !countTF.isEmpty
    }
    
    private func updateUI(){
        numberTextField.text = point.number
        countTextField.text = point.points
    }
    
    @IBAction func textChanged(_ sender: UITextField) {
        updateSaveButtonState()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        guard segue.identifier == "saveSegue" else {return}
        
        let number = numberTextField.text ?? ""
        let point = countTextField.text ?? ""

        
        self.point = Target(number: number , points: point, pointsText: "Points", isFavorite: false)
    }
}
