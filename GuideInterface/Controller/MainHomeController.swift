//
//  MainHomeController.swift
//  GuideInterface
//
//  Created by 佐毅 on 16/2/9.
//  Copyright © 2016年 上海乐住信息技术有限公司. All rights reserved.
//

import UIKit

let mainHomeCellIdentifier = "mainHomeCellIdentifier"
class MainHomeController:BaseViewController ,UICollectionViewDataSource ,UICollectionViewDelegate{

    var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let adPageView:AdPageView = AdPageView(frame: CGRectMake(0,64, UIScreen.mainScreen().bounds.size.width, 120));
        adPageView.setImageList(["1.jpg","2.jpg","3.jpg","4.jpg","5.jpg"]);
        self.view.addSubview(adPageView);
        let flowLayout = UICollectionViewFlowLayout()
        
        self.collectionView = UICollectionView(frame:CGRectMake(0,64+120,UIScreen.mainScreen().bounds.size.width,UIScreen.mainScreen().bounds.size.height-184-46), collectionViewLayout: flowLayout)
        self.collectionView!.delegate = self
        self.collectionView!.dataSource = self
        self.collectionView.backgroundColor = UIColor.whiteColor()
         self.collectionView .registerNib(UINib(nibName: "MainHomeCell", bundle: nil), forCellWithReuseIdentifier: mainHomeCellIdentifier)
        self.view .addSubview(self.collectionView)
    }

    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 10
    }
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    

    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell : MainHomeCell = collectionView.dequeueReusableCellWithReuseIdentifier(mainHomeCellIdentifier, forIndexPath: indexPath)  as! MainHomeCell
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize
    {
        return CGSize(width: UIScreen.mainScreen().bounds.size.width, height: 79);
    }
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat
    {
        return 0.0;
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
