//
//  CardMacthingGame.h
//  Matchismo
//
//  Created by LinWiilen on 15/7/22.
//  Copyright (c) 2015年 WiilenLin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"

@interface CardMatchingGame : NSObject

//designated initializer
- (instancetype)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck;
- (void)chooseCardAtIndex:(NSUInteger)index;
- (Card *)cardAtIndex:(NSUInteger)index;

@property (nonatomic,readonly) NSInteger score;
@property (nonatomic) NSUInteger numberOfMatchedCards;


@end
