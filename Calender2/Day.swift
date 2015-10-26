//
//  Day.swift
//  Calender2
//
//  Created by Cormick Hnilicka on 10/20/15.
//  Copyright © 2015 Cormick Hnilicka. All rights reserved.
//

import Foundation

struct Day {
    var name: String = "";
   
    var tasks: [Task] = [];
    var date: String = "";
    mutating func addtotasks(task: Task){
        tasks.append(task);
    }
    func getTasks() -> [Task] {
        return tasks
    }
}