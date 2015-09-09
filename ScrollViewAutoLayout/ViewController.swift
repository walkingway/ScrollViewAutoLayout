//
//  ViewController.swift
//  ScrollViewAutoLayout
//
//  Created by cheng way on 9/9/15.
//  Copyright (c) 2015 chengway. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var tableView: UITableView!
  @IBOutlet weak var scrollView: UIScrollView!
  @IBOutlet weak var dummyView: UIView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

extension ViewController: UITableViewDataSource {
  func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 20
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("Cell") as! UITableViewCell
    
    cell.textLabel?.text = "\(indexPath.row)"
    
    if tableView.frame.size.height != tableView.contentSize.height {
      tableView.frame.size = tableView.contentSize
      scrollView.contentSize = CGSizeMake(self.view.bounds.width, tableView.frame.origin.y + tableView.contentSize.height)
      dummyView.frame.size = scrollView.contentSize
      //      self.view.frame.size = scrollView.contentSize
      println(dummyView.frame.size)
    }
    
    return cell
  }
  
  
}
