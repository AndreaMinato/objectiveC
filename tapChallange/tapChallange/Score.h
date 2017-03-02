//
//  Score.h
//  tapChallange
//
//  Created by AndreaITS on 10/02/17.
//  Copyright © 2017 AndreaITS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Score : NSObject


@property (nonatomic, readonly)NSInteger tapsNumber;
@property (nonatomic,strong,readonly)NSDate * date;

-(id)initWithTapsNumber:(NSInteger)tapsNumber andDate:(NSDate *)date;

@end
