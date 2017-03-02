//
//  ViewController.m
//  Anagrafiche
//
//  Created by AndreaITS on 16/02/17.
//  Copyright © 2017 AndreaITS. All rights reserved.
//

#import "ViewController.h"
//#import "Contact.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSLog(@"%@",_contact);
 
    
    self.formController.form = _contact;
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    //reload the table
    [self.tableView reloadData];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
