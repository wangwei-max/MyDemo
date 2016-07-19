//
//  ViewController.m
//  录音播放
//
//  Created by max on 16/7/19.
//  Copyright © 2016年 max. All rights reserved.
//

#import "ViewController.h"
#import "WWplayeSound.h"
#import <AVFoundation/AVFoundation.h>
@interface ViewController ()
@property (nonatomic,assign) SystemSoundID soundID;

@property (nonatomic,strong)NSMutableDictionary *soundIDs;
@end

@implementation ViewController

-(SystemSoundID )soundID
{
    if (_soundID == 0) {
//        //1.创建SystemSoundID,根据音效文件来生成
//        SystemSoundID soundID = 0;
        
        //2.根据音效文件，来生成SystemSoundID
        // 从沙盒去声音
        NSURL *url = [[NSBundle mainBundle] URLForResource:@"win.aac" withExtension:nil];
        AudioServicesCreateSystemSoundID((__bridge CFURLRef _Nonnull)(url), &_soundID);
    }
    
    return _soundID;
}

-(NSMutableDictionary *)soundIDs
{
    if (!_soundIDs) {
        _soundIDs = [NSMutableDictionary dictionary];
    }
    return _soundIDs;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
   
    //播放音效
    AudioServicesPlayAlertSound(self.soundID);
}
- (IBAction)pass:(id)sender {
    [WWplayeSound playeSoundWithSoundName:@"buyao.wav"];
}
- (IBAction)boos:(id)sender {
    [WWplayeSound playeSoundWithSoundName:@"m_16.wav"];
}
- (IBAction)small:(id)sender {
    [WWplayeSound playeSoundWithSoundName:@"m_17.wav"];
}

@end
