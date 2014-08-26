//
//  ProfileViewController.swift
//  FrostedSidebar
//
//  Created by Al Pascual on 8/25/14.
//  Copyright (c) 2014 Evan Dekhayser. All rights reserved.
//

import UIKit

class ProfileViewController: MasterPage, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var tableView: UITableView!
    
    let sectionStrings = ["Screen lock code","How often","Every 3 Months", "Every 6 Months"]
    
    override func viewDidLoad() {
        
        viewControllerIndex = 2
        
        super.viewDidLoad()
        
        self.tableView!.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        self.tableView!.rowHeight = 80
        self.tableView!.delegate = self
        self.tableView!.dataSource = self
        
        
    }
    
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int
    {
        return sectionStrings.count
    }
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell!
    {
        //var cell: UITableViewCell! = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as UITableViewCell
        var cell : UITableViewCell! = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "cell")
        cell.selectionStyle = UITableViewCellSelectionStyle.Blue
        
        // Configure the cell...
        cell!.textLabel.text = sectionStrings[indexPath.row] as String
        cell!.detailTextLabel.text = "Empty"
        
        return cell
    }
}
