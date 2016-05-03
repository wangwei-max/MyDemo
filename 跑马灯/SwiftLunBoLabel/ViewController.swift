//
//  ViewController.swift
//  SwiftLunBoLabel
//
//  Created by bsmac1 on 16/1/11.
//  Copyright © 2016年 bsmac1. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private var jxView:JXScrollLabelView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        jxView = JXScrollLabelView(frame: CGRectMake(20, 300, 300, 50))
        
        view.addSubview(jxView)
        
        
        //设置一个开始，暂停按钮
        let btn = UIButton(type: UIButtonType.Custom)
        btn.addTarget(self, action: "beginOrStop:", forControlEvents: UIControlEvents.TouchUpInside)
        btn.setTitle("开始滚动", forState: UIControlState.Normal)
        btn.setTitleColor(UIColor.redColor(), forState: UIControlState.Normal)
        btn.frame = CGRectMake(130, 400, 90, 30)
        view.addSubview(btn)
    }
    func beginOrStop(sender:UIButton) {
        sender.selected = !sender.selected
        if sender.selected {
            //
            sender.setTitle("停止滚动", forState: UIControlState.Normal)
            jxView.beginScrollWithTimeIntervalAndScrollDatas(2.5, scrollDatas: ["hahahaahahah","ailhfowehgw",";qwojfpwejpgjewpjgwe","[oweugpjewjgewijg","lllllllllll"])
        } else {
            //
            sender.setTitle("开始滚动", forState: UIControlState.Normal)
            jxView.stopScroll()
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

