//
//  BaseViewController.swift
//  GuideInterface
//
//  Created by 佐毅 on 16/2/9.
//  Copyright © 2016年 上海乐住信息技术有限公司. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.automaticallyAdjustsScrollViewInsets = false
        self.loadDefaultDataSource()
        self.initComponents()
        self.initViews()
    }

    /**
     *  加载默认数据
     */
    func loadDefaultDataSource(){
        
    }
    /**
     *  加载数据源
     */
    func loadDataSource(){
        
    }
    
    /**
     *  加载UI样式
     */
    func initViews(){
        self.view.backgroundColor = UIColor.whiteColor()

    }
    
    /**
     *  加载组件
     */
    func initComponents(){
        
    }
    
    /**
     *  设置CGRectZero从导航栏下开始计算
     */
    func configuraEdgesForExtendedLayout(){
        
        if self.respondsToSelector("setEdgesForExtendedLayout:"){
            self.edgesForExtendedLayout = UIRectEdge.None
        }
    }
    
    /**
     *  将要pop时候
     */
    func willPopViewController(){
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
