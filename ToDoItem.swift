//
//  ToDoItem.swift
//  test2
//
//  Created by farid fadaie on 7/18/14.
//  Copyright (c) 2014 farid fadaie. All rights reserved.
//

import UIKit

class ToDoItem: NSObject {
    var itemName: NSString = ""
    var completed: Bool = false
    var creationDate: NSDate = NSDate()
    
    init(name:String){
        self.itemName = name
        
    }
}