//
//  AddToDoViewController.swift
//  test2
//
//  Created by farid fadaie on 7/18/14.
//  Copyright (c) 2014 farid fadaie. All rights reserved.
//

import UIKit

class AddToDoViewController: UIViewController {
    var toDoItem: ToDoItem?
    @IBOutlet var textField: UITextField
    @IBOutlet var doneButton: UIBarButtonItem
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        if sender as? NSObject != self.doneButton{
            return
        }
        if self.textField.text.utf16count > 0{
            self.toDoItem = ToDoItem(name: self.textField.text)
        }
    }
    override func touchesBegan(touches: NSSet!, withEvent event: UIEvent!) {
        self.view.endEditing(true)
    }

    /*
    // #pragma mark - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
