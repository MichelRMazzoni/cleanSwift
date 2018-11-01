//
//  StatsDetailsTableViewCell.swift
//  Clean2
//
//  Created by Michel Mazzoni on 01/11/18.
//  Copyright © 2018 Michel Mazzoni. All rights reserved.
//

import UIKit

class StatsDetailsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameStatsLabel: UILabel!
    @IBOutlet weak var valorStatsLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
