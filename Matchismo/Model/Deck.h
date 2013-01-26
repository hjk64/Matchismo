//
//  Deck.h
//  Matchismo
//
//  Created by Hans-Jürgen Krüger on 26.01.13.
//  Copyright (c) 2013 Hans-Jürgen Krüger. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

- (void)addCard:(Card *)card atTop:(BOOL)atTop;

- (Card *)drawRandomCard;

@end
