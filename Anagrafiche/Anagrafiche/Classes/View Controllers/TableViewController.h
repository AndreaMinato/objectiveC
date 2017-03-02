//
//  TableViewController.h
//  Anagrafiche
//
//  Created by AndreaITS on 16/02/17.
//  Copyright © 2017 AndreaITS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewController : UITableViewController

/// Retrive results from the class who has my protocol
@property (nonatomic, strong) NSArray* contacts;

/// Notify fetch is completed
//-(void)tableViewDidFetchResults;

@end
