//
//  SingleTaskView.swift
//  Calender2
//
//  Created by Cormick Hnilicka on 10/26/15.
//  Copyright © 2015 Cormick Hnilicka. All rights reserved.
//

import UIKit

class SingleTaskView: UIViewController {
    
    @IBOutlet weak var TaskName: UILabel!
    @IBOutlet weak var TaskDate: UILabel!
    @IBOutlet weak var Description: UITextView!
    var day: String = ""
    var name: String = ""
    var date: String = ""
    var desc: String = ""
    let calender = Calender.sharedInstance
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Delete", style: UIBarButtonItemStyle.Plain, target: self, action: "deleteTask:");
        TaskName.text = name
        TaskDate.text = date
        Description.text = desc;
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    func deleteTask(sender: UIBarButtonItem){
        calender.deleteTask(day, taskname: name);
        self.navigationController?.popViewControllerAnimated(true);
    }

}
