//
//  ForgetpasswordSetViewController.swift
//  Fish1
//
//  Created by Neqeal on 16/3/22.
//  Copyright © 2016年 Hello Fish. All rights reserved.
//

import UIKit

class ForgetpasswordSetViewController: UIViewController {
    
    @IBOutlet weak var PasswordText: UITextField!
    
    @IBOutlet weak var AgainPassword: UITextField!
    
    @IBOutlet weak var Finishbutton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Finishbutton.addTarget(self, action: ("PanKong"), forControlEvents: UIControlEvents.TouchDragInside)
        // Do any additional setup after loading the view.
    }
    func Finish()
    {
    if PanKong() == true
    {
        UpdatePassword()
        }
        
    }

    func UpdatePassword()
    {
    let userid = NSUserDefaults.standardUserDefaults()
//    let uid = userid.stringForKey("userid")
//        let url =func UpdatePassword(){
            
//            let userid = NSUserDefaults.standardUserDefaults()
            let uid = userid.stringForKey("userid")
            
//            let url = apiUrl+"forgetPass_Activate"
            let params = [
                "userid":uid!,
//                "pass":setPassword.text!
            ]
/*            Alamofire.request(.GET, url, parameters: params).response { request, response, json, error in
                if(error != nil){
                }
                else{
                    print("request是")
                    print(request!)
                    print("====================")
                    let status = Httpresult(JSONDecoder(json!))
                    print("状态是")
                    print(status.status)
                    if(status.status == "error"){
                        let hud = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
                        hud.mode = MBProgressHUDMode.Text;
                        hud.labelText = status.errorData
                        hud.margin = 10.0
                        hud.removeFromSuperViewOnHide = true
                        hud.hide(true, afterDelay: 1)
                    }
                    if(status.status == "success"){
                        let hud = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
                        hud.mode = MBProgressHUDMode.Text;
                        hud.labelText = "修改成功"
                        hud.margin = 10.0
                        hud.removeFromSuperViewOnHide = true
                        hud.hide(true, afterDelay: 1)
                        self.navigationController?.popToRootViewControllerAnimated(true)
                    }
                }
            }
        }*/

    }
    
    func PanKong()->Bool{
        if(PasswordText.text!.isEmpty){
//            let hud = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
//            hud.mode = MBProgressHUDMode.Text
//            hud.labelText = "请输入密码"
//            hud.margin = 10.0
//            hud.removeFromSuperViewOnHide = true
//            hud.hide(true, afterDelay: 1)
            return false
        }
        if(AgainPassword.text!.isEmpty){
//            let hud = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
//            hud.mode = MBProgressHUDMode.Text
//            hud.labelText = "请再次输入密码"
//            hud.margin = 10.0
//            hud.removeFromSuperViewOnHide = true
//            hud.hide(true, afterDelay: 1)
            return false
        }
        if(PasswordText.text! != AgainPassword.text!){
//            let hud = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
//            hud.mode = MBProgressHUDMode.Text
//            hud.labelText = "两次密码不正确"
//            hud.margin = 10.0
//            hud.removeFromSuperViewOnHide = true
//            hud.hide(true, afterDelay: 1)
            return false
        }
        return true
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}