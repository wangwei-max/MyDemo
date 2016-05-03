//
//  JXScrollLabelView.swift
//  SwiftLunBoLabel
//
//  Created by bsmac1 on 16/1/11.
//  Copyright © 2016年 bsmac1. All rights reserved.
//

import UIKit

class JXScrollLabelView: UIView {

    private var showLabel : UILabel!//隐式解析可选类型
    private var showLabelArr : Array<NSString> = []
    private var showLabelsIndex : Int!
    private var scrollTimeInterval : Double!
    private var timer : NSTimer!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.clipsToBounds = true
        showLabel = UILabel()
        showLabelsIndex = 0
        showLabel.text = "init text"
        showLabel.textAlignment = NSTextAlignment.Center
        backgroundColor = UIColor.brownColor()
        self.addSubview(self.showLabel)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        showLabel.frame = CGRectMake(0, self.bounds.height, self.bounds.width, 20)
    }
    
    //******设置移动速度，移动内容的接口
    func beginScrollWithTimeIntervalAndScrollDatas(timeInterval:NSTimeInterval,scrollDatas:[String]) {
        //设置滚动的数据
        showLabelArr = scrollDatas
        scrollTimeInterval = timeInterval as Double
        self.showLabel.text = self.showLabelArr[0] as String

        //设置计时器开始滚动
        timer = NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: "refreshScrollLabel", userInfo: nil, repeats: true)
    }

    func stopScroll(){
        timer.invalidate()
        timer = nil
        showLabel.text = ""
        showLabelArr = []
        showLabelsIndex = 0
    }
    
    
    func refreshScrollLabel(){
        //时间减0.1  是为了repeat时候不错乱
        UIView.animateWithDuration(scrollTimeInterval - 0.1, animations: { () -> Void in
            //动画改变frame
            var originY = self.showLabel.frame
            originY.origin.y = -20
            self.showLabel.frame = originY
            }) { (finished:Bool) -> Void in
                //动画执行完之后调用
                var originY = self.showLabel.frame
                originY.origin.y = self.bounds.height
                self.showLabel.frame = originY
                //如果还有下一个  就设置下一个 如果没有就重新开始
                if self.showLabelArr.count - 1 > self.showLabelsIndex{
                    self.showLabelsIndex = self.showLabelsIndex + 1
                } else {
                    self.showLabelsIndex = 0
                }
                if self.showLabelArr.count != 0 {
                    self.showLabel.text = self.showLabelArr[self.showLabelsIndex] as String
                }
                
        }
    }
}
