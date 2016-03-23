//
//  RegisterViewcontroller.swift
//  Fish
//
//  Created by Neqeal on 16/3/15.
//  Copyright © 2016年 Hello Fish. All rights reserved.
//

import UIKit

class RegisterGetViewController: UIViewController {
    @IBOutlet weak var PhoneNumber: UITextField!
    
    @IBOutlet weak var CodeText: UITextField!
    
    @IBOutlet weak var TimeLabel: UILabel!
    
    @IBOutlet weak var CodeButton: UIButton!
    
    @IBOutlet weak var NextButton: UIButton!
    
    
    var timeNamal:NSTimer!
    var timeNow:NSTimer!
    var count:Int = 60
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.hidden = false
        CodeButton.addTarget(self, action: Selector("timeDow"), forControlEvents: UIControlEvents.TouchUpInside)
    }
    
    //判空函数，手机号、验证码是否为空，提示请输入手机号、验证码
    func PanKong()->Bool{
        if(PhoneNumber.text!.isEmpty){
            //弹出无取消，确定按钮的对话框
           // let hud = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
           // hud.mode = MBProgressHUDMode.Text
          //  hud.labelText = "请输入手机号"
          //  hud.margin = 10.0
         //   hud.removeFromSuperViewOnHide = true
         //   hud.hide(true, afterDelay: 1)
            return false
        }
        if(CodeText.text!.isEmpty){
        //    let hud = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
        //    hud.mode = MBProgressHUDMode.Text
        //    hud.labelText = "请输入验证码"
        //    hud.margin = 10.0
       //     hud.removeFromSuperViewOnHide = true
       //     hud.hide(true, afterDelay: 1)
            return false
        }
        return true
    }
    
    //获取验证码，1.判断手机号是否是11位或者空，2.发送验证码到
    //（phoneNumberText.text!）
    func GetCode(){
        if(PhoneNumber.text!.isEmpty || PhoneNumber.text?.characters.count != 11 ){
            let alerView:UIAlertView = UIAlertView()
            alerView.title = "手机号输入错误"
            alerView.message = "请重新输入"
            alerView.addButtonWithTitle("确定")
            alerView.cancelButtonIndex = 0
            alerView.delegate = self
            alerView.tag = 1  //确定按钮
            alerView.show()
        }
        else
        {
            //弹出带有确定或者取消按钮的对话框
            let alerView:UIAlertView = UIAlertView()
            alerView.title = "发送验证码到"
            alerView.message = "\(PhoneNumber.text!)"
            alerView.addButtonWithTitle("取消")
            alerView.addButtonWithTitle("确定")
            alerView.cancelButtonIndex = 0
            alerView.delegate = self
            alerView.tag = 0
            alerView.show()
            
            
        }
        
    }
    
    func Next(){
//        if PandKong()==true{
//            RegisterYanZheng()
//        }
        
    }
    /*func RegisterYanZheng(){
    let url = apiUrl+"UserVerify"
    let param = [
    "phone":self.phoneNumberText.text!,
    "code":self.codeText.text!
    ]
    print(url)
    Alamofire.request(.GET, url, parameters: param).response { request, response, json, error in
    if(error != nil){
    }
    else{
    print("request是")
    print(request!)
    print("====================")
    let status = Httpresult(JSONDecoder(json!))
    print(JSONDecoder(json!))
    print("状态是")
    print(status.status)
    if(status.status == "error"){
    let hud = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
    hud.mode = MBProgressHUDMode.Text;
    hud.labelText = status.errorData
    hud.margin = 10.0
    hud.removeFromSuperViewOnHide = true
    hud.hide(true, afterDelay: 3)
    }
    if(status.status == "success"){
    let userid = NSUserDefaults.standardUserDefaults()
    userid.setValue(status.data?.id, forKey: "userid")
    let mainStoryboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
    let vc : UIViewController = mainStoryboard.instantiateViewControllerWithIdentifier("SetPasswordView")
    self.navigationController?.pushViewController(vc, animated: true)
    }
    }
    }
    }*/
    
    func timeDow()
    {
        CodeButton.hidden=true
        let time1 = NSTimer.scheduledTimerWithTimeInterval(1.0, target:self, selector: "updateTime", userInfo: nil, repeats: true)
        timeNow = time1
    }
    func showRepeatButton()
    {
        CodeText.hidden=true
        CodeButton.hidden = false
        CodeButton.enabled = true
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
                CodeButton.hidden = true
                CodeText.hidden = false
                self.timeDow()
            }
        }
        if alertView.tag == 1
        {}
        
        if alertView.tag == 2
        {}
    }

    func senderMessage()
    {
//        let url = apiUrl+"SendMobileCode"
        let param = [
            "phone":self.PhoneNumber.text!,
        ]
//        Alamofire.request(.GET, url, parameters: param).response { request, response, json, error in
//            if(error != nil){
//            }
//            else{
//            }
//        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "PhoneNumber"){
            
            
        }
        
    }
}