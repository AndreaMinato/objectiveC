//
//  ViewController.m
//  Stoccaggio
//
//  Created by AndreaITS on 08/02/17.
//  Copyright © 2017 AndreaITS. All rights reserved.
//

#import "ViewController.h"


#import "Pacco.h"
#import "Corriere.h"

@interface ViewController (){
    NSMutableArray *array;
};

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    Corriere *corriere =[[Corriere alloc]initWithCodice:@"Corriere" nome:@"GLS" andVolumeMassimo:[self getRandomNumberBetween:500 to:5000]];
    NSLog(@"%@\n\n\n",corriere);
    
    array = @[].mutableCopy;
    for(int i=0; i<100; i++){
        Pacco *pacco = [[Pacco alloc]initWithCodice:[NSString stringWithFormat: @"CODICE %i", i]
                                           mittente:[NSString stringWithFormat: @"Mittente %i", i]
                                       destinatario:[NSString stringWithFormat: @"Destinatario %i", i]
                                          lunghezza:[self getRandomNumberBetween:1 to:5]
                                            altezza:[self getRandomNumberBetween:1 to:5]
                                         profondita:[self getRandomNumberBetween:1 to:5]
                                       andMateriale:[self getRandomMaterial]];
        [array addObject:pacco];
    }
    
    //Pacco *pacco = [[Pacco alloc]initWithCodice:@"asdfghjkl1234567890" mittente:@"Mitto" destinatario:@"Prendo" lunghezza:12 altezza:34 profondita:56 andMateriale:MaterialeFerro];
    
    //pacco.codice = @"asdfghjkl1234567890";
    //NSLog(@"pacco: %@", pacco);
    //NSLog(@"%@",array);
    
    int volume=0;
    for (Pacco *pacco in array) {
        volume += pacco.volume;
    }
    NSLog(@"\n\n\nVolume totale: %i",volume);
    
    
    int numeroDiCorrieri = ceil((volume+1.0)/(corriere.volumeMassimo*1.0));
    
    NSLog(@"\n\nServono %i Corrieri per portare i pacchi",numeroDiCorrieri);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(int)getRandomNumberBetween:(int)from to:(int)to {
    return (int)from + arc4random() % (to-from+1);
}

-(Materiale)getRandomMaterial{
    int x = [self getRandomNumberBetween:0 to:2];
    
    switch (x) {
        case 0:
            return MaterialeFerro;
            break;
        case 1: return MaterialeCarta;
            break;
        default:
            return MaterialePlastica;
            break;
    }
}


@end
