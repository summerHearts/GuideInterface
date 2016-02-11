//
//  MainHomeController.swift
//  GuideInterface
//
//  Created by 佐毅 on 16/2/9.
//  Copyright © 2016年 上海乐住信息技术有限公司. All rights reserved.
//

import UIKit

class MainHomeController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let adPageView:AdPageView = AdPageView(frame: CGRectMake(0,64, UIScreen.mainScreen().bounds.size.width, 120));
        adPageView.setImageList(["1.jpg","2.jpg","3.jpg","4.jpg","5.jpg"]);
        self.view.addSubview(adPageView);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
