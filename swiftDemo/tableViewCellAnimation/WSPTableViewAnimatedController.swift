//
//  WSPTableViewAnimatedController.swift
//  swiftDemo
//
//  Created by auto on 16/3/23.
//  Copyright © 2016年 auto. All rights reserved.
//

import UIKit

class WSPTableViewAnimatedController: UITableViewController {
        /// 数据源
    var  tableData = ["Personal Life", "Buddy Company", "#30 days Swift Project", "Body movement training", "AppKitchen Studio", "Project Read", "Others"]
    
    override func viewDidLoad() {
         super.viewDidLoad()
        
        UIApplication.sharedApplication().statusBarHidden = true
        
        self.view.backgroundColor = UIColor.blackColor()
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        self.tableView.tableFooterView = UIView(frame: CGRectZero)
        self.tableView.registerClass(FirstTableCell.self, forCellReuseIdentifier: "tableCell")
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        animateTable()
    }
    
    func animateTable() {
        
        self.tableView.reloadData()
        
        let cells = tableView.visibleCells
        let tableHeight: CGFloat = tableView.bounds.size.height
        
        for i in cells {
            let cell: UITableViewCell = i as UITableViewCell
            cell.transform = CGAffineTransformMakeTranslation(0, tableHeight)
        }
        
        var index = 0
        
        for a in cells {
            
            let cell: UITableViewCell = a as UITableViewCell
            
            UIView.animateWithDuration(1.5, delay: 0.05 * Double(index), usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: [], animations: {
                
                cell.transform = CGAffineTransformMakeTranslation(0, 0);
                
                }, completion: nil)
            
            index += 1
        }
    }
    
    // MARK: - 表格数据源和代理方法
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("tableCell", forIndexPath: indexPath)
        cell.textLabel?.text            = tableData[indexPath.row];
        cell.textLabel?.backgroundColor = UIColor.clearColor()
        cell.textLabel?.font            = UIFont(name: "Avenir Next", size: 18)
        cell.selectionStyle             = .None
        
        return cell
    }
    
    override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        cell.backgroundColor = colorforIndex(indexPath.row)
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier("ShowAnimateTableViewController", sender: nil)
    }
    func colorforIndex(index: Int) -> UIColor {
        let itemCount = tableData.count - 1
        
        let color = (CGFloat(index) / CGFloat(itemCount)) * 0.6
        
        return UIColor(red: color, green: 0.0, blue: 1.0, alpha: 1.0)
    }
    

}
