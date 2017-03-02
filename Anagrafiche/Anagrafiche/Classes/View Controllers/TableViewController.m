//
//  TableViewController.m
//  Anagrafiche
//
//  Created by AndreaITS on 16/02/17.
//  Copyright © 2017 AndreaITS. All rights reserved.
//

#import "TableViewController.h"
#import "Contact.h"
#import "ViewController.h"

@interface TableViewController ()

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    [self setTitle:@"Anagrafiche"];
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"+"
                                                             style:UIBarButtonItemStylePlain
                                                            target:self
                                                            action:@selector(yeah:)];
    
    /*UIBarButtonItem *add = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:<#(UIBarButtonSystemItem)#> target:self action:@selector(yeah:)];
     */
    
    NSMutableArray *buttons = @[].mutableCopy;
    [buttons addObject:item];
    
    // [self.navigationItem setLeftBarButtonItem:item animated:YES];
    
    [self setToolbarItems:buttons];
    
    
    NSMutableArray *array= @[].mutableCopy;
    for (int i=0; i<100; i++) {
        
        NSString *nome = [NSString stringWithFormat:@"Nome %i", i ];
        NSString *cognome = [NSString stringWithFormat:@"Cognome %i", i ];
        
        Contact *contact = [[Contact alloc]initWithName:nome andSurname:cognome];
        
        [array addObject:contact];
    }
    
    [self setContacts:array];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.contacts.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AnagraficheCell" forIndexPath:indexPath];
    Contact *contact = _contacts[indexPath.row];
    
    [cell.textLabel setText:[NSString stringWithFormat:@"%@", [contact showDetail]]];
    
    return cell;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.destinationViewController isKindOfClass:[ViewController class]]){
        ViewController *vc = [segue destinationViewController];
        NSIndexPath *i =[self.tableView indexPathForSelectedRow];
        [vc setContact:_contacts[i.row]];
    }
}

- (void)yeah:(id)sender {
    NSLog(@"hfgdytfyt");
}

/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 } else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
