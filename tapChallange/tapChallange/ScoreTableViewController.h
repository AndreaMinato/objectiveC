//
//  ScoreTableViewController.h
//  tapChallange
//
//  Created by AndreaITS on 18/01/17.
//  Copyright © 2017 AndreaITS. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol ScoreTableViewDelegate <NSObject>

/// Retrive results from the class who has my protocol
-(NSArray *)ScoreTableViewFetchResults;

/// Notify fetch is completed
-(void)scoreTableViewDidFetchResults;

@end


@interface ScoreTableViewController : UITableViewController

@property (nonatomic, strong) NSArray* resultArray;

@property (nonatomic, unsafe_unretained) id <ScoreTableViewDelegate> delegate;

@end
