//
//  ViewController.swift
//  TableViewLearn
//
//  Created by mini4s220 on 15/2/9.
//  Copyright (c) 2015年 EnjoyThis. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

  var Things = [ToDoThing]()
  
  @IBOutlet weak var MainTableView: UITableView!
  override func viewDidLoad() {
    super.viewDidLoad()
    
    Things = [ ToDoThing(thingName: "Go To ShangHai", thingDate: "2015-12-12"),ToDoThing(thingName: "Go To ChiFan", thingDate: "2010-12-1")
    ]
    // Do any additional setup after loading the view, typically from a nib.
    MainTableView.delegate = self
    MainTableView.dataSource = self
    
    navigationItem.leftBarButtonItem = editButtonItem()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    //
    return self.Things.count;
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    //
    let cell = self.MainTableView.dequeueReusableCellWithIdentifier("maintableviewcell") as UITableViewCell
    
    var label01 = cell.viewWithTag(100) as UILabel
    var label02 = cell.viewWithTag(101) as UILabel
    
    label01.text = self.Things[indexPath.row].ThingName
    label02.text = self.Things[indexPath.row].ThingDate
    
    return cell
  }
  
  
  // Edit mode
  override func setEditing(editing: Bool, animated: Bool) {
    super.setEditing(editing, animated: animated)
    MainTableView.setEditing(editing, animated: true)
  }

  func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    return self.editing
  }
  
  func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
    //
  }
  
  // MARK - UITableViewDelegate
  // Delete the cell
  func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    if editingStyle == UITableViewCellEditingStyle.Delete {
      Things.removeAtIndex(indexPath.row)
      MainTableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
    }
  }
}

