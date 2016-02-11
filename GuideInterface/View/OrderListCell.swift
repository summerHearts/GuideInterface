//
//  OrderListCell.swift
//  GuideInterface
//
//  Created by 佐毅 on 16/2/11.
//  Copyright © 2016年 上海乐住信息技术有限公司. All rights reserved.
//

import Foundation

class OrderListCell: UITableViewCell {
    //订单状态
    @IBOutlet weak var orderStatusLabel: UILabel!
    //支付类型
    @IBOutlet weak var payMethodLabel: UILabel!
    //支付价格
    @IBOutlet weak var payPriceLabel: UILabel!
    //酒店名称
    @IBOutlet weak var hotelNameLabel: UILabel!
    //入住时间
    @IBOutlet weak var checkInLabel: UILabel!
    //离店时间
    @IBOutlet weak var leaveLabel: UILabel!
    //总共入住时间
    @IBOutlet weak var totalLabel: UILabel!
    //房型类型
    @IBOutlet weak var roomTypeLabel: UILabel!
    //再次预订
    @IBOutlet weak var reservationAgainButton: UIButton!
    //评价
    @IBOutlet weak var evaluateButton: UIButton!
    
    func loadData(dic:NSDictionary!){
        self.orderStatusLabel.text = "已支付"
        self.payMethodLabel.text = "在线支付"
        self.payPriceLabel.text = "80"
        self.hotelNameLabel.text = "如家酒店"
        self.checkInLabel.text = "15-04入住"
        self.leaveLabel.text = "15-09入住"
        self.totalLabel.text = "共9天"
        self.roomTypeLabel.text = "豪华大床房"
    }
}
