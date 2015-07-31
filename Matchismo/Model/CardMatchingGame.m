//
//  CardMacthingGame.m
//  Matchismo
//
//  Created by LinWiilen on 15/7/22.
//  Copyright (c) 2015年 WiilenLin. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()
@property (nonatomic,readwrite) NSInteger score;
@property (nonatomic,strong) NSMutableArray *cards;
@end

@implementation CardMatchingGame

- (NSMutableArray *)cards {
    if (!_cards) {
        _cards = [[NSMutableArray alloc] init];
    }
    return _cards;
}

- (instancetype)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck {
    
    self = [super init];
    
    if (self) {
        for (int i = 0; i < count; i++) {
            Card *randomCard = [deck drawRandomCard];
            if (randomCard) {
                [self.cards addObject:randomCard];
            } else {
                self = nil;
                break;
            }
            
        }
    }
    
    return self;
}

- (Card *)cardAtIndex:(NSUInteger)index {
    return (index < [self.cards count]) ? [self.cards objectAtIndex:index] : nil;
}

static const int MISMATCH_PENALTY = 2;
static const int MATCH_BONUS = 4;
static const int COST_TO_CHOOSE = 1;

- (void)chooseCardAtIndex:(NSUInteger)index {
    
    Card *card = self.cards[index];
    if (!card.isMatched) {
        if (card.isChosen) {
            card.chosen = NO;
        } else {
            for (Card *othercard in self.cards) {
                if (othercard.isChosen && !othercard.isMatched) {
                    int matchScore = [card matched:@[othercard]];
                    if (matchScore){
                        self.score += matchScore * MATCH_BONUS;
                        card.matched = YES;
                        othercard.matched = YES;
                    } else {
                        self.score -= MISMATCH_PENALTY;
                        othercard.chosen = NO;
                    }
                    break;
                }
            }
            self.score -= COST_TO_CHOOSE;
            card.chosen = YES;
        }
    }
    
    
    
    
    
}

@end

