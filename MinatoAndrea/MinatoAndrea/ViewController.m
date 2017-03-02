//
//  ViewController.m
//  MinatoAndrea
//
//  Created by AndreaITS on 02/03/17.
//  Copyright © 2017 AndreaITS. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //The event handling method
   
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - delegate
-(void)changeColor:color{
    self.pushButton.backgroundColor = color;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.destinationViewController isKindOfClass:[PushViewController class]]){
        PushViewController *vc = [segue destinationViewController];
        [vc setDelegate:self];
    }
}

@end
