//
//  Pacco.h
//  Stoccaggio
//
//  Created by AndreaITS on 08/02/17.
//  Copyright © 2017 AndreaITS. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, Materiale){
    MaterialeFerro = 0,
    MaterialePlastica = 1,
    MaterialeCarta = 2
};

@interface Pacco : NSObject

///costruttore
-(id)initWithCodice:(NSString *)codice
           mittente:(NSString *)mittente
       destinatario:(NSString *)destinatario
          lunghezza:(NSInteger)lunghezza
            altezza:(NSInteger)altezza
         profondita:(NSInteger)profondita
       andMateriale:(Materiale)materiale;

///codice identificativo del pacco
@property (nonatomic, strong, readonly) NSString *codice;

///il mittende che spedisce il pacco
@property (nonatomic, strong, readonly) NSString *mittente;

///il destinatario che riceve il pacco
@property (nonatomic, strong) NSString *destinatario;

///dimensioni del pacco
@property (nonatomic, readonly)NSInteger lunghezza;
@property (nonatomic, readonly)NSInteger profondita;
@property (nonatomic, readonly)NSInteger altezza;
@property (nonatomic, readonly)NSInteger volume;
@property (nonatomic, readonly)NSInteger peso;

///materiali possibili
@property (nonatomic)Materiale materiale;

@end
