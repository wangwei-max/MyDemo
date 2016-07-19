//
//  WWplayeSound.m
//  录音播放
//
//  Created by max on 16/7/19.
//  Copyright © 2016年 max. All rights reserved.
//

#import "WWplayeSound.h"
#import <AVFoundation/AVFoundation.h>

@implementation WWplayeSound

static NSMutableDictionary *_soundIDs;

static NSMutableDictionary *_players;

+(void)initialize
{
    _soundIDs =[NSMutableDictionary dictionary];
    _players =[NSMutableDictionary dictionary];

}

+(void)playeSoundWithSoundName:(NSString *)soundName
{
    
    
    //1.定义SystemSoundID
    SystemSoundID soundID = 0;
    //2.从字典中取出对应的soundID,如果取出的事nil，表示之前没有存放在字典
    soundID = [_soundIDs[soundName] unsignedIntegerValue];
    if (soundID ==0) {
        CFURLRef url = (__bridge CFURLRef)([[NSBundle mainBundle] URLForResource:soundName withExtension:nil]);AudioServicesCreateSystemSoundID(url, &soundID);
        //将soundid存入字典中
        [_soundIDs setObject:@(soundID) forKey:soundName];
    }
    AudioServicesPlayAlertSound(soundID);
}

//播放音乐
+(void)playeMusicWithMusicName:(NSString *)MusicdName
{
    if (!MusicdName ) {
        NSLog(@"不能为空");
        return;
    }
    
    //1.定义播放器
    AVAudioPlayer *player = nil;
    
    // 2.从字典中取player，如果取出来事空，则对应创建对用的播放器
    player = _players[MusicdName];
    if (!player) {
        //2.1 获取对应的音乐资源
        NSURL *url = [[NSBundle mainBundle] URLForResource:MusicdName withExtension:nil ];
        //2.2 创建对应的播放器
        player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
        //2.3 将player存入字典中
        [_players setObject:player forKey:MusicdName];
        
        //2.4 准备播放
        [player prepareToPlay];
    }
        //3.播放音乐
        [player play];
}

/**占停音乐*/
+(void)pauseMusicWithMusicName:(NSString *)MusicdName
{
    //1.取出对应的播放器
    AVAudioPlayer *player = _players[MusicdName];
    //2. 判断player是否事nil
    if (player) {
        [player pause];
    }
}

/**停止音乐*/
+(void)stopMusicWithMusicName:(NSString *)MusicdName
{
    //1.取出对应的播放器
    AVAudioPlayer *player = _players[MusicdName];
    //2. 判断player是否事nil
    if (player) {
        [player stop];
        [_players removeObjectForKey:MusicdName];
        player = nil;
    }
}
@end
