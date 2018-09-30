//
//  BlogVC.swift
//  MyInsight_Swift
//
//  Created by SongMengLong on 2018/9/30.
//  Copyright © 2018 SongMengLong. All rights reserved.
//

import UIKit
import MarkdownView


class BlogVC: UIViewController {
    
    let mdView: MarkdownView = MarkdownView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "博客"
        //
        self.view.backgroundColor = UIColor.white
        
        self.mdView.frame = self.view.bounds
        self.view.addSubview(self.mdView)
        self.mdView.translatesAutoresizingMaskIntoConstraints = false
        self.mdView.topAnchor.constraint(equalTo: topLayoutGuide.topAnchor).isActive = true
        self.mdView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        self.mdView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        self.mdView.bottomAnchor.constraint(equalTo: bottomLayoutGuide.topAnchor).isActive = true
        
        let path = Bundle.main.path(forResource: "浅谈 block（2） - 截获变量方式", ofType: "md")!
        
        let url = URL(fileURLWithPath: path)
        let markdown = try! String(contentsOf: url, encoding: String.Encoding.utf8)
        mdView.load(markdown: markdown, enableImage: true)
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
