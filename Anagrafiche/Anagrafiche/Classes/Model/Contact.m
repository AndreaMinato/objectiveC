//
//  Contact.m
//  Anagrafiche
//
//  Created by AndreaITS on 16/02/17.
//  Copyright © 2017 AndreaITS. All rights reserved.
//

#import "Contact.h"

@implementation Contact

-(id)initWithName:(NSString *)name andSurname:(NSString *)surname{
    
    self = [super init];
    
    if (self) {
        //do something
        _name = name;
        _surname = surname;
        
    }
    
    return self;
    
};


-(NSString *)showDetail{
    NSString *newDescription = [NSString stringWithFormat:@"%@ %@",
                                self.name,
                                self.surname];
    
    return newDescription;
}

#pragma mark - overrides

-(NSString *)description{
    NSString *newDescription = [NSString stringWithFormat:@"%@\nNome: %@\nCognome: %@", [super description],
                                self.name,
                                self.surname];
    
    return newDescription;
}


@end
