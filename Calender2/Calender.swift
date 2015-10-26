//
//  Calender.swift
//  Calender2
//
//  Created by Cormick Hnilicka on 10/21/15.
//  Copyright © 2015 Cormick Hnilicka. All rights reserved.
//

import Foundation

class Calender  {
    class var sharedInstance: Calender {
        struct Static {
            static var instance: Calender?
            static var token : dispatch_once_t = 0
        }
        dispatch_once(&Static.token) {
            Static.instance = Calender();
        }
        return Static.instance!
    }
    var calenderDB: [String: Day] = [:];
    
    
     func checkForDay(day: String) -> Bool {
        if (calenderDB[day] != nil){
            return true;
        }
        else {
            return false
        }
    }
    func deleteTask(name: String, taskname: String){
        for var i = 0; i < (calenderDB[name]?.tasks.count)!; i++ {
            if (calenderDB[name]?.tasks[i].name == taskname){
                calenderDB[name]?.tasks.removeAtIndex(i);
                
            }
        }
    }
    
     func addTask(newtask: Task, name: String) {
        calenderDB[name]?.addtotasks(newtask);
    }
    
    func addDay(name: String, day: Day){
        if (calenderDB[name] == nil){
            calenderDB[name] = day;
        }
    }
    func numberOfTasks (day: String) -> Int {
        if (calenderDB[day]?.tasks != nil){
        return calenderDB[day]!.tasks.count;
        }
        else {
        return 0
        }
    }
    
    
}