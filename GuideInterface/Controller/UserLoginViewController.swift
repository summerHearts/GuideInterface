//
//  UserLoginViewController.swift
//  GuideInterface
//
//  Created by 佐毅 on 16/2/9.
//  Copyright © 2016年 上海乐住信息技术有限公司. All rights reserved.
//

import UIKit
import Alamofire
import SCLAlertView
import SwiftyJSON

var userDefaults:NSUserDefaults = NSUserDefaults.standardUserDefaults()
var userWeibo:UserWeibo = UserWeibo()
var loginState:Bool  = false

class UserLoginViewController: UIViewController {
    var navigationTitle = UILabel()
    
    @IBOutlet weak var qqBut: UIButton!
    
    @IBOutlet weak var logoutBut: UIButton!
    @IBOutlet weak var weiboBut: UIButton!
    @IBOutlet weak var userName: UILabel!
    
    override func viewWillAppear(animated: Bool) {
        
        super.viewWillAppear(animated)
        self.reloadInputViews()
    }
    
    @IBAction func qqLoginAction(sender: UIButton) {
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true

        let snsPlatform:UMSocialSnsPlatform = UMSocialSnsPlatformManager.getSocialPlatformWithName(UMShareToQQ)
        
        var  response:UMSocialResponseEntity
        snsPlatform.loginClickHandler(self,UMSocialControllerService.defaultControllerService(),true,{(response :UMSocialResponseEntity!) ->Void in
            
            let usm = UMSResponseCodeSuccess
            let rcode = response.responseCode
            
            if rcode == usm{
                
                var snsAccount = UMSocialAccountManager.socialAccountDictionary()
                
                let qqUser:UMSocialAccountEntity =  snsAccount[UMShareToQQ] as! UMSocialAccountEntity
                
                //用户id
                let usid = qqUser.usid
                //微博昵称
                let username = qqUser.userName
                //用户头像
                let icon = qqUser.iconURL
                
                if snsAccount != nil{
                    
                    let parameters = [
                        "nickname": username,
                        "face":icon,
                        "user_client_id": usid,
                        "platform_id": "2",
                    ]
                    Alamofire.request(.POST, "login", parameters:parameters ).responseJSON {response in
                        
                        //            debugPrint(response)
                        switch response.result {
                        case .Success:
                            //把得到的JSON数据转为字典
                                let data = JSON(response.result.value!)

                                let peopleDict = data["people"].dictionary
                                
                                print(peopleDict?.keys)
                                userWeibo.platform_id = 1
                                userWeibo.face = icon
                                userWeibo.nickname = username
                                userWeibo.user_client_id = usid
                                
                                //保存当前用户信息到缓存中
                                userDefaults.setObject(username, forKey: "username")
                                userDefaults.setObject(icon, forKey: "face")
                                userDefaults.setObject(usid, forKey: "user_client_id")
                                userDefaults.setObject(1, forKey: "platform_id")
                                
                                userDefaults.synchronize()
                                
                                SCLAlertView().showSuccess("登录成功", subTitle: "恭喜你登录成功", closeButtonTitle: "确定")
                                loginState = true
                                self.navigationController?.popToRootViewControllerAnimated(true)
                                
                        case .Failure(let error):
                            print(error)
                              SCLAlertView().showError("登录失败", subTitle: "登录失败", closeButtonTitle: "确定")
                        }
                        
                    }
                    
                }
            }
        })
    }

    
    
    
    @IBAction func loginoutAction(sender: UIButton) {
        //用户登出
        //删除当前用户信息到缓存中
        userDefaults.removeObjectForKey("username")
        userDefaults.removeObjectForKey("face")
        userDefaults.removeObjectForKey("user_client_id")
        userDefaults.removeObjectForKey("platform_id")
        userDefaults.synchronize()
        
        SCLAlertView().showSuccess("", subTitle: "登出成功", closeButtonTitle: "确定")
        loginState = false
        self.weiboBut.hidden = false
        self.qqBut.hidden = false
        viewDidLoad()
    
    }
    
