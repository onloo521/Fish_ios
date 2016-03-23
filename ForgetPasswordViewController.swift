//
//  ForgetPasswordViewController.swift
//  Fish
//
//  Created by Neqeal on 16/3/16.
//  Copyright © 2016年 Hello Fish. All rights reserved.
//

import UIKit

class ForgetPasswordViewController:UIViewController
{

    @IBOutlet weak var PhoneNumbertext: UITextField!
    
    @IBOutlet weak var CodeText: UITextField!
    
    @IBOutlet weak var TimeLabel: UILabel!
    
    @IBOutlet weak var GetCodebutton: UIButton!
    
     @IBOutlet weak var NextButton: UIButton!
    var timeNamal:NSTimer!
   
    var timeNow:NSTimer!
    var count:Int = 60
    
    //调用下一步函数和获取验证码函数
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.hidden = false
        GetCodebutton.addTarget(self, action: Selector("GetCode"), forControlEvents: UIControlEvents.TouchUpInside)
        
        NextButton.addTarget(self, action: Selector("Next"), forControlEvents: UIControlEvents.TouchUpInside)
        TimeLabel.hidden = true
        
    }

    
    //判空函数，手机号、验证码是否为空，提示请输入手机号、验证码
    func PanKong()->Bool{
        if(PhoneNumbertext.text!.isEmpty){
            //弹出无取消，确定按钮的对话框
  //          let hud = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
  //          hud.mode = MBProgressHUDMode.Text
  //          hud.labelText = "请输入手机号"
  //          hud.margin = 10.0
  //          hud.removeFromSuperViewOnHide = true
  //          hud.hide(true, afterDelay: 1)
            return false
        }
        if(CodeText.text!.isEmpty){
  //          let hud = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
 //           hud.mode = MBProgressHUDMode.Text
 //           hud.labelText = "请输入验证码"
 //           hud.margin = 10.0
 //           hud.removeFromSuperViewOnHide = true
//            hud.hide(true, afterDelay: 1)
            return false
        }
        return true
    }
    
    //获取验证码，1.判断手机号是否是11位或者空，2.发送验证码到
    //（phoneNumberText.text!）
    func GetCode(){
        if (PhoneNumbertext.text!.isEmpty||PhoneNumbertext.text?.characters.count != 11)
        {
            let alerView:UIAlertView = UIAlertView()
            alerView.title = "手机号输入错误"
            alerView.message = "请重新输入"
            alerView.addButtonWithTitle("确定")
            alerView.cancelButtonIndex = 0
            alerView.delegate = self
            alerView.tag = 1
            alerView.show()
            
        }
        else
        {
            //弹出带有确定或者取消按钮的对话框
            let alerView:UIAlertView = UIAlertView()
            alerView.title = "发送验证码到"
            alerView.message = "\(PhoneNumbertext.text!)"
            alerView.addButtonWithTitle("取消")
            alerView.addButtonWithTitle("确定")
            alerView.cancelButtonIndex = 0
            alerView.delegate = self
            alerView.tag = 0
            alerView.show()
        }
        
    }
    
    //控制发送验证码之后的60s倒计时
    
    func timeDow()
    {
        GetCodebutton.hidden=true
        let time1 = NSTimer.scheduledTimerWithTimeInterval(1.0, target:self, selector: "updateTime", userInfo: nil, repeats: true)
        timeNow = time1
    }
    func showRepeatButton()
    {
        CodeText.hidden=true
        GetCodebutton.hidden = false
        GetCodebutton.enabled = true
    }
    func updateTime()
    {
        count--
        if (count <= 0)
        {
            count = 10
            self.showRepeatButton()
        }
        CodeText.text = "\(count)S"
        
    }
    func alertView(alertView: UIAlertView, clickedButtonAtIndex buttonIndex: Int) {
        
        if alertView.tag == 0
        {
            if buttonIndex == 1
            {
                //根据选择0/1，选择是否调用发送验证码函数，
                GetCodebutton.hidden = true
                CodeText.hidden = false
                self.timeDow()
            }
        }
        if alertView.tag == 1
        {}
        
        if alertView.tag == 2
        {}
    }
    
    //发送验证码函数，调用接口发送手机号给服务器（入参），服务器负责发送给手机号验证码
    func senderMessage(){
        //接口：URL＝接口前缀＋接口地址
 //       let url=apiUrl+"SendMobileCode"
        //入参
        let param=[
            "phone":self.PhoneNumbertext.text!,
            
        ]
        
        //发送网络请求（发送验证码）,无返回数据
    /*    Alamofire.request(.GET, url, parameters: param).response { request, response, json, error in
            if(error != nil){
            }
            else{
            }
            
        }*/
    }
    
    //按钮“下一步”，跳转到指定页面
    func Next(){
        if PanKong()==true{
            let mainStoryboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
            let vc : UIViewController = mainStoryboard.instantiateViewControllerWithIdentifier("ForgetPasswordView")           //self.presentViewController(vc, animated: true, completion: nil)
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //点击空白处，回收键盘
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */

    
}
