//
//  MainTabBarControllerViewController.swift
//  GuideInterface
//
//  Created by 佐毅 on 16/2/9.
//  Copyright © 2016年 上海乐住信息技术有限公司. All rights reserved.
//
import UIKit
import UIColor_Hex_Swift

let mainHomeImageNormal     = "tab_home"
let mainHomeImageSelected   = "tab_home_active"

let orderListImageNormal    = "tab_order"
let orderListImageSelected  = "tab_order_active"

let mineHomeImageNormal     = "tab_mine"
let mineHomeImageSelected   = "tab_mine_active"

class MainTabBarController: UITabBarController {
    var tabBarControllers:UITabBarController!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        UINavigationBar.appearance().barStyle = UIBarStyle.Black
        UINavigationBar.appearance().barTintColor  =  UIColor(rgba: "#ffce00")
        UINavigationBar.appearance().tintColor = UIColor.whiteColor()
        
        let nav1 = UINavigationController()
        nav1.tabBarItem.title = "住店"
        nav1.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName:UIColor(rgba: "#ffce00")], forState: UIControlState.Selected)
        var tabBarImage = UIImage(named: mainHomeImageNormal)
        tabBarImage = tabBarImage!.imageWithRenderingMode(.AlwaysOriginal)
        nav1.tabBarItem.image = tabBarImage
        
        var oImage = UIImage(named:mainHomeImageSelected )
        oImage = oImage!.imageWithRenderingMode(.AlwaysOriginal)
        nav1.tabBarItem.selectedImage = oImage
        
        let mainHomeVC = MainHomeController()
        mainHomeVC.view.backgroundColor = UIColor.whiteColor()
        mainHomeVC.title = "住店"
        nav1.viewControllers = [mainHomeVC]

        
        let nav2 = UINavigationController()
        nav2.tabBarItem.title = "订单"
        nav2.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName:UIColor(rgba: "#ffce00")], forState: UIControlState.Selected)

        tabBarImage = UIImage(named: orderListImageNormal)
        tabBarImage = tabBarImage!.imageWithRenderingMode(.AlwaysOriginal)
        nav2.tabBarItem.image = tabBarImage
        
        var oImages = UIImage(named:orderListImageSelected )
        oImages = oImages!.imageWithRenderingMode(.AlwaysOriginal)
        nav2.tabBarItem.selectedImage = oImages
        
        let orderListVC = OrderListController()
        orderListVC.view.backgroundColor = UIColor.whiteColor()
        orderListVC.title = "订单"
        
        nav2.viewControllers = [orderListVC]
        
        let nav3 = UINavigationController()
        nav3.tabBarItem.title = "我的"
        nav3.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName:UIColor(rgba: "#ffce00")], forState: UIControlState.Selected)
        tabBarImage = UIImage(named: mineHomeImageNormal)
        tabBarImage = tabBarImage!.imageWithRenderingMode(.AlwaysOriginal)
        nav3.tabBarItem.image = tabBarImage
        
        var oImagess = UIImage(named:mineHomeImageSelected )
        oImagess = oImagess!.imageWithRenderingMode(.AlwaysOriginal)
        nav3.tabBarItem.selectedImage = oImagess
        
        let mineHomeVC = MineHomeController()
        mineHomeVC.view.backgroundColor = UIColor.whiteColor()
        mineHomeVC.title = "我的"
        nav3.viewControllers = [mineHomeVC]
    
        let tabs = UITabBarController()
        tabs.viewControllers = [nav1,nav2,nav3]
        self.tabBarControllers = tabs

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
