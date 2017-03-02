//
//  Pacco.m
//  Stoccaggio
//
//  Created by AndreaITS on 08/02/17.
//  Copyright © 2017 AndreaITS. All rights reserved.
//

#import "Pacco.h"
#import "Utils.h"

@implementation Pacco

-(id)initWithCodice:(NSString *)codice
           mittente:(NSString *)mittente
       destinatario:(NSString *)destinatario
          lunghezza:(NSInteger)lunghezza
            altezza:(NSInteger)altezza
         profondita:(NSInteger)profondita
       andMateriale:(Materiale)materiale{
    self = [super init];
    
    if (self) {
        //do something
        _codice = codice;
        _mittente = mittente;
        _destinatario = destinatario;
        _lunghezza = lunghezza;
        _altezza = altezza;
        _profondita = profondita;
        _materiale = materiale;
        
    }
    
    return self;
    
};

#pragma mark - getters

-(NSInteger)volume{
    return self.altezza*self.lunghezza*self.profondita;
}

-(NSInteger)peso{
    switch (self.materiale) {
        case MaterialeFerro:
            return self.volume*kPesoSpecificoFerro;
            break;
        case MaterialePlastica:
            return self.volume*kPesoSpecificoPlastica;
            break;
        case MaterialeCarta:
            return self.volume*kPesoSpecificoCarta;
            break;
        default:
            return 0;
            break;
    }
}

#pragma mark - overrides

-(NSString *)description{
    NSString *newDescription = [NSString stringWithFormat:@"%@\nCodice: %@\nMittente: %@\nDestinatario: %@\nLunghezza: %i\nAltezza: %i\nProfondita: %i\nMateriale: %li\nVolume: %icm3\nPeso: %iKg", [super description],
                                self.codice,
                                self.mittente,
                                self.destinatario,
                                self.lunghezza,
                                self.altezza,
                                self.profondita,
                                (long)self.materiale,
                                self.volume,
                                self.peso/1000];
    
    return newDescription;
}

@end
