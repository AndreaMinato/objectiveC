//
//  PushViewController.m
//  MinatoAndrea
//
//  Created by AndreaITS on 02/03/17.
//  Copyright © 2017 AndreaITS. All rights reserved.
//

#import "PushViewController.h"

@interface PushViewController ()

@end

@implementation PushViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)GreenButtonPressed:(UIButton *)sender {
    
    [self.delegate changeColor:self.greenButton.backgroundColor];
    
    [[self navigationController] popViewControllerAnimated:YES];
}

- (IBAction)RedButtonPressed:(UIButton *)sender {
    [self.delegate changeColor:self.redButton.backgroundColor];
    [[self navigationController] popViewControllerAnimated:YES];
}

- (IBAction)BlueButtonPressed:(UIButton *)sender {
    [self.delegate changeColor:self.blueButton.backgroundColor];
   [[self navigationController] popViewControllerAnimated:YES];
}


#pragma mark - Navigation




@end
