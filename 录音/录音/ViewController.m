//
//  ViewController.m
//  录音
//
//  Created by max on 16/7/18.
//  Copyright © 2016年 max. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>
@interface ViewController ()
@property (strong,nonatomic) AVAudioRecorder *recorder;
@end

@implementation ViewController
-(AVAudioRecorder *)recorder
{
    if (!_recorder) {
        //1.存放录音文件地址
        //  沙盒路径
        NSString *path = [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES)lastObject];
        NSString *filePath = [path stringByAppendingPathComponent:@"321.caf"];
        NSURL *url = [NSURL URLWithString:filePath];
        
        //2.创建录音对象
        _recorder = [[AVAudioRecorder alloc] initWithURL:url settings:nil error:nil];;
        
        //3。准备录音
        [_recorder prepareToRecord];
    }
    return _recorder;
}

-(void)viewWillAppear:(BOOL)animated
{
    // 打印沙河路径
    [super viewWillAppear:animated];
    NSLog(@"%@", NSHomeDirectory());
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}
- (IBAction)start:(id)sender {
    //4.开始录音
    [self.recorder record];
}

- (IBAction)begin:(id)sender {
    [self.recorder stop];
}


@end
