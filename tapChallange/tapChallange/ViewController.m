//
//  ViewController.m
//  tapChallange
//
//  Created by AndreaITS on 13/01/17.
//  Copyright © 2017 AndreaITS. All rights reserved.
//

#import "ViewController.h"



@interface ViewController (){
    int _tapCount;
    int _timeCount;
    NSTimer *_gameTimer;
    
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    [self initGame];
    
}

- (void)viewDidAppear:(BOOL)animated
{
    
    if([self firstAppLaunch] == false){
        [[NSUserDefaults standardUserDefaults]setBool:true forKey:FirstAppLaunch];
        [[NSUserDefaults standardUserDefaults]synchronize];
    }
    else
        [self showLastResult:[self getResults]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma - mark created

-(void)initGame{
    _tapCount=0;
    _timeCount=GameTime;
    
    [self.tapsCountLabel setText:@"Tap to play"];
    [self.timeLabel setText:@"TAP CHALLENGE"];
    
}

-(void)timerTick{
    //NSLog(@"%s",__PRETTY_FUNCTION__);
    
    _timeCount--;
    
    if(_timeCount == 0){
        //invalidare il timer, non distrugger il puntatore senno sei bestia!
        [_gameTimer invalidate];
        _gameTimer = nil;
        
        
        NSString *message = [NSString stringWithFormat:@"Hai rotto il cazzo ben %i volte", _tapCount];
        //[self initGame];
        
        UIAlertController *alertViewController = [UIAlertController alertControllerWithTitle:@"Smettila Puttana!" message:message
                                                                              preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"Scusa allora" style:UIAlertActionStyleDefault
                                                         handler:^(UIAlertAction * _Nonnull action) {
                                                             [self saveResult];
                                                             
                                                             [self initGame];
                                                             //NSLog(@"OkAction Premuta");
                                                         }];
        
        //salvo i risultati
        
        
        
        [alertViewController addAction:okAction];
        [self presentViewController:alertViewController animated:true completion:nil];
        
    }
    
    
    [self.timeLabel setText:[NSString stringWithFormat:@"%i sec",_timeCount]];
    
}

#pragma - mark Actions

- (IBAction)buttonPressed:(id)sender{
    
    //creo timer solo se serve
    if (_gameTimer==nil) {
        _gameTimer = [NSTimer scheduledTimerWithTimeInterval:GameTimer target:self selector:@selector(timerTick) userInfo:nil repeats:true];
    }
    
    
    _tapCount++;
    
    [self.tapsCountLabel setText:[NSString stringWithFormat:@"%i", _tapCount]];
    
}

#pragma - mark UI

-(void)showLastResult:(int)result{
    
    if (result>0) {
        
        NSString *mex = [NSString stringWithFormat:@"Quello di prima ha rotto il cazzo ben %i volte", result];
        
        UIAlertController *resultAlertViewController = [UIAlertController alertControllerWithTitle:@"Non vorrai giocare anche tu vero?!" message:mex
                                                                                    preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"Casso che bravo, mo lo batto" style:UIAlertActionStyleDefault
                                                         handler:^(UIAlertAction * _Nonnull action) {
                                                             NSLog(@"click");}];
        
        [resultAlertViewController addAction:okAction];
        [self presentViewController:resultAlertViewController animated:true completion:nil];
    }
    
}

#pragma - mark Persistenza

-(int)getResults{
    return [[NSUserDefaults standardUserDefaults]integerForKey:@"TapsCount"];
    
}

- (void)saveResult{
    [[NSUserDefaults standardUserDefaults] setInteger:_tapCount forKey:@"TapsCount"];
    
    [[NSUserDefaults standardUserDefaults] synchronize];
}

-(bool)firstAppLaunch{
    return [[NSUserDefaults standardUserDefaults]boolForKey:@"firstAppLaunch"];
    
}


@end
