//
//  MineHomeController.swift
//  GuideInterface
//
//  Created by 佐毅 on 16/2/9.
//  Copyright © 2016年 上海乐住信息技术有限公司. All rights reserved.
//

import UIKit

class MineHomeController: BaseTableViewController {
    var mineTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mineTableView = UITableView()
        self.mineTableView.frame = UIScreen .mainScreen().bounds
        self.mineTableView.delegate = self
        self.mineTableView.dataSource  = self
        self.mineTableView.registerClass(UITableViewCell.classForCoder(), forCellReuseIdentifier: "mineHomeCellIdentifier")
        self.view .addSubview(self.mineTableView)
    }
    
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell:UITableViewCell! = self.mineTableView.dequeueReusableCellWithIdentifier("mineHomeCellIdentifier")
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        cell.textLabel!.text = "mike"
        return cell
    }
    
    
   override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 44
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
         print("点击了该行")
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
