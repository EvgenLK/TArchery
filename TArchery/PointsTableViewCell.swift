//
//  PointsTableViewCell.swift
//  TArchery
//
//  Created by Evgenii Kutasov on 29.11.2022.
//

import UIKit

class PointsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var dateStartLabel: UILabel!
    @IBOutlet weak var pointsLabel: UILabel!
    @IBOutlet weak var pointsTextLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func set(object: Target){
        self.dateStartLabel.text = object.number
        self.pointsLabel.text = object.points
        self.pointsTextLabel.text = object.pointsText
    }

}
