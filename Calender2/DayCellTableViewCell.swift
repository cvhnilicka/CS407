//
//  DayCellTableViewCell.swift
//  Calender2
//
//  Created by Cormick Hnilicka on 10/20/15.
//  Copyright © 2015 Cormick Hnilicka. All rights reserved.
//

import UIKit

class DayCellTableViewCell: UITableViewCell {

    @IBOutlet weak var NumberOfEvents: UILabel!
    @IBOutlet weak var DayOfWeek: UILabel!
    
    var tasks : [Task] = [];
    override func awakeFromNib() {
        super.awakeFromNib()
        if (tasks.count == 0){
            NumberOfEvents.text = "No Events Today";
        }
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
