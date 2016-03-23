//
//  NewsViewController.swift
//  Fish1
//
//  Created by Neqeal on 16/3/20.
//  Copyright © 2016年 Hello Fish. All rights reserved.
//

import UIKit

class NewsViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    var 消息 = ["我爱钓鱼","我也爱钓鱼","我跟你们一样","同上","me too！"]
    //表格的区块里有多少个单元格
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 消息.count
    }
    //表格相应位置的单元格，显示那些内容
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        
        cell.textLabel?.text = 消息[indexPath.row]
        
        return cell
    }
    
  
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view control
    }
    */

}
