//
//  SDImageCache+Private.h
//  DayDayCook
//
//  Created by Christopher Wood on 3/18/16.
//  Copyright © 2016 GFeng. All rights reserved.
//

#import "SDImageCache.h"

@interface SDImageCache (PrivateMethods)

- (NSString *)defaultCachePathForKey:(NSString *)key;
- (NSString *)cachedFileNameForKey:(NSString *)key;

@end