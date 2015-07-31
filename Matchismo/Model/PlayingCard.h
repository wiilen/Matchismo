//
//  PlayingCard.h
//  Matchismo
//
//  Created by LinWiilen on 15/7/18.
//  Copyright (c) 2015年 WiilenLin. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

@property (strong,nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;

+ (NSArray *)validSuits;
+ (NSUInteger)maxRank;

@end
