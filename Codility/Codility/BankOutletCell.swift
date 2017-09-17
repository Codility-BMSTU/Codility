//
//  BankOutletCell.swift
//  OpenBank
//
//  Created by Aleksander Evtuhov on 16/09/2017.
//  Copyright © 2017 Aleksander Evtuhov. All rights reserved.
//

import UIKit

class BankOutletCell: UITableViewCell {

    @IBOutlet weak var adress: UILabel!
    @IBOutlet weak var timetable: UILabel!
    @IBOutlet weak var distance: UILabel!
    
    @IBOutlet weak var workload: UILabel!
    
    @IBOutlet weak var workloadIcon: UIImageView!
        
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
