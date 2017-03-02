//
//  ViewController.m
//  tapChallange
//
//  Created by AndreaITS on 13/01/17.
//  Copyright © 2017 AndreaITS. All rights reserved.
//

#import "GameViewController.h"

#import "ScoreTableViewController.h"
#import "Score.h"



@interface GameViewController (){
    int _tapCount;
    int _timeCount;
    NSTimer *_gameTimer;
    
    UILabel *_label;
    
}

@end

@implementation GameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    [self initGame];
    
    self.title = @"Tap Sfida";
    
    //creo un pulsante che andrò a mettere dentro la navigation bar
    
    UIBarButtonItem *scoreButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemBookmarks target:self action:@selector(scoreButtonPressed)];
    
    
    //imposto il pulsante con l'elemento alla dx della navBar
    self.navigationItem.rightBarButtonItem = scoreButtonItem;
    
    /* _label = [[UILabel alloc] initWithFrame:CGRectMake(10, 200, 250, 40)];
     [_label setText:@"Mi piacciono i treni"];
     [_label setBackgroundColor:[UIColor blueColor]];
     [_label setTextColor:[UIColor whiteColor]];
     [_label setFont:[UIFont systemFontOfSize:18]];
     
     [self.view addSubview:_label];*/
}

- (void)viewDidAppear:(BOOL)animated
{
    [self resumeGame];
    
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
    
    [UIView animateWithDuration:5 animations:^{
        [_label setCenter:CGPointMake(300, 500)];
        [_label setAlpha:0];
    }];
}

-(void)viewWillDisappear:(BOOL)animated{
    [self pauseGame];
}

#pragma - mark created

-(void)pauseGame{
    if(_gameTimer != nil){
        [_gameTimer invalidate];
        _gameTimer = nil;
    }
}

-(void)resumeGame{
    
    if(_timeCount != 0 && _tapCount>0){
        if(_gameTimer == nil){
            _gameTimer = [NSTimer scheduledTimerWithTimeInterval:GameTimer target:self selector:@selector(timerTick) userInfo:nil repeats:true];
            
        }
    }
    
}

-(void)initGame{
    _tapCount=0;
    _timeCount=GameTime;
    
    [self.tapsCountLabel setText:@"Tap to play"];
    [self.timeLabel setText: @"Sfidami"];
    
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
    
}


-(IBAction)tapGestureRecognizerDidRecognizeTap:(id)sender{
    NSLog(@"premuti");
    if (_gameTimer==nil) {
        _gameTimer = [NSTimer scheduledTimerWithTimeInterval:GameTimer target:self selector:@selector(timerTick) userInfo:nil repeats:true];
    }
    
    
    _tapCount++;
    
    [self.tapsCountLabel setText:[NSString stringWithFormat:@"%i", _tapCount]];
    
}

-(void) scoreButtonPressed{
    
    //NSArray *resultArray = [self getResults];
    
    ScoreTableViewController *tableViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"ScoreTableViewController"];
    
    //[tableViewController setResultArray:resultArray];
    
    [self.navigationController pushViewController:tableViewController animated:true];
    
    tableViewController.delegate = self;
    
}


#pragma - mark UI

-(void)showLastResult:(NSArray *)result{
    
    if (result.count>0) {
        
        NSDictionary *dictionary = result.firstObject;
        NSNumber *value = [dictionary objectForKey:@"Score"];
        NSString *mex = [NSString stringWithFormat:@"Quelli di prima sono riusciti a rompere il cazzo ben %i volte", value.intValue];
        
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

-(NSArray *)getResults{
    
    NSArray *array =  [Defaults objectForKey:Results];
    
    if(array == nil)
        array=@[];
    
    return array;
    
}

- (void)saveResult{
    NSMutableArray *resultsArray = [[Defaults objectForKey:Results] mutableCopy];
    
    if(resultsArray == nil){
        resultsArray = @[].mutableCopy;
    }
    
    Score *score = [[Score alloc]initWithTapsNumber:_tapCount andDate:[NSDate date]];
    
    NSDictionary *dictionary = @{@"Score": @(score.tapsNumber) , @"Data":score.date};
    
    [resultsArray addObject:dictionary];
    
    NSArray* arrayToSave = [resultsArray sortedArrayUsingComparator:^NSComparisonResult(NSDictionary * obj1, NSDictionary  * obj2) {
        int value1=[[obj1 objectForKey:@"Score"] intValue];
        int value2=[[obj2 objectForKey:@"Score"] intValue];
        
        if(value1==value2)
            return NSOrderedSame;
        if(value1>value2)
            return NSOrderedAscending;
        return NSOrderedDescending;
    }];
    
    NSLog(@"ARRAY-> %@", arrayToSave);
    
    [Defaults setObject:arrayToSave forKey:Results];
    [Defaults synchronize];
    
    
    
    /*[[NSUserDefaults standardUserDefaults] setInteger:_tapCount forKey:Results];
     
     [[NSUserDefaults standardUserDefaults] synchronize];*/
}

-(bool)firstAppLaunch{
    return [Defaults boolForKey:FirstAppLaunch];
    
}

#pragma mark - ScoreTableViewDelegate

-(NSArray *)ScoreTableViewFetchResults{
    return [self getResults];
}

-(void)scoreTableViewDidFetchResults{
    NSLog(@"TOH");
}

@end
