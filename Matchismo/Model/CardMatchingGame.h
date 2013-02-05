//
//  CardMatchingGame.h
//  Matchismo
//
//  Created by Hans-Jürgen Krüger on 04.02.13.
//  Copyright (c) 2013 Hans-Jürgen Krüger. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"

@interface CardMatchingGame : NSObject

- (id)initWithCardCount:(NSUInteger)cardCount usingDeck:(Deck *)deck;

- (void)flipCardAtIndex:(NSUInteger)index;

- (Card *)cardAtIndex:(NSUInteger)index;

@property (nonatomic, readonly) int score;

@end
