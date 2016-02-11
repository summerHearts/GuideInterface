//
//  OrderListController.swift
//  GuideInterface
//
//  Created by 佐毅 on 16/2/9.
//  Copyright © 2016年 上海乐住信息技术有限公司. All rights reserved.
//

import UIKit

class OrderListController: BaseViewController, YSSegmentedControlDelegate  {

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
    }
    func segmentedControlWillPressItemAtIndex(segmentedControl: YSSegmentedControl, index: Int) {
        print ("[Delegate] segmented will press \(index)")
    }
    
    func segmentedControlDidPressedItemAtIndex(segmentedControl: YSSegmentedControl, index: Int) {
        print ("[Delegate] segmented did pressed \(index)")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
