//
//  ViewController.h
//  PariODispari
//
//  Created by AndreaITS on 23/01/17.
//  Copyright © 2017 AndreaITS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic, weak) IBOutlet UITextField *NumberTextField;
@property (nonatomic, weak) IBOutlet UILabel *NumberLabel;


-(IBAction)userNameTextFielDdidEndOnExit:(id)sender;

-(IBAction)userNameTextFielEditingDidEnd:(id)sender;

@end

