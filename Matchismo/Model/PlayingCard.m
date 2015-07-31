//
//  PlayingCard.m
//  Matchismo
//
//  Created by LinWiilen on 15/7/18.
//  Copyright (c) 2015年 WiilenLin. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

- (int)matched:(NSArray *)otherCards {
    int score;
    
    if ([otherCards count] == 1) {
        PlayingCard *otherCard = [otherCards firstObject];
        if (otherCard.rank == self.rank) {
            score = 4;
        } else if ([otherCard.suit isEqualToString:self.suit]) {
            score = 1;
        }
    }
    
    return score;
}

- (NSString *)contents {
    
    return [[PlayingCard rankStrings][self.rank] stringByAppendingString:self.suit];
}

+ (NSArray *)validSuits {
    return @[@"♠︎",@"♣︎",@"♥︎",@"♦︎"];
}

+ (NSUInteger)maxRank {
    return [[self rankStrings] count] -1;
}

@synthesize suit = _suit;

- (void)setSuit:(NSString *)suit{
    if ([[PlayingCard validSuits] containsObject:suit]) {
        _suit = suit;
    }
}

- (NSString *)suit {
    return _suit ? _suit : @"?";
}

+ (NSArray *)rankStrings {
    return @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
}

- (void)setRank:(NSUInteger)rank{
    if (rank <= [PlayingCard maxRank] ) {
        _rank = rank;
    }
}

@end
