//
//  TabBarVC.swift
//  MyInsight_Swift
//
//  Created by SongMengLong on 2018/7/22.
//  Copyright © 2018年 SongMengLong. All rights reserved.
//

import UIKit

class TabBarVC: UITabBarController {

    // 底部导航栏
    override func viewDidLoad() {
        super.viewDidLoad()
        // 设置背景颜色
        self.view.backgroundColor = UIColor.white
        
        // 基础
        let basicVC: BasicVC = BasicVC()
        let basicNavi: UINavigationController = UINavigationController(rootViewController: basicVC)
        
        // 进阶
        let advanceVC: AdvanceVC = AdvanceVC()
        let advanceNavi: UINavigationController = UINavigationController(rootViewController: advanceVC)
        
        // 高级
        let seniorVC: SeniorVC = SeniorVC()
        let seniorNavi: UINavigationController = UINavigationController(rootViewController: seniorVC)
        
        // 其他
        let otherVC: OtherVC = OtherVC()
        let otherNavi: UINavigationController = UINavigationController(rootViewController: otherVC)
        
        // 设置
        
        self.setViewControllers([basicNavi, advanceNavi, seniorNavi, otherNavi], animated: true);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
