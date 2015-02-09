//
//  ViewController.swift
//  TableViewLearn
//
//  Created by mini4s220 on 15/2/9.
//  Copyright (c) 2015年 EnjoyThis. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

  
  @IBOutlet weak var MainTableView: UITableView!
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view, typically from a nib.
    MainTableView.delegate = self
    MainTableView.dataSource = self
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    //
    
    return 10;
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    //
    let cell = self.MainTableView.dequeueReusableCellWithIdentifier("maintableviewcell") as UITableViewCell
    
    var label01 = cell.viewWithTag(100) as UILabel
    var label02 = cell.viewWithTag(101) as UILabel
    
    label01.text = "Hi"
    label02.text = "2013-12-1"
    
    return cell
  }


}

