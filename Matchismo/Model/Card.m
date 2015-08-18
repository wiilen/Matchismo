//
//  Card.m
//  Matchismo
//
//  Created by LinWiilen on 15/7/17.
//  Copyright (c) 2015年 WiilenLin. All rights reserved.
//

#import "Card.h"

@implementation Card

- (int)matched:(NSArray *)otherCards{
    
    int score = 0;
    
    for (Card *card in otherCards) {
        if ([card.contents isEqualToString:self.contents]) {
            score ++;
        }
    }
    
    return score;
}


@end
