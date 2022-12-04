//
//  HomeTableViewCell.swift
//  PC3
//
//  Created by Daniel Derek Arredondo Asto on 3/12/22.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var titulo: UILabel!
    @IBOutlet weak var prioridad: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