    @IBAction func loginAction(sender: UIButton) {
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true

        let snsPlatform:UMSocialSnsPlatform = UMSocialSnsPlatformManager.getSocialPlatformWithName(UMShareToSina)
        
        var  response:UMSocialResponseEntity
        snsPlatform.loginClickHandler(self,UMSocialControllerService.defaultControllerService(),true,{(response :UMSocialResponseEntity!) ->Void in
            
            let usm = UMSResponseCodeSuccess
            let rcode = response.responseCode
            
            if rcode == usm{
                
                var snsAccount = UMSocialAccountManager.socialAccountDictionary()
                
                let sniaUser:UMSocialAccountEntity =  snsAccount[UMShareToSina] as! UMSocialAccountEntity
                
                //用户id
                let usid = sniaUser.usid
                //微博昵称
                let username = sniaUser.userName
                //用户头像
                let icon = sniaUser.iconURL
                
                if snsAccount != nil{
                    
                    let parameters = [
                        "nickname": username,
                        "face":icon,
                        "user_client_id": usid,
                        "platform_id": "1",
                    ]
                    
                    Alamofire.request(.POST, "login", parameters:parameters ).responseJSON {response in
                        
                        //            debugPrint(response)
                        switch response.result {
                        case .Success:
                            //把得到的JSON数据转为字典
                            let data = JSON(response.result.value!)
                            
                            let peopleDict = data["people"].dictionary
                            
                            print(peopleDict?.keys)
                            userWeibo.platform_id = 1
                            userWeibo.face = icon
                            userWeibo.nickname = username
                            userWeibo.user_client_id = usid
                            
                            //保存当前用户信息到缓存中
                            userDefaults.setObject(username, forKey: "username")
                            userDefaults.setObject(icon, forKey: "face")
                            userDefaults.setObject(usid, forKey: "user_client_id")
                            userDefaults.setObject(1, forKey: "platform_id")
                            
                            userDefaults.synchronize()
                            
                            SCLAlertView().showSuccess("登录成功", subTitle: "恭喜你登录成功", closeButtonTitle: "确定")
                            loginState = true
                            self.navigationController?.popToRootViewControllerAnimated(true)
                            
                        case .Failure(let error):
                            print(error)
                            SCLAlertView().showError("登录失败", subTitle: "登录失败", closeButtonTitle: "确定")
                        }
                        
                    }
                    
                }
            }
        })
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        let iOS7:Bool = Define.ifIOS7()
        let screenHeight:CGFloat = Define.screenHeight()
        let screenWidth:CGFloat = Define.screenWidth()
        
        UINavigationBar.appearance().frame = CGRect(x:0.0,y:20.0,width:screenWidth,height:screenHeight-20)
        
        //设置Nav
        if iOS7==true {
            navigationTitle.frame = CGRect(x:(screenWidth-200)/2,y:20.0,width:200,height:44)
        }else{
            navigationTitle.frame = CGRect(x:(screenWidth-200)/2,y:0.0,width:200,height:44)
        }
        self.navigationTitle.text = "我的账号"
        self.navigationTitle.textColor=UIColor.whiteColor()
        navigationTitle.backgroundColor = UIColor.clearColor()
        navigationTitle.textAlignment = NSTextAlignment.Center
        self.navigationItem.titleView = navigationTitle
        //判断登录
        if loginState{
            if userWeibo.platform_id == 1{//微博登录
                self.weiboBut.hidden = true
            }
            if userWeibo.platform_id == 2{//QQ登录
                self.qqBut.hidden = true

            }
            self.userName.text = "\(userWeibo.nickname)"

        }else{
            self.userName.hidden = true
            self.logoutBut.hidden = true
            self.weiboBut.hidden = false
            self.qqBut.hidden = false


        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   
    
    
}
