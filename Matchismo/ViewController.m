//
//  ViewController.m
//  Matchismo
//
//  Created by LinWiilen on 15/7/16.
//  Copyright (c) 2015年 WiilenLin. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UILabel *matchResult;
@property (strong, nonatomic) IBOutlet UISegmentedControl *gameMode;
@end

@implementation ViewController

- (UISegmentedControl *)gameMode {
    if (!_gameMode) {
        _gameMode = [[UISegmentedControl alloc] init];
    }
    return _gameMode;
}

- (CardMatchingGame *)game {
    if (!_game) {
        _game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count]
                                                  usingDeck:[self createDeck]];
    }
    return _game;
}


- (Deck *)createDeck {  //abstract
    return nil;
}

- (IBAction)redealCards {
    self.game = nil;
    [self updateUI];
    [self.gameMode setEnabled:YES];
    if (self.gameMode.selectedSegmentIndex == 1) {
        self.game.numberOfMatchedCards = 3;
    } else {
        self.game.numberOfMatchedCards = 2;
    }
    
}

- (IBAction)playHistory:(UISlider *)sender {
    
}


- (IBAction)changeMode:(UISegmentedControl *)sender {

    NSUInteger index = sender.selectedSegmentIndex;
    switch (index) {
        case 0:
            self.game.numberOfMatchedCards = 2;
            NSLog(@"num: %ld",(unsigned long)self.game.numberOfMatchedCards);
            break;
        case 1:
            self.game.numberOfMatchedCards = 3;
            NSLog(@"num: %ld",(unsigned long)self.game.numberOfMatchedCards);
            break;
    }
}


- (IBAction)touchCardButton:(UIButton *)sender {
    [self.gameMode setEnabled:NO];
    NSUInteger chooseButtonIndex = [self.cardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:chooseButtonIndex];
    [self updateUI];
    
}


-(void)updateUI{
    for (UIButton *cardButton in self.cardButtons) {
        NSUInteger cardButtonIndex = [self.cardButtons indexOfObject:cardButton];
        Card *card = [self.game cardAtIndex:cardButtonIndex];
        [cardButton setAttributedTitle:[self foregroundTextForCard:card] forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backgroundImageForCard:card] forState:UIControlStateNormal];
        cardButton.enabled = !card.isMatched;
        self.scoreLabel.text = [NSString stringWithFormat:@"Score: %ld",(long)[self.game score]];
    }
    
    
}

- (NSAttributedString *)foregroundTextForCard:(Card *)card {
    return nil;
}

- (UIImage *)backgroundImageForCard:(Card *)card {
    return [UIImage imageNamed: card.isChosen ? @"cardFront" : @"cardback" ];
}

@end
