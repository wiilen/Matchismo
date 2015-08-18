//
//  SetCard.h
//  Matchismo
//
//  Created by LinWiilen on 15/8/9.
//  Copyright (c) 2015年 WiilenLin. All rights reserved.
//

#import "Card.h"

@interface SetCard : Card

@property (nonatomic) NSUInteger color;
@property (nonatomic) NSUInteger shading;
@property (nonatomic) NSUInteger symbol;
@property (nonatomic) NSUInteger number;

@property (nonatomic) NSUInteger numberOfMatchedCardsForSet;

+(NSUInteger)colorsCount;
+(NSUInteger)symbolsCount;
+(NSUInteger)shadingsCount;
+(NSUInteger)maxNumber;

@end
