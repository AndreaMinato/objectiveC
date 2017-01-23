//
//  ViewController.h
//  tapChallange
//
//  Created by AndreaITS on 13/01/17.
//  Copyright © 2017 AndreaITS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ScoreTableViewController.h"

@interface GameViewController : UIViewController <ScoreTableViewDelegate>

@property (nonatomic,weak) IBOutlet UILabel* tapsCountLabel;

@property (nonatomic,weak) IBOutlet UILabel* timeLabel;

- (IBAction)buttonPressed:(id)sender;


-(IBAction)tapGestureRecognizerDidRecognizeTap:(id)sender;

#define GameTimer 1
#define GameTime 5

#define FirstAppLaunch @"YEAH"
#define Results @"UserSCore"

#define Defaults [NSUserDefaults standardUserDefaults]

@end

