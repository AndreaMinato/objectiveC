//
//  ViewController.h
//  SingleViewApplication
//
//  Created by AndreaITS on 11/01/17.
//  Copyright © 2017 AndreaITS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic, weak) IBOutlet  UILabel *mandiLabel;

@property (nonatomic, weak) IBOutlet UITextField *userNameTextField;

-(IBAction)userNameTextFielddidEndOnExit:(id)sender;

-(IBAction)userNameTextFielEditingDidEnd:(id)sender;

-(IBAction)buttonPressed:(id)sender;

@end

