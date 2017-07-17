//
//  ViewController.h
//  MinatoAndrea
//
//  Created by AndreaITS on 02/03/17.
//  Copyright © 2017 AndreaITS. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "PushViewController.h"

@interface ViewController : UIViewController<ChangingColorDelegate>


@property (nonatomic,weak)IBOutlet UIButton *pushButton;
@property (weak, nonatomic) IBOutlet UIButton *modalButton;

@end

