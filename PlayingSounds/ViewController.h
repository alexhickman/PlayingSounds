//
//  ViewController.h
//  PlayingSounds
//
//  Created by Hickman on 1/13/16.
//  Copyright © 2016 Hickman. All rights reserved.
//

#import <UIKit/UIKit.h>

@import AVFoundation;

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) AVAudioPlayer *player;


@end

