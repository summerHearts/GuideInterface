//
//  GiudeInterface.swift
//  GuideInterface
//
//  Created by 佐毅 on 16/2/8.
//  Copyright © 2016年 上海乐住信息技术有限公司. All rights reserved.
//


import UIKit
import Foundation

private let kScreenWidth     = UIScreen .mainScreen().bounds.size.width

private let kScreenHeight    = UIScreen .mainScreen().bounds.size.height

private let gNavgationHeight = UIScreen .mainScreen().bounds.size.height

class GiudeInterface: BaseViewController,UIScrollViewDelegate {
    
    var startLoadFirst:(()->Void)?
    
    var scrollView:UIScrollView!
    
    var pageControl:UIPageControl!
    
    var mutableArray: NSMutableArray?
    
    let navH = CGFloat(Float(gNavgationHeight))
    
    override func viewDidLoad() {
        self.automaticallyAdjustsScrollViewInsets = false
        
        initScrollView()
    }
    
    
    func initScrollView(){
        let arr = ["1.jpg","2.jpg","3.jpg","4.jpg","5.jpg"]
        if self.scrollView == nil {
            self.scrollView = UIScrollView.init(frame: CGRectMake(0, 0, kScreenWidth, kScreenHeight))
            self.scrollView.delegate = self
            self.scrollView.pagingEnabled = true
            self.scrollView.showsHorizontalScrollIndicator = false
            self.scrollView.showsVerticalScrollIndicator = false
            self.view.addSubview(self.scrollView)
            
            self.scrollView.contentSize = CGSizeMake(kScreenWidth * CGFloat(Float(arr.count)), kScreenHeight)
            
            for var i = 0 ;i < arr.count ; i++ {
                let index = CGFloat(Float(i))
                let imgView = UIImageView.init(frame: CGRectMake(index * kScreenWidth, 0, kScreenWidth, kScreenHeight))
                imgView.image = UIImage(named: arr[i])
                self.scrollView.addSubview(imgView)
                
                if i == arr.count - 1 {
                    imgView.userInteractionEnabled = true
                    
                    let button = UIButton.init(type: UIButtonType.Custom)
                    button.frame = CGRectMake((kScreenWidth - 200) / 2, kScreenHeight - 94, 200, 45)
                    button.setTitle("立即体验", forState: UIControlState.Normal)
                    button.backgroundColor = UIColor.orangeColor()
                    button.titleLabel?.font = UIFont.systemFontOfSize(18)
                    button.layer.cornerRadius = 5
                    button.layer.masksToBounds = true
                    button.addTarget(self, action: "clickButton:", forControlEvents: UIControlEvents.TouchUpInside)
                    imgView.addSubview(button)
                }
            }
        }
        
        if self.pageControl == nil {
            self.pageControl = UIPageControl.init(frame: CGRectMake((kScreenWidth - 150) / 2, kScreenHeight - 45, 150, 30))
            self.pageControl.numberOfPages = arr.count
            self.view.addSubview(self.pageControl)
            self.pageControl.pageIndicatorTintColor = UIColor.whiteColor()
            self.pageControl.currentPageIndicatorTintColor = UIColor.orangeColor()
        }
    }
    
    func clickButton(sender: UIButton) {
        
        startLoadFirst!()
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        
        let index = scrollView.contentOffset.x / kScreenWidth
        self.pageControl.currentPage = Int(index)
    }

    
}