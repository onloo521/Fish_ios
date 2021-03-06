//
//  LoginViewController.swift
//  Fish1
//
//  Created by Neqeal on 16/3/18.
//  Copyright © 2016年 Hello Fish. All rights reserved.
//

import UIKit

import UIKit
//import Alamofire
//import MBProgressHUD

class LoginViewController: UIViewController,UITextFieldDelegate {
    
    
    @IBOutlet weak var AccountText: UITextField!
    
    @IBOutlet weak var PasswordText: UITextField!
    
    @IBOutlet weak var LoginButton: UIButton!
    
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.hidden = true
        //        XKeyBoard.registerKeyBoardHide(self)
        //        XKeyBoard.registerKeyBoardShow(self)
        AccountText.delegate = self
        PasswordText.delegate = self
        LoginButton.addTarget(self, action: "Login", forControlEvents: UIControlEvents.TouchUpInside)
    }
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBar.hidden=true
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool
    {
        AccountText.resignFirstResponder()
        PasswordText.resignFirstResponder()
        return true
    }
    
    func keyboardWillHideNotification(notification:NSNotification){
        UIView.animateWithDuration(0.3) { () -> Void in
            self.topConstraint.constant = 233
            self.view.layoutIfNeeded()
        }
        
    }
    
    func keyboardWillShowNotification(notification:NSNotification){
        UIView.animateWithDuration(0.3) { () -> Void in
            self.topConstraint.constant = 150
            self.view.layoutIfNeeded()
        }
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    //    func Login(){
    //        if(AccountText.text!.isEmpty){
    //            let hud = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
    //            hud.mode = MBProgressHUDMode.Text
    //            hud.labelText = "请输入账号"
    //            hud.margin = 10.0
    //            hud.removeFromSuperViewOnHide = true
    //            hud.hide(true, afterDelay: 1)
    //            return
    //        }
    //        if(PasswordText.text!.isEmpty){
    //            let hud = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
    //            hud.mode = MBProgressHUDMode.Text
    //            hud.labelText = "请输入密码"
    //            hud.margin = 10.0
    //            hud.removeFromSuperViewOnHide = true
    //            hud.hide(true, afterDelay: 1)
    //            return
    //        }
    //        let url = apiUrl+"applogin"
    //        let param = [
    //            "phone":self.AccountText.text!,
    //            "password":self.PasswordText.text!
    //        ]
    //        Alamofire.request(.GET, url, parameters: param).response { request, response, json, error in
    //            if(error != nil){
    //            }
    //            else{
    //                print("request是")
    //                print(request!)
    //                print("response是")
    //                print(response!)
    //                print("data是")
    //                print(json!)
    //                print("====================")
    //                let status = Httpresult(JSONDecoder(json!))
    //                print("状态是")
    //                print(status.status)
    //                if(status.status == "error"){
    //                    let hud = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
    //                    hud.mode = MBProgressHUDMode.Text;
    //                    hud.labelText = status.errorData
    //                    hud.margin = 10.0
    //                    hud.removeFromSuperViewOnHide = true
    //                    hud.hide(true, afterDelay: 1)
    //                }
    //                if(status.status == "success"){
    //                    print("Success")
    //                    let hud = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
    //                    hud.labelText = "登录成功"
    //                    hud.removeFromSuperViewOnHide = true
    //                    hud.hide(true, afterDelay: 1)
    //                    let userid = NSUserDefaults.standardUserDefaults()
    //                    userid.setValue(status.data?.id, forKey: "userid")
    //                    let schoolid = NSUserDefaults.standardUserDefaults()
    //                    schoolid.setValue(status.data?.schoolid, forKey: "schoolid")
    //                    let classid = NSUserDefaults.standardUserDefaults()
    //                    classid.setValue(status.data?.classid, forKey: "classid")
    //                    self.GetUserInfo()
    //                    let mainStoryboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
    //                    let vc : UIViewController = mainStoryboard.instantiateViewControllerWithIdentifier("MainView")
    //                    self.presentViewController(vc, animated: true, completion: nil)
    //                }
    //            }
    //        }
    //    }
    //
    //    func GetUserInfo(){
    //        let userid = NSUserDefaults.standardUserDefaults()
    //        let uid = userid.stringForKey("userid")
    //        let url = apiUrl+"GetUsers"
    //        let param = [
    //            "userid":uid!
    //        ]
    //        Alamofire.request(.GET, url, parameters: param).response { request, response, json, error in
    //            if(error != nil){
    //            }
    //            else{
    //                print("request是")
    //                print(request!)
    //                print("====================")
    //                let status = MineModel(JSONDecoder(json!))
    //                print("状态是")
    //                print(status.status)
    //                if(status.status == "error"){
    //                    let hud = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
    //                    hud.mode = MBProgressHUDMode.Text;
    //                    hud.labelText = status.errorData
    //                    hud.margin = 10.0
    //                    hud.removeFromSuperViewOnHide = true
    //                    hud.hide(true, afterDelay: 1)
    //                }
    //                if(status.status == "success"){
    //                    print("Success")
    //                    let username = NSUserDefaults.standardUserDefaults()
    //                    username.setValue(status.data?.name, forKey: "username")
    //                }
    //            }
    //        }
    //    }
}