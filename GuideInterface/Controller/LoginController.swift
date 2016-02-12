//
//  LoginController.swift
//  GuideInterface
//
//  Created by 佐毅 on 16/2/12.
//  Copyright © 2016年 上海乐住信息技术有限公司. All rights reserved.
//

import UIKit

class LoginController: BaseViewController ,UITextFieldDelegate{
    //手机号textField
    @IBOutlet weak var phoneTextField: UITextField!
    //验证码textField
    @IBOutlet weak var verificationCodeTextField: UITextField!
    //获取验证码按钮
    @IBOutlet weak var getVerificationCodeBtn: UIButton!
    //获取语音验证码按钮
    @IBOutlet weak var voiceVerificationCodeBtn: UIButton!
    //邀请码按钮
    @IBOutlet weak var invitationCodeBtn: UIButton!
    //邀请码View
    @IBOutlet weak var invitationView: UIView!
    
    //输入信息View
    @IBOutlet weak var inputInformationView: UIView!
    //取消按钮
    @IBOutlet weak var closeBtn: UIButton!
    //输入邀请码textField
    @IBOutlet weak var inviteCodeTextField: UITextField!
    //确认验证按钮
    @IBOutlet weak var sureCheckBtn: UIButton!
    //微信登录按钮
    @IBOutlet weak var weiChatLoginBtn: UIButton!
    //隐私协议label
    @IBOutlet weak var privacyPolicyLabel: UILabel!
    
    @IBAction func clostBtnAction(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: {})
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.fd_prefersNavigationBarHidden = true;
        self.fd_interactivePopMaxAllowedInitialDistanceToLeftEdge=200;
        
        //键盘返回类型
        self.phoneTextField.delegate = self;
        self.verificationCodeTextField.delegate = self;
        self.phoneTextField.clearButtonMode = UITextFieldViewMode.Always
        self.phoneTextField.keyboardType = UIKeyboardType.NumberPad;
        self.verificationCodeTextField.keyboardType = UIKeyboardType.NumberPad;
        //获取验证码
        self.getVerificationCodeBtn.layer.cornerRadius = 4.0
        self.getVerificationCodeBtn.layer.masksToBounds = true
        //获取输入信息View
        self.inputInformationView.layer.masksToBounds = true
        self.inputInformationView.layer.cornerRadius = 4.0
        self.inputInformationView.layer.borderColor = UIColor(rgba: "#e1e1e1").CGColor
        //确认按钮
        self.sureCheckBtn.layer.masksToBounds = true
        self.sureCheckBtn.layer.cornerRadius = 26.5
        self.sureCheckBtn .addTarget(self, action:Selector("sureCheckAction:"), forControlEvents: UIControlEvents.TouchUpInside)
    }
    
    
    func sureCheckAction(button:UIButton){
       self.dismissViewControllerAnimated(true, completion: {})
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
