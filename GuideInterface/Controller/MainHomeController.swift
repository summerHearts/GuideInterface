//
//  MainHomeController.swift
//  GuideInterface
//
//  Created by 佐毅 on 16/2/9.
//  Copyright © 2016年 上海乐住信息技术有限公司. All rights reserved.
//

import UIKit

let mainHomeCellIdentifier = "mainHomeCellIdentifier"
let mainHomeBannerCellIdentifier = "mainHomeBannerCellIdentifier"
class MainHomeController:BaseViewController ,UICollectionViewDataSource ,UICollectionViewDelegate{

    var collectionView: UICollectionView!
    var adPageView:AdPageView!
    var imageDataList: NSArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()
  
        let flowLayout = UICollectionViewFlowLayout()

        self.collectionView = UICollectionView(frame:CGRectMake(0,0,UIScreen.mainScreen().bounds.size.width,UIScreen.mainScreen().bounds.size.height-46), collectionViewLayout: flowLayout)
        self.collectionView!.delegate = self
        self.collectionView!.dataSource = self
        self.collectionView.backgroundColor = UIColor.whiteColor()
         self.collectionView .registerNib(UINib(nibName: "MainHomeCell", bundle: nil), forCellWithReuseIdentifier: mainHomeCellIdentifier)
        self.collectionView.registerClass(mainHomeBannerCell.classForCoder(), forCellWithReuseIdentifier: mainHomeBannerCellIdentifier)
        self.view .addSubview(self.collectionView)
    }

    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 10
    }
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    

    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        if indexPath.section == 0{
            let cell : mainHomeBannerCell = collectionView.dequeueReusableCellWithReuseIdentifier(mainHomeBannerCellIdentifier, forIndexPath: indexPath)  as! mainHomeBannerCell
            self.adPageView = AdPageView(frame: CGRectMake(0,0, UIScreen.mainScreen().bounds.size.width, 120));
            self.imageDataList = NSArray().arrayByAddingObjectsFromArray(["1.jpg","2.jpg","3.jpg","4.jpg","5.jpg","6.jpg","7.jpg","8.jpg","4.jpg","1.jpg"])
            self.adPageView.setImageList(["1.jpg","2.jpg","3.jpg","4.jpg","5.jpg","6.jpg","7.jpg","8.jpg","4.jpg","1.jpg"]);
            cell .addSubview(self.adPageView)
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
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
