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
@property (nonatomic,strong,readwrite) NSMutableArray *playHistory;
@end

@implementation CardMatchingGame

- (NSMutableArray *)playHistory {
    if (!_playHistory) {
        _playHistory = [[NSMutableArray alloc] init];
    }
    return _playHistory;
}

- (NSMutableArray *)cards {
    if (!_cards) {
        _cards = [[NSMutableArray alloc] init];
    }
    return _cards;
}

-(NSUInteger)numberOfMatchedCards {
    if(!_numberOfMatchedCards) _numberOfMatchedCards = 2;
    return _numberOfMatchedCards;
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
            
            NSMutableArray *cardsPreparedToMatched = [[NSMutableArray alloc] init];
            
            for (Card *otherCard in self.cards) {
                if (otherCard.isChosen && !otherCard.isMatched) {
                    [cardsPreparedToMatched addObject:otherCard];
                }
            }
            
            int scoreForThisRound = 0;
            
            BOOL isTimeForMatch = NO;
            
//            NSLog(@"%lu",(unsigned long)[cardsPreparedToMatched count]);
            
            if ([cardsPreparedToMatched count] + 1 == self.numberOfMatchedCards) {
                
                isTimeForMatch = YES;
                
                int matchScore = [card matched:cardsPreparedToMatched];
                
                if (matchScore) {
                    scoreForThisRound = matchScore * MATCH_BONUS;
                    card.matched = YES;
                    
                } else {
                    self.score -= MISMATCH_PENALTY;
                    card.matched = NO;
                }
                
                for (Card *otherCard in cardsPreparedToMatched) {
                    if (card.matched) {
                        otherCard.matched = YES;
                    } else {
                        otherCard.chosen = NO;
                    }
                }
                
                self.score += scoreForThisRound;
            }
            
            card.chosen = YES;
            self.score -= COST_TO_CHOOSE;
            
            [cardsPreparedToMatched addObject:card];
            
            NSDictionary *historyItem = @{@"cards":cardsPreparedToMatched,
                                          @"matched":@(card.isMatched),
                                          @"score":@(scoreForThisRound),
                                          @"isTimeForMatch":@(isTimeForMatch)};
            [self.playHistory addObject:historyItem];
        }
    }
    
}

@end

