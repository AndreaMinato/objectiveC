//
//  Corriere.h
//  Stoccaggio
//
//  Created by AndreaITS on 08/02/17.
//  Copyright © 2017 AndreaITS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Corriere : NSObject <NSCoding>


-(id)initWithCodice:(NSString *)codice
           nome:(NSString *)nome
   andVolumeMassimo:(NSInteger)volumeMassimo;

@property (nonatomic, strong, readonly) NSString *codice;
@property (nonatomic, strong,readonly)NSString *nome;
@property (nonatomic, readonly)NSInteger volumeMassimo;
@end
