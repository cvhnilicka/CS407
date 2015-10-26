//
//  TaskViewCell.swift
//  Calender2
//
//  Created by Cormick Hnilicka on 10/26/15.
//  Copyright © 2015 Cormick Hnilicka. All rights reserved.
//

import UIKit

class TaskViewCell: UITableViewCell {
    @IBOutlet weak var TaskName: UILabel!
    @IBOutlet weak var TaskDate: UILabel!
  
    var name = ""
    var date = ""

    override func awakeFromNib() {
        super.awakeFromNib()
        TaskName.text = ""
        TaskDate.text = ""
        
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}
