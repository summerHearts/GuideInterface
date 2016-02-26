//
//  MainHomeController.swift
//  GuideInterface
//
//  Created by 佐毅 on 16/2/9.
//  Copyright © 2016年 上海乐住信息技术有限公司. All rights reserved.
//

import UIKit
import MJRefresh
import MJExtension
import SwiftyJSON

let APP_WIDTH       = UIScreen.mainScreen().bounds.size.width

let mainHomeCellIdentifier       = "mainHomeCellIdentifier"
let mainHomeBannerCellIdentifier = "mainHomeBannerCellIdentifier"

class MainHomeController:BaseViewController ,UICollectionViewDataSource ,UICollectionViewDelegate{

    var collectionView: UICollectionView!
    var adPageView:AdPageView!
    var imageDataList: NSArray!
    var searchView : UIView!
    var searchButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
 
        let flowLayout = UICollectionViewFlowLayout()
        self.collectionView = UICollectionView(frame:CGRectMake(0,64,UIScreen.mainScreen().bounds.size.width,UIScreen.mainScreen().bounds.size.height-64-44), collectionViewLayout: flowLayout)
        self.collectionView!.delegate = self
        self.collectionView!.dataSource = self
        self.collectionView.backgroundColor = UIColor.whiteColor()
         self.collectionView .registerNib(UINib(nibName: "MainHomeCell", bundle: nil), forCellWithReuseIdentifier: mainHomeCellIdentifier)
        self.collectionView.registerClass(mainHomeBannerCell.classForCoder(), forCellWithReuseIdentifier: mainHomeBannerCellIdentifier)
        self.view .addSubview(self.collectionView)
        //MJ进行下拉刷新
        self.collectionView.mj_header = MJRefreshNormalHeader(refreshingTarget: self, refreshingAction: "downRefresh")
        //MJ上拉加载
        self.collectionView.mj_footer = MJRefreshAutoFooter(refreshingTarget: self, refreshingAction: "upRefresh")
    }
    
    //下拉刷新
    func downRefresh(){
        let manager = HTTPRequestManager()
        manager.dataRequest(method: HTTPRequestManager.Method.POST, urlString: "XXXXX", parameter: ["hotelid": "450300000069"]){
            (responseObject, error) -> Void in
            if  (responseObject != nil) {
                let json = JSON(responseObject!)
                
                print("JSON: \(json)")
            }
           
            
            self.collectionView.mj_header.endRefreshing()
        }
    }
    
    //上拉刷新
    func upRefresh(){
        let manager = HTTPRequestManager()
        manager.dataRequest(method: HTTPRequestManager.Method.POST, urlString: "XXXXXXXXX", parameter: ["foo": "bar"]){
            (responseObject, error) -> Void in
            print(responseObject)
            self.collectionView.mj_header.endRefreshing()
        }
    }

    func initSearchView(){
        self.searchView = UIView(frame: CGRectMake(0, 0, APP_WIDTH, 44))
        self.searchView.backgroundColor = UIColor(rgba: "#FFAE00")
        let backgroundImageView = UIImageView(frame: CGRectMake(6, 6, APP_WIDTH-12, 44-12))
        backgroundImageView.image = UIImage(named: "searchbar_bg")?.resizableImageWithCapInsets(UIEdgeInsetsMake(5, 20, 5, 20), resizingMode: UIImageResizingMode.Stretch)
        self.searchView .addSubview(backgroundImageView)
        
        self.searchButton = UIButton(frame: CGRectMake(0, 0, APP_WIDTH, 44))
        self.searchButton.setTitle("查找附近3km酒店", forState:UIControlState.Normal) //普通状态下的文字
        self.searchButton .addTarget(self, action:Selector("searchTapAction:"), forControlEvents: UIControlEvents.TouchUpInside)
        self.searchButton.setImage(UIImage(named:"hotelsearchicon"),forState:.Normal)
        self.searchButton.setTitleColor(UIColor(rgba: "#9E9E9E"),forState: .Normal) //普通状态下文字的颜色
        self.searchButton.titleLabel?.font = UIFont.systemFontOfSize(12)
        self.searchButton.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 10)
        self.searchView.addSubview(self.searchButton)
    }
    
    func searchTapAction(button:UIButton){
        print("搜索文字为")
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 12
    }
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    

    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        if indexPath.section == 0{
            let cell : mainHomeBannerCell = collectionView.dequeueReusableCellWithReuseIdentifier(mainHomeBannerCellIdentifier, forIndexPath: indexPath)  as! mainHomeBannerCell
            self.adPageView = AdPageView(frame: CGRectMake(0,0, UIScreen.mainScreen().bounds.size.width, 120));
            self.imageDataList = NSArray().arrayByAddingObjectsFromArray(["1.jpg","2.jpg","3.jpg","4.jpg","5.jpg","6.jpg","7.jpg","8.jpg","2.jpg","3.jpg","4.jpg","1.jpg"])
            self.adPageView.setImageList(["1.jpg","2.jpg","3.jpg","4.jpg","5.jpg","6.jpg","7.jpg","8.jpg","2.jpg","3.jpg","4.jpg","1.jpg"]);
            cell .addSubview(self.adPageView)
            self.initSearchView()
            cell.addSubview(self.searchView)
            return cell
        }else{
            let cell : MainHomeCell = collectionView.dequeueReusableCellWithReuseIdentifier(mainHomeCellIdentifier, forIndexPath: indexPath)  as! MainHomeCell
            cell.mainHomeImageView.image = UIImage(named: self.imageDataList[indexPath.section] as! String)
            return cell
        }
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize
    {
        if indexPath.section == 0 {
            return CGSize(width: UIScreen.mainScreen().bounds.size.width, height: 120);
        }else{
            return CGSize(width: UIScreen.mainScreen().bounds.size.width, height: 79);
        }
    }
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat
    {
        return 0.0;
    }
    
    func scrollViewWillEndDragging(scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        if (targetContentOffset.memory.y < 44){
            
            if (targetContentOffset.memory.y>44/3*2) {
                scrollView.setContentOffset( CGPointMake(scrollView.contentOffset.x , 44 ), animated: true )
            }else{
                scrollView.setContentOffset( CGPointMake(scrollView.contentOffset.x , 0), animated: true )
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
