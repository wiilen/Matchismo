//
//  SetCardViewController.m
//  Matchismo
//
//  Created by LinWiilen on 15/8/11.
//  Copyright (c) 2015年 WiilenLin. All rights reserved.
//

#import "SetCardViewController.h"
#import "SetCardDeck.h"
#import "SetCard.h"

@interface SetCardViewController ()
//
//@end
//
//@implementation SetCardViewController
//
//- (Deck *)createDeck {
//    
//    return [[SetCardDeck alloc] init];
//}
//
//
//- (NSAttributedString *)foregroundTextForCard:(Card *)card {
//    
//    NSString *symbol = @"11";
//    NSMutableDictionary *attributes = [[NSMutableDictionary alloc] init];
//    
//    if ([card isKindOfClass:[SetCard class]]) {
//        SetCard *setCard = (SetCard *)card;
//        
//        if ([setCard.symbol isEqualToString:@"oval"]) symbol = @"●";
//        if ([setCard.symbol isEqualToString:@"squiggle"]) symbol = @"▲";
//        if ([setCard.symbol isEqualToString:@"diamond"]) symbol = @"◼︎";
//        
//        NSLog(@"%@:%@:%@:%@",symbol,setCard.color,setCard.shading,setCard.contents);
//        
//        symbol = [symbol stringByPaddingToLength:setCard.number
//                                      withString:symbol
//                                 startingAtIndex:0];
//    
//        if ([setCard.color isEqualToString:@"green"]) {
//            [attributes setObject:[UIColor greenColor]
//                           forKey:NSForegroundColorAttributeName];
//        }
//        if ([setCard.color isEqualToString:@"red"]) {
//            [attributes setObject:[UIColor redColor]
//                           forKey:NSForegroundColorAttributeName];
//        }
//        if ([setCard.color isEqualToString:@"purple"]) {
//            [attributes setObject:[UIColor purpleColor]
//                           forKey:NSForegroundColorAttributeName];
//        }
//    
//        if ([setCard.shading isEqualToString:@"solid"]) {
//            [attributes setObject:@-5 forKey:NSStrokeWidthAttributeName];
//        }
//        if ([setCard.shading isEqualToString:@"striped"]) {
//            [attributes addEntriesFromDictionary:@{
//                                                   NSStrokeWidthAttributeName : @-5,
//                                                   NSStrokeColorAttributeName : attributes[NSForegroundColorAttributeName],
//                                                   NSForegroundColorAttributeName : [attributes[NSForegroundColorAttributeName] colorWithAlphaComponent:0.1]
//                                                   }];
//        }
//        if ([setCard.shading isEqualToString:@"open"]) {
//            [attributes setObject:@5 forKey:NSStrokeWidthAttributeName];
//        }
//    
//    
//    
//    } else {
//        NSLog(@"NOt");
//    }
//    
//    NSMutableAttributedString *setCardAttri = [[NSMutableAttributedString alloc] initWithString:symbol attributes:attributes];
//    
//    return setCardAttri;
//}
//
//
//- (void)viewDidLoad {
//    [super viewDidLoad];
//    [self updateUI];
//}
//
//- (UIImage *)backgroundImageForCard:(Card *)card {
//    return [UIImage imageNamed:card.chosen ? @"SetCardSeleted" : @"SetCard"];
//}



@end
