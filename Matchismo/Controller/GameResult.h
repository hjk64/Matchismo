//
//  GameResult.h
//  Matchismo
//
//  Created by Hans-Jürgen Krüger on 09.02.13.
//  Copyright (c) 2013 Hans-Jürgen Krüger. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GameResult : NSObject

+ (NSArray *)allGameResults;

@property (readonly, nonatomic) NSDate *start;
@property (readonly, nonatomic) NSDate *end;
@property (readonly, nonatomic) NSTimeInterval duration;
@property (nonatomic) int score;
@end
