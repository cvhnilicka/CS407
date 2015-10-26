//
//  taskview.swift
//  Calender2
//
//  Created by Cormick Hnilicka on 10/25/15.
//  Copyright © 2015 Cormick Hnilicka. All rights reserved.
//

import UIKit

class Taskview: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var Name: UILabel!
    @IBOutlet weak var Date: UILabel!
    
    @IBOutlet weak var dataSource: UITableView!
    
    
    var dayname: String!
    var dayData: NSDictionary = NSDictionary();
    
    let calender = Calender.sharedInstance;
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return calender.numberOfTasks(dayname);
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("TaskViewCell") as! TaskViewCell
        var tasks:[Task] = (calender.calenderDB[dayname]?.getTasks())!
        cell.TaskName.text = tasks[count].name
        print(cell.TaskName.text)
        
        if (count < calender.numberOfTasks(dayname)-1){
        count++;
        }
        else {
            count = 0;
        }
        
        
        
        
        return cell
    }
    override func viewDidLoad() {
        Name.text = dayname!
        var numberOfTasks = calender.numberOfTasks(dayname);
        Date.text = String(numberOfTasks) + " tasks on " + dayname + "!"
        
        //self.dataSource.delegate = self;
        self.dataSource.dataSource = self;
    
        self.dataSource.reloadData();
        
    }
    override func viewWillAppear(animated: Bool) {
        self.dataSource.reloadData();
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let path = self.dataSource.indexPathForSelectedRow
        let num = path?.row
        let currentCell = calender.calenderDB[dayname]?.tasks[num!]
        let nextvc: SingleTaskView = segue.destinationViewController as! SingleTaskView
        nextvc.desc = (currentCell?.description)!
        nextvc.name = (currentCell?.name)!
        nextvc.date = (currentCell?.date)!
        nextvc.day = dayname;
    }
  
    var count = 0;
 

}
