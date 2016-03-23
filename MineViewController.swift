//
//  MineViewController.swift
//  Fish1
//
//  Created by Neqeal on 16/3/20.
//  Copyright © 2016年 Hello Fish. All rights reserved.
//

import UIKit

class MineViewController: UIViewController {

    @IBOutlet weak var scroll: UIScrollView!
    @IBOutlet weak var PageContr: UIPageControl!
    
    var timer:NSTimer!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        //设置titleView为
        let titleSegment=UISegmentedControl(items: ["消息", "电话"])
        titleSegment.selectedSegmentIndex=0
        self.navigationItem.titleView=titleSegment
        
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
