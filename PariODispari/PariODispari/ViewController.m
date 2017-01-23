//
//  ViewController.m
//  PariODispari
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
    NSLog(@"Numero: %@",sender.text);
    
    int value = [[self.NumberTextField text] intValue];
    
    NSString *evenOrOdd;
    
    if (value % 2 == 0)
        evenOrOdd = @"Pari";
    else
        evenOrOdd = @"Dispari";
    
    [self.NumberLabel setText:[NSString stringWithFormat:@"Il numero %i è %@",value ,evenOrOdd]];
    
}

@end
