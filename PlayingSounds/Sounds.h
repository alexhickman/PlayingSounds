//
//  Sounds.h
//  PlayingSounds
//
//  Created by Hickman on 1/13/16.
//  Copyright © 2016 Hickman. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Sounds : NSObject

@property (strong, nonatomic) NSData *audioFile;
@property (strong, nonatomic) NSString *fileName;

- (instancetype)initWith:(NSString *)name and:(NSData *)sound;
+ (Sounds *)makeSoundWith:(NSString *)name andSound:(NSData *)sound;

@end
