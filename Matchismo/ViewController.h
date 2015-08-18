//
//  ViewController.h
//  Matchismo
//
//  Created by LinWiilen on 15/7/16.
//  Copyright (c) 2015年 WiilenLin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Deck.h"
#import "CardMatchingGame.h"

@interface ViewController : UIViewController

- (Deck *)createDeck;
- (NSAttributedString *)foregroundTextForCard:(Card *)card;
-(void)updateUI;
- (UIImage *)backgroundImageForCard:(Card *)card;
@property (strong,nonatomic) CardMatchingGame *game;
@end

