//
//  ViewController.m
//  SingleViewApplication
//
//  Created by AndreaITS on 11/01/17.
//  Copyright © 2017 AndreaITS. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    int _tapCount;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //NSString *novantamila = @"Novanta Fottutissimi Mila";
    
    //int i = 90000;
    
    // NSLog(@"lllli %d %@\n%@ %i", 90000, @"NovantaMila", novantamila, i);
    NSLog(@"2 - viewDidLog");
    
    // Do any additional setup after loading the view, typically from a nib.
    
    [self updateText:@"Mandii" ToLabel:self.mandiLabel];
    
    [self.userNameTextField setText:@"Merda"];
    
    _tapCount = 0;
    
    
    
    NSArray *array = @[@"primaStringa", @"secondaStringa"];
    
    NSLog(@"%@",array); //stampa la description invocando il metodo statico description (possibile l'override)
    
    
    // NSMutableArray array dinamico
    
    NSMutableArray *mutableArray = @[].mutableCopy;
    [mutableArray addObject:@"Yoyoyo"];
    NSLog(@"%@",mutableArray);
    
    
}

-(void)updateText:(NSString *)newText ToLabel:(UILabel *)label{
    [label setText:newText];
}

-(void)viewDidAppear:(BOOL)animated{
    NSLog(@"4 - DidAppear");
}

-(void)viewWillAppear:(BOOL)animated{
    NSLog(@"3 - WillAppear");
    
}

-(void)awakeFromNib{
    [super awakeFromNib];
    NSLog(@"1 - Away");
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma - mark Actions

-(IBAction)userNameTextFielddidEndOnExit:(id)sender{
    NSLog(@"userNameTextFielddidEndOnExit");
}

-(IBAction)userNameTextFielEditingDidEnd:(UITextField *)sender{
    NSLog(@"userNameTextFielEditingDidEnd");
    
    NSLog(@"\nTesto: %@",sender.text);
}


-(IBAction)buttonPressed:(id)sender{
    _tapCount++;
    NSLog(@"ghe sboro te ga premuo %i volte", _tapCount);
    
    [self.mandiLabel setText:[NSString stringWithFormat:@"ghe sboro!\n te ga premuo\n %i volte", _tapCount]];
}


@end
