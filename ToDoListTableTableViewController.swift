//
//  ToDoListTableTableViewController.swift
//  test2
//
//  Created by farid fadaie on 7/18/14.
//  Copyright (c) 2014 farid fadaie. All rights reserved.
//

import UIKit


@objc(ToDoListTableViewController)class ToDoListTableViewController: UITableViewController {
    @IBAction func unwindToList(s:UIStoryboardSegue) {
        
    }
    var toDoItems: NSMutableArray = []
    func loadInitialData(){
        
        var item1 = ToDoItem(name: "Buy, milk")
        self.toDoItems.addObject(item1)
        
        var item2 = ToDoItem(name: "Buy eggs")
        self.toDoItems.addObject(item2)
        
        var item3 = ToDoItem(name: "Read a book")
        self.toDoItems.addObject(item3)
        
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView!) -> Int {
        
        return 1
        
    }
    
    override func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) ->
        
        Int {
            
            return self.toDoItems.count
            
    }
    
    override func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath:
        
        NSIndexPath!) -> UITableViewCell! {
            
            let CellIndentifier: NSString = "ListPrototypeCell"
            
            var cell : UITableViewCell = tableView.dequeueReusableCellWithIdentifier(CellIndentifier) as UITableViewCell
            
            var todoitem: ToDoItem = self.toDoItems.objectAtIndex(indexPath.row) as ToDoItem
            
            cell.textLabel.text = todoitem.itemName
            
            return cell
            
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadInitialData()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // #pragma mark - Table view data source


    /*
    override func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell? {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView!, canEditRowAtIndexPath indexPath: NSIndexPath!) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView!, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath!) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView!, moveRowAtIndexPath fromIndexPath: NSIndexPath!, toIndexPath: NSIndexPath!) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView!, canMoveRowAtIndexPath indexPath: NSIndexPath!) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // #pragma mark - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}