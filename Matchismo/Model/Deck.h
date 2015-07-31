//
//  Deck.h
//  Matchismo
//
//  Created by LinWiilen on 15/7/18.
//  Copyright (c) 2015年 WiilenLin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

- (void)addCard:(Card *)card atTop:(BOOL)atTop;
- (void)addCard:(Card *)card;

- (Card *)drawRandomCard;

@end
