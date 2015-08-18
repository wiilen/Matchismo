//
//  PlayingCardGameViewController.m
//  Matchismo
//
//  Created by LinWiilen on 15/8/9.
//  Copyright (c) 2015年 WiilenLin. All rights reserved.
//

#import "PlayingCardGameViewController.h"
#import "PlayingCardDeck.h"

@interface PlayingCardGameViewController ()

@end

@implementation PlayingCardGameViewController

- (Deck *)createDeck {
    return [[PlayingCardDeck alloc] init];
}

- (NSAttributedString *)foregroundTextForCard:(Card *)card {
    NSAttributedString *title = [[NSAttributedString alloc] initWithString:card.isChosen ? card.contents : @"" attributes:@{ NSForegroundColorAttributeName : [UIColor blackColor]} ];
return title;
}

@end
