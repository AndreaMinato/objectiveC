//
//  Contact.h
//  Anagrafiche
//
//  Created by AndreaITS on 16/02/17.
//  Copyright © 2017 AndreaITS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <FXForms.h>

@interface Contact : NSObject <FXForm>

@property (nonatomic, strong)NSString *name;
@property (nonatomic,strong)NSString * surname;


-(id)initWithName:(NSString *)name andSurname:(NSString *)surname;
-(NSString *)showDetail;
@end
