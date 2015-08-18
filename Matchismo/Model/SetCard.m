//
//  SetCard.m
//  Matchismo
//
//  Created by LinWiilen on 15/8/9.
//  Copyright (c) 2015年 WiilenLin. All rights reserved.
//

#import "SetCard.h"

@implementation SetCard

-(void)setColor:(NSUInteger)color {
    if(color <= [SetCard colorsCount]) color = _color;
}

-(void)setSymbol:(NSUInteger)symbol {
    if(symbol <= [SetCard symbolsCount]) symbol = _symbol;
}

-(void)setShading:(NSUInteger)shading {
    if (shading <= [SetCard shadingsCount]) shading = _shading;
}

-(void)setNumber:(NSUInteger)number {
    if (number <= [SetCard maxNumber]) {
        number = _number;
    }
}

+(NSUInteger)colorsCount {
    return 3;
}

+(NSUInteger)symbolsCount{
    return 3;
}

+(NSUInteger)shadingsCount{
    return 3;
};

+(NSUInteger)maxNumber {
    return 3;
}

-(NSUInteger)numberOfMatchedCardsForSet {
    if (!_numberOfMatchedCardsForSet) {
        _numberOfMatchedCardsForSet = 3;
    }
    return _numberOfMatchedCardsForSet;
}

-(int)matched:(NSArray *)otherCards
{
    int score = 0;
    
    if ([otherCards count] == self.numberOfMatchedCardsForSet - 1) {
        NSMutableArray *colors = [[NSMutableArray alloc] initWithObjects:@(self.color), nil];
        NSMutableArray *shadings = [[NSMutableArray alloc] initWithObjects:@(self.shading), nil];
        NSMutableArray *symbols = [[NSMutableArray alloc] initWithObjects:@(self.symbol), nil];
        NSMutableArray *numbers = [[NSMutableArray alloc] initWithObjects:@(self.number), nil];
        
        for (SetCard *othercard in otherCards) {
            if ([othercard isKindOfClass:[SetCard class]]) {
                if (![colors containsObject:@(othercard.color)]) [colors addObject:@(othercard.color)];
                if (![shadings containsObject:@(othercard.shading)]) [colors addObject:@(othercard.shading)];
                if (![symbols containsObject:@(othercard.symbol)]) [colors addObject:@(othercard.symbol)];
                if (![numbers containsObject:@(othercard.number)]) [colors addObject:@(othercard.number)];
            }
        }
        
        if (([colors count] == 3 || [colors count] == 1)
            &&([shadings count] == 3 || [shadings count] == 1)
            &&([symbols count] == 3 || [symbols count] == 1)
            &&([numbers count] == 3 || [numbers count] == 1)) {
            score = 4;
        }
    }
    
    return score;
}







@end
