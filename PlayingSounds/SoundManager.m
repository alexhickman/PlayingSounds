//
//  SoundManager.m
//  PlayingSounds
//
//  Created by Hickman on 1/13/16.
//  Copyright © 2016 Hickman. All rights reserved.
//

#import "SoundManager.h"
#import "Constants.h"
#import <Parse/Parse.h>
#import "Sounds.h"

@implementation SoundManager

static SoundManager *sMyApi;

+ (SoundManager *)sharedManager
{
    static dispatch_once_t tokenToRunOnlyOnce;
    
    dispatch_once(&tokenToRunOnlyOnce, ^{
        sMyApi = [[SoundManager alloc]init];
    });
    return sMyApi;
}

- (NSMutableArray *)populateSoundsArray
{
    NSMutableArray *arrayOfSounds = [[NSMutableArray alloc]init];
    
    PFQuery *query = [PFQuery queryWithClassName:@"Sounds"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error)
        {
            NSLog(@"Successfully retrieved %lu sounds", (unsigned long)objects.count);
            for (PFObject *sound in objects)
            {
                NSString *fileName = sound[@"fileName"];
                PFFile *soundFile = sound[@"audioFile"];
               [soundFile getDataInBackgroundWithBlock:^(NSData * _Nullable data, NSError * _Nullable error) {
                    if (error)
                    {
                        NSLog(@"Error: %@ %@", error, [error userInfo]);
                    }
                   else
                   {
                       NSData *soundData = data;
                       Sounds *newSound = [Sounds makeSoundWith:fileName andSound:soundData];
                       [arrayOfSounds addObject:newSound];
                   }
                }];
                
                //                [sound[@"audioFile"] getDataInBackgroundWithBlock:^(NSData *audioData, NSError *error)
                //                {
                //                    if (!error)
                //                    {
                //                        [arrayOfSounds addObject:(Sounds *)[Sounds makeSoundWith:fileName andSound:audioData]];
                //                    }
                //                    else
                //                    {
                //                        NSLog(@"Error: %@ %@", error, [error userInfo]);
                //                    }
                //                }];
            }
        }
        else
        {
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
    
    return arrayOfSounds;
}

@end
