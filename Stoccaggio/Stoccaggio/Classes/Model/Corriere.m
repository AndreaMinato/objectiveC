//
//  Corriere.m
//  Stoccaggio
//
//  Created by AndreaITS on 08/02/17.
//  Copyright © 2017 AndreaITS. All rights reserved.
//

#import "Corriere.h"

@implementation Corriere

-(id)initWithCodice:(NSString *)codice
               nome:(NSString *)nome
   andVolumeMassimo:(NSInteger)volumeMassimo{
    self = [super init];
    
    if (self) {
        //do something
        _codice = codice;
        _nome = nome;
        _volumeMassimo = volumeMassimo;
        
    }
    
    return self;
    
};

#pragma mark - overrides

-(NSString *)description{
    NSString *newDescription = [NSString stringWithFormat:@"%@\nCodice: %@\nNome: %@\nVolume Massimo: %icm3", [super description],
                                self.codice,
                                self.nome,
                                self.volumeMassimo];
    
    return newDescription;
}

-(void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.codice forKey:@"CODICE"];
    [aCoder encodeObject:self.nome forKey:@"NOME"];
    [aCoder encodeInteger:self.volumeMassimo forKey:@"VOLUME"];
}

-(instancetype)initWithCoder:(NSCoder *)aDecode{
    
    self = [super init];
    
    if (self) {
        //do something
        _codice = [aDecode decodeObjectForKey:@"CODICE"];
        _nome = [aDecode decodeObjectForKey:@"NOME"];
        _volumeMassimo = [aDecode decodeIntegerForKey:@"VOLUME"];
        
    }
    
    return self;
}
@end
