//
//  ViewController.m
//  播放音乐
//
//  Created by max on 16/7/19.
//  Copyright © 2016年 max. All rights reserved.
//

#import "ViewController.h"
#import "WWplayeSound.h"
#import <AVFoundation/AVFoundation.h>

@interface ViewController ()
@property (nonatomic,strong) AVAudioPlayer *player;

@end

@implementation ViewController
-(AVAudioPlayer *)player
{
    if (!_player) {
        NSURL *url = [[NSBundle mainBundle] URLForResource:@"339744.mp3" withExtension:nil ];
        _player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
        [_player prepareToPlay];
    }
    return _player;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)play:(id)sender {
    [WWplayeSound playeMusicWithMusicName:@"339744.mp3"];
}

- (IBAction)pass {
    [WWplayeSound pauseMusicWithMusicName:@"339744.mp3"];
    
}

- (IBAction)stop:(id)sender {
  [WWplayeSound stopMusicWithMusicName:@"339744.mp3"];
}
- (IBAction)other:(id)sender {
    [WWplayeSound playeMusicWithMusicName:@"14945107.mp3"];
}

@end
