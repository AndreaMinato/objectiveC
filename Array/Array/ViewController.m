//
//  ViewController.m
//  Array
//
//  Created by AndreaITS on 23/01/17.
//  Copyright © 2017 AndreaITS. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonPressed:(UIButton *)sender {
    NSLog(@"Button pressed: %@", sender.currentTitle);
}

@end
