//
//  ViewController.swift
//  Calender2
//
//  Created by Cormick Hnilicka on 10/19/15.
//  Copyright © 2015 Cormick Hnilicka. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    let days:[String] = ["Sunday","Monday", "Tuesday", "Wednesday", "Thursday","Friday","Saturday"];
    
   let calender = Calender.sharedInstance
    
    
    @IBOutlet weak var dataTable: UITableView!
    
    
    var cells: [DayCellTableViewCell] = [];
    
    var count = 0;
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }
 
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7;
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellidentifier = "DayCellTableViewCell";
        let cell = tableView.dequeueReusableCellWithIdentifier(cellidentifier) as! DayCellTableViewCell;
        let todaysDate = NSDate();
        let dateFormatter = NSDateFormatter();
        dateFormatter.dateStyle = NSDateFormatterStyle.FullStyle;
        let date = dateFormatter.stringFromDate(todaysDate);
        let splitDate = date.componentsSeparatedByString(",");
        let d = splitDate[0];
     
        cell.DayOfWeek.text = days[count];
        if (calender.checkForDay(days[count])){
            if (calender.numberOfTasks(days[count]) != 0 ) {
            cell.NumberOfEvents.text = "\(calender.numberOfTasks(days[count])) tasks today!";
        }
        }
        cells.append(cell);

      
        if (count < 6){
            count++;
        }
        else {
            count = 0;
        }
        return cell;
    }
    
 
    
   
    

    override func viewDidLoad() {
        count = 0;
        super.viewDidLoad()
        self.navigationController?.navigationBar.barTintColor = UIColor.blackColor();
        self.view.backgroundColor = UIColor.blackColor();
        self.dataTable.backgroundView?.backgroundColor = UIColor.blackColor();
        self.dataTable.reloadData();
      
        
                // Do any additional setup after loading the view, typically from a nib.
       
    }
   override func viewWillAppear(animated: Bool) {
    self.dataTable.reloadData();
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    
    
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "taskView"){
            let path = self.dataTable.indexPathForSelectedRow
            let num = path?.row
            let currentCell = cells[num!];
            let taskvc : Taskview = segue.destinationViewController as! Taskview
            
            taskvc.dayname = currentCell.DayOfWeek.text!
            
            
            
            
            
            
        }
        
    }


}

