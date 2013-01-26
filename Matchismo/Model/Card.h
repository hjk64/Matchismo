//
//  Card.h
//  Matchismo
//
//  Created by Hans-Jürgen Krüger on 26.01.13.
//  Copyright (c) 2013 Hans-Jürgen Krüger. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (strong) NSString *contents;

@property (nonatomic,getter=isFaceUp) BOOL faceUp;
@property (nonatomic,getter=isUnplayable) BOOL unplayable;

- (int)match:(NSArray *)otherCards;

@end
