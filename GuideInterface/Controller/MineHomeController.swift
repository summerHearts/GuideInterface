//
//  MineHomeController.swift
//  GuideInterface
//
//  Created by 佐毅 on 16/2/9.
//  Copyright © 2016年 上海乐住信息技术有限公司. All rights reserved.
//


private let mineHomeCellIdentifier = "mineUserInfoCellIdentifier"
import UIKit

class MineHomeController: BaseTableViewController {
    var mineTableView: UITableView!
    var dataSource   :NSMutableArray!
    var mineUserInfoView:MineUserInfoView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.fd_prefersNavigationBarHidden = true
        
        self.dataSource = NSMutableArray()
        self.dataSource .addObject([["image":"minehome_collection","name":"我的酒店"]])
        self.dataSource .addObject([["image":"minehome_coupon","name":"优惠券"]])
        self.dataSource .addObject([["image":"minehome_customerservice","name":"客服热线"],
            ["image":"minehome_help","name":"帮助与反馈"],
            ["image":"minehome_guanyumike","name":"关于眯客"]])
        self.dataSource .addObject([["image":"minehome_setting","name":"设置"]])
        
        self.mineTableView = UITableView()
        self.mineTableView.frame = UIScreen .mainScreen().bounds
        self.mineTableView.delegate = self
        self.mineTableView.dataSource  = self
        self.mineTableView.backgroundColor = UIColor(red: 224/255, green: 224/255, blue: 224/255, alpha: 1)
        self.mineTableView.registerNib(UINib(nibName: "MinePersonalCell", bundle: nil), forCellReuseIdentifier: mineHomeCellIdentifier)
        self.view .addSubview(self.mineTableView)
        
        self.mineUserInfoView = NSBundle.mainBundle().loadNibNamed("MineUserInfoView", owner: nil, options: nil).first as? MineUserInfoView
        self.mineUserInfoView.frame = CGRectMake(0, 0, UIScreen.mainScreen().bounds.size.width, 249)
        self.mineTableView.tableHeaderView = self.mineUserInfoView
        self.mineUserInfoView.userNameLabel.text = "13651981343"
        self.mineUserInfoView.userStatusLabel.text = "已登录"
        self .addTagAction();
    }
    
    func addTagAction(){
        self.mineUserInfoView.balanceBtn .addTarget(self, action:Selector("tappedBalance:"), forControlEvents: UIControlEvents.TouchUpInside)
          self.mineUserInfoView.commentBtn .addTarget(self, action:Selector("tappedComment:"), forControlEvents: UIControlEvents.TouchUpInside)
        self.mineUserInfoView.messageBtn .addTarget(self, action:Selector("tappedMessage:"), forControlEvents: UIControlEvents.TouchUpInside)
        self.mineUserInfoView.loginBtn .addTarget(self, action: Selector("tappedLogin:"), forControlEvents: UIControlEvents.TouchUpInside)
    }
    
    func tappedBalance(button:UIButton){
        
        let loginController =  LoginController()
        let nagvationController=UINavigationController(rootViewController:loginController)
        self.navigationController!.presentViewController(nagvationController, animated: true, completion: nil)
    }
    
    func tappedComment(button:UIButton){
        
    }
    func tappedMessage(button:UIButton){
        print(button.titleForState(.Normal))
    }
    
    
    func tappedLogin(button:UIButton){
        
        let loginController =  LoginController()
         let nagvationController=UINavigationController(rootViewController:loginController)
        self.navigationController!.presentViewController(nagvationController, animated: true, completion: nil)
    }
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return self.dataSource.count
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
                return self.dataSource .objectAtIndex(section).count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell:MinePersonalCell! = self.mineTableView.dequeueReusableCellWithIdentifier(mineHomeCellIdentifier)as! MinePersonalCell
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        cell .loadData(self.dataSource .objectAtIndex(indexPath.section).objectAtIndex(indexPath.row) as! NSDictionary)
        return cell
    }
    
   override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return  13
    }
    
    override func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 1
    }
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.frame = CGRectMake(0, 0, 320, 1)
        view.backgroundColor = UIColor.clearColor()
        return view
    }
    
    override func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView()
        view.frame = CGRectMake(0, 0, 320, 1)
        view.backgroundColor = UIColor.clearColor()
        return view
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
