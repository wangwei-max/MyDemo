//
//  WWplayeSound.h
//  录音播放
//
//  Created by max on 16/7/19.
//  Copyright © 2016年 max. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WWplayeSound : NSObject
/**播放声音*/
+(void)playeSoundWithSoundName:(NSString *)soundName;

/**播放音乐*/
+(void)playeMusicWithMusicName:(NSString *)MusicdName;

/**占停音乐*/
+(void)pauseMusicWithMusicName:(NSString *)MusicdName;

/**停止音乐*/
+(void)stopMusicWithMusicName:(NSString *)MusicdName;
@end
