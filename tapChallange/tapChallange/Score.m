//
//  Score.m
//  tapChallange
//
//  Created by AndreaITS on 10/02/17.
//  Copyright © 2017 AndreaITS. All rights reserved.
//

#import "Score.h"

@implementation Score

-(id)initWithTapsNumber:(NSInteger)tapsNumber andDate:(NSDate *)date{
    self = [super init];
    
    if (self) {
        //do something
        _tapsNumber = tapsNumber;
        _date = date;
        
    }
    
    return self;
    
};

#pragma mark - overrides

-(NSString *)description{
    NSString *newDescription = [NSString stringWithFormat:@"%@\nData: %@\nTaps: %ic", [super description],
                                self.date,
                                self.tapsNumber];
    
    return newDescription;
}




@end
