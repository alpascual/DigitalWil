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
    
    let sectionStrings = ["Screen lock code","# of tries before sending code", "Best time of the day", "How long between requests"]
    
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
        cell.selectionStyle = UITableViewCellSelectionStyle.Default
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        
        // Configure the cell...
        cell!.textLabel.text = sectionStrings[indexPath.row] as String
        cell!.textLabel.font = UIFont(name: "ItalicMT", size: 10.0)
        cell!.textLabel.textColor = UIColor.grayColor()
        
        cell!.detailTextLabel.text = "Empty"
        cell!.detailTextLabel.font = UIFont(name: "ArialMT", size: 20.0)
        
        return cell
    }
}