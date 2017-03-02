//
//  PushViewController.h
//  MinatoAndrea
//
//  Created by AndreaITS on 02/03/17.
//  Copyright © 2017 AndreaITS. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ChangingColorDelegate <NSObject>
@required
- (void) changeColor:(UIColor *)color;
@end

@interface PushViewController : UIViewController

@property (nonatomic,strong) id<ChangingColorDelegate> delegate;
@property (weak, nonatomic) IBOutlet UIButton *greenButton;
@property (weak, nonatomic) IBOutlet UIButton *redButton;
@property (weak, nonatomic) IBOutlet UIButton *blueButton;

@end
