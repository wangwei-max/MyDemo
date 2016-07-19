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

+(void)initialize
{
    _soundIDs =[NSMutableDictionary dictionary];
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

@end
