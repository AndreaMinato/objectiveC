//
//  ViewController.h
//  PariDispariQuiz
//
//  Created by AndreaITS on 23/01/17.
//  Copyright © 2017 AndreaITS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic, weak) IBOutlet UILabel *numberLabel;

-(IBAction)pariButtonPressed:(id)sender;
-(IBAction)dispariButtonPressed:(id)sender;
-(IBAction)generaButtonPressed:(id)sender;

@end

