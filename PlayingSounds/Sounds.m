//
//  Sounds.m
//  PlayingSounds
//
//  Created by Hickman on 1/13/16.
//  Copyright © 2016 Hickman. All rights reserved.
//

#import "Sounds.h"

@implementation Sounds

- (instancetype)initWith:(NSString *)name and:(NSData *)sound
{
    self = [super init];
    if (self) {
        self.fileName = name;
        self.audioFile = sound;
    }
    return self;
}

+ (Sounds *)makeSoundWith:(NSString *)name andSound:(NSData *)sound
{
    Sounds *newSound = [[Sounds alloc]initWith:name and:sound];
    return newSound;
}



@end
