//
//  Card.h
//  Matchismo
//
//  Created by LinWiilen on 15/7/17.
//  Copyright (c) 2015年 WiilenLin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (strong,nonatomic) NSString *contents;

@property (nonatomic,getter=isChosen) BOOL chosen;
@property (nonatomic,getter=isMatched) BOOL matched;

-(int)matched:(NSArray *)otherCards;

@end
