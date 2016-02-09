//
//  MinePersonalCell.swift
//  GuideInterface
//
//  Created by 佐毅 on 16/2/9.
//  Copyright © 2016年 上海乐住信息技术有限公司. All rights reserved.
//

import Foundation
import UIKit

class MinePersonalCell: UITableViewCell {

    @IBOutlet weak var leftImageView: UIImageView!
    @IBOutlet weak var personalLabel: UILabel!
    
    func loadData(dic:NSDictionary!){
        
        leftImageView.image = UIImage(named: dic.objectForKey("image")as! String)
        personalLabel.text =  dic.objectForKey("name")as? String

    }
}
