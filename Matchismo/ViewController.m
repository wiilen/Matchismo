//
//  ViewController.m
//  Matchismo
//
//  Created by LinWiilen on 15/7/16.
//  Copyright (c) 2015年 WiilenLin. All rights reserved.
//

#import "ViewController.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"

@interface ViewController ()
@property (strong,nonatomic) CardMatchingGame *game;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UISegmentedControl *gameMode;
@end

@implementation ViewController


- (CardMatchingGame *)game {
    if (!_game) {
        _game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count]
                                                  usingDeck:[self createDeck]];
    }
    return _game;
}


- (PlayingCardDeck *)createDeck {
    return [[PlayingCardDeck alloc] init];
}

- (IBAction)redealCards {
    self.game = nil;
    [self updateUI];
    [self.gameMode setEnabled:YES];
}

- (IBAction)changeMode:(UISegmentedControl *)sender {
    [sender addTarget:self action:@selector(segmentAction:) forControlEvents:UIControlEventValueChanged];
}


- (IBAction)touchCardButton:(UIButton *)sender {
    [self.gameMode setEnabled:NO];
    NSUInteger chooseButtonIndex = [self.cardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:chooseButtonIndex];
    [self updateUI];
    
    
}

- (void)segmentAction:(UISegmentedControl *)seg {
    NSUInteger index = seg.selectedSegmentIndex;
    
    switch (index) {
        case 0:
            NSLog(@"index: %ld",index);
            break;
        case 1:
            NSLog(@"index: %ld",index);
            break;
    }
}

-(void)updateUI{
    for (UIButton *cardButton in self.cardButtons) {
        NSUInteger cardButtonIndex = [self.cardButtons indexOfObject:cardButton];
        Card *card = [self.game cardAtIndex:cardButtonIndex];
        [cardButton setTitle:[self titleForCard:card] forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backgroundImageForCard:card] forState:UIControlStateNormal];
        cardButton.enabled = !card.isMatched;
        self.scoreLabel.text = [NSString stringWithFormat:@"Score: %ld",(long)[self.game score]];
    }
}

- (NSString *)titleForCard:(Card *)card {
    return card.isChosen ? card.contents :@"";
}

- (UIImage *)backgroundImageForCard:(Card *)card {
    return [UIImage imageNamed: card.isChosen ? @"cardFront" : @"cardback" ];
}

@end
