//
//  SoundManager.h
//  PlayingSounds
//
//  Created by Hickman on 1/13/16.
//  Copyright © 2016 Hickman. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SoundManager : NSObject

+ (SoundManager *)sharedManager;
- (NSMutableArray *)populateSoundsArray;

@end
