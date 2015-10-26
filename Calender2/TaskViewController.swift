//
//  TaskViewController.swift
//  Calender2
//
//  Created by Cormick Hnilicka on 10/20/15.
//  Copyright © 2015 Cormick Hnilicka. All rights reserved.
//

import UIKit

class TaskViewController: UIViewController {

    @IBOutlet weak var TaskName: UITextField!
    
    @IBOutlet weak var Description: UITextView!
    
    @IBOutlet weak var TaskDay: UIDatePicker!
  
    let calender = Calender.sharedInstance
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.Plain, target: self, action: "saveData:");
        // Do any additional setup after loading the view.
        self.navigationController?.navigationBar.barTintColor = UIColor.blackColor();
        self.view.backgroundColor = UIColor.blackColor();
        self.TaskDay.setValue(UIColor.whiteColor(), forKeyPath: "textColor");
      

    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func saveData (sender: UIBarButtonItem ){
        
        var dateFormatter = NSDateFormatter();
        dateFormatter.dateStyle = NSDateFormatterStyle.FullStyle;
        var date = dateFormatter.stringFromDate(TaskDay.date);
        var newtask = Task(name: TaskName.text!, description: Description.text!, date: date);
        var splitDate = date.componentsSeparatedByString(",");
        if (calender.calenderDB[splitDate[0]] == nil){
            var newday = Day(name: splitDate[0], tasks: [], date: splitDate[0]);
            newday.addtotasks(newtask);
            calender.addDay(splitDate[0], day: newday);
            
        }
        else {
            calender.addTask(newtask, name: splitDate[0])
        }
        self.navigationController?.popToRootViewControllerAnimated(true);
        
    
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
