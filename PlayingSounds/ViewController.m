//
//  ViewController.m
//  PlayingSounds
//
//  Created by Hickman on 1/13/16.
//  Copyright © 2016 Hickman. All rights reserved.
//

#import "ViewController.h"
#import "SoundManager.h"
#import <Parse/Parse.h>
#import "Sounds.h"

@interface ViewController ()
{
    NSMutableArray *arrayOfSounds;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
 
    SoundManager *sApiInstance = [SoundManager sharedManager];
    
    
    if ([arrayOfSounds count] != 0)
    {
        NSLog(@"test");
    }
    
    // arrayOfSounds is empty
    else
    {
        arrayOfSounds = [sApiInstance populateSoundsArray];
        [self.tableView reloadData];
    }
    [self.tableView performSelector:@selector(reloadData)  withObject:nil afterDelay:5];
}


- (IBAction)button:(id)sender
{
    [self.tableView reloadData];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(!cell)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    
    cell.textLabel.text = ((Sounds *)arrayOfSounds[indexPath.row]).fileName;
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [arrayOfSounds count];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    AVAudioPlayer *newPlayer = [[AVAudioPlayer alloc] initWithData:((Sounds *)arrayOfSounds[indexPath.row]).audioFile error:nil];
    self.player = newPlayer;
    [self.player play];
}

@end
