//
//  Task.swift
//  Calender2
//
//  Created by Cormick Hnilicka on 10/20/15.
//  Copyright © 2015 Cormick Hnilicka. All rights reserved.
//

import Foundation

class Task {
    var name: String;
    var description: String;
    var date: String;
    init(name: String, description: String, date: String){
        self.name = name;
        self.description = description;
        self.date = date;
    }
}