//
//  ViewController.m
//  EsercizioNome
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

#pragma - mark Actions

-(IBAction)userNameTextFielDdidEndOnExit:(id)sender{
    NSLog(@"userNameTextFielddidEndOnExit");
}

-(IBAction)userNameTextFielEditingDidEnd:(UITextField *)sender{
    NSLog(@"Nome: %@",sender.text);
    
    [self.userNameLabel setText:[self.userNameTextField text]];
    
}



@end
