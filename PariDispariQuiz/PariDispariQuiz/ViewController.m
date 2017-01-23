//
//  ViewController.m
//  PariDispariQuiz
//
//  Created by AndreaITS on 23/01/17.
//  Copyright © 2017 AndreaITS. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    int x;
}
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


-(IBAction)pariButtonPressed:(id)sender{
    
    [self checkAnswer:true];
    
}

-(IBAction)dispariButtonPressed:(id)sender{
    [self checkAnswer:false];
}

-(IBAction)generaButtonPressed:(id)sender{
    
    x = [self getRandomNumberBetween:1 to:100];
    
    [self.numberLabel setText:[NSString stringWithFormat:@"%i", x]];
    
}


-(int)getRandomNumberBetween:(int)from to:(int)to {
    return (int)from + arc4random() % (to-from+1);
}

-(void)checkAnswer:(bool)even{
    
    NSString *titolo=@"Titolo";
    NSString *messaggio=@"Messaggio";
    NSString *tasto=@"Ok";
    
    
    if ((x % 2 == 0)==even) {
        titolo = @"Complimenti";
        messaggio = @"Ti facevo più stupido";
        tasto = @"Grazie";
    }
    else{
        titolo = @"Cojon";
        messaggio = @"La tua stupidità mi sorprende";
        tasto = @"Fottiti";
    }
    
    
    UIAlertController *alertViewController = [UIAlertController alertControllerWithTitle:titolo message:messaggio
                                                                          preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:tasto style:UIAlertActionStyleDefault
                                                     handler:^(UIAlertAction * _Nonnull action) {
                                                         NSLog(@"OkAction Premuta");
                                                     }];
    
    //salvo i risultati
    
    
    
    [alertViewController addAction:okAction];
    [self presentViewController:alertViewController animated:true completion:nil];
    
}

@end
