//
//  ToDoListTableTableViewController.swift
//  test2
//
//  Created by farid fadaie on 7/18/14.
//  Copyright (c) 2014 farid fadaie. All rights reserved.
//

import UIKit


@objc(ToDoListTableViewController)class ToDoListTableViewController: UITableViewController {
    @IBAction func unwindToList(segue:UIStoryboardSegue){
        var source: AddToDoViewController = segue.sourceViewController as AddToDoViewController
        
        if var item: ToDoItem = source.toDoItem{
            self.toDoItems.addObject(item)
            println(self.toDoItems.count)
            let targetIndexPath = NSIndexPath(forRow: self.toDoItems.count - 1, inSection: 0)
            self.tableView.insertRowsAtIndexPaths([targetIndexPath], withRowAnimation: .Automatic)
            //self.tableView.reloadData()
        }
    }
    var toDoItems: NSMutableArray = []
    let server = Server()
    func load(data : AnyObject){
        for item in data as NSArray {
            self.toDoItems.addObject(ToDoItem(name: item["owner"] as String))
        }
        self.tableView.reloadData()
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
            println(indexPath.section)
            
            let CellIndentifier: NSString = "ListPrototypeCell"
            
            var cell : UITableViewCell = tableView.dequeueReusableCellWithIdentifier(CellIndentifier) as UITableViewCell
            
            var todoitem: ToDoItem = self.toDoItems.objectAtIndex(indexPath.row) as ToDoItem
            
            cell.textLabel.text = todoitem.itemName
            if todoitem.completed{
                
                cell.accessoryType = .Checkmark
                
            }
                
            else{
                
                cell.accessoryType = .None
                
            }
            
            return cell
            
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.server.call("bb/threads", self.load)

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath:
        
        NSIndexPath!) {
            
            tableView.deselectRowAtIndexPath(indexPath, animated: false)
            
            var tappedItem: ToDoItem = self.toDoItems.objectAtIndex(indexPath.row) as
                
            ToDoItem
            
            tappedItem.completed = !tappedItem.completed
            tableView.reloadRowsAtIndexPaths([NSIndexPath(forRow: indexPath.row, inSection: 0)], withRowAnimation: .Automatic)
            //tableView.reloadData()
            
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
