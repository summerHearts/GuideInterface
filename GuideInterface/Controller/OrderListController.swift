//
//  OrderListController.swift
//  GuideInterface
//
//  Created by 佐毅 on 16/2/9.
//  Copyright © 2016年 上海乐住信息技术有限公司. All rights reserved.
//

import UIKit

let OrderListCellIdentifier = "OrderListCellIdentifier"
class OrderListController: BaseViewController, YSSegmentedControlDelegate ,UITableViewDataSource ,UITableViewDelegate{
    
    var orderListTableView: UITableView!
    var dataSource   :NSMutableArray!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let segmented = YSSegmentedControl(
            frame: CGRect(
                x: 0,
                y: 64,
                width: view.frame.size.width,
                height: 44),
            
            titles: [
                "全部",
                "进行中",
                "待评价",
                "完成"
            ],
            action: {
                control, index in
                print ("segmented did pressed \(index)")
        })
        segmented.delegate = self
        view.addSubview(segmented)
        
        self.dataSource = NSMutableArray()
        self.dataSource .addObject(["1"])
        self.dataSource .addObject(["1"])
        self.dataSource .addObject(["1"])
        self.dataSource .addObject(["1"])

        self.orderListTableView = UITableView()
        self.orderListTableView.frame =  CGRectMake(0, 64+44, UIScreen.mainScreen().bounds.size.width, UIScreen.mainScreen().bounds.size.height-108-46)
        self.orderListTableView.delegate = self
        self.orderListTableView.dataSource  = self
        self.orderListTableView.backgroundColor = UIColor(red: 224/255, green: 224/255, blue: 224/255, alpha: 1)
        self.orderListTableView.registerNib(UINib(nibName: "OrderListCell", bundle: nil), forCellReuseIdentifier:OrderListCellIdentifier )
        self.view .addSubview(self.orderListTableView)
    }
    
     func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return self.dataSource.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource .objectAtIndex(section).count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell:OrderListCell! = self.orderListTableView.dequeueReusableCellWithIdentifier(OrderListCellIdentifier)as! OrderListCell
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        cell .loadData(["key":"name"])
        return cell
    }
    
     func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 175
    }
    
     func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("点击了该行")
    }

    func segmentedControlWillPressItemAtIndex(segmentedControl: YSSegmentedControl, index: Int) {
        
    }
    
    func segmentedControlDidPressedItemAtIndex(segmentedControl: YSSegmentedControl, index: Int) {
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
