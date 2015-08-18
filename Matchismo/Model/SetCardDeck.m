//
//  SetCardDeck.m
//  Matchismo
//
//  Created by LinWiilen on 15/8/11.
//  Copyright (c) 2015年 WiilenLin. All rights reserved.
//

#import "SetCardDeck.h"
#import "SetCard.h"

@implementation SetCardDeck

- (instancetype) init {
    self = [super init];
    
    if (self) {
        for (NSUInteger color = 1; color <= [SetCard colorsCount] ; color ++) {
            for (NSUInteger symbol = 1; symbol <= [SetCard symbolsCount] ; symbol ++) {
                for (NSUInteger shading = 1; shading <= [SetCard shadingsCount] ; shading ++) {
                    for (NSUInteger number = 1; number <= [SetCard maxNumber] ; number ++) {
                        
                        SetCard *setCard = [[SetCard alloc] init];
                        setCard.color = color;
                        setCard.shading = shading;
                        setCard.symbol = symbol;
                        setCard.number = number;

                        [self addCard:setCard];
                    }
                }
            }
        }
    }
    
    return self;
}

@end
