//
//  CardGameViewController.m
//  Matchismo
//
//  Created by Hans-Jürgen Krüger on 26.01.13.
//  Copyright (c) 2013 Hans-Jürgen Krüger. All rights reserved.
//

#import "CardGameViewController.h"
#import "PlayingCardDeck.h"
#import "PlayingCard.h"

@interface CardGameViewController ()

@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (nonatomic) int flipCount;

@property (strong, nonatomic) PlayingCardDeck *deck;

@end

@implementation CardGameViewController

- (void)setFlipCount:(int)flipCount
{
    _flipCount = flipCount;
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d", _flipCount];
}

- (IBAction)flipCard:(UIButton *)sender
{
    sender.selected = !sender.selected;
    self.flipCount++;
    
    if (sender.selected) {
        Card *card = [self.deck drawRandomCard];
        [sender setTitle:card.contents forState:UIControlStateSelected];
        
        // put the card back to the deck for endless playing
        [self.deck addCard:card atTop:NO];
    }
}

- (PlayingCardDeck *)deck
{
    if (!_deck) {
        _deck = [[PlayingCardDeck alloc] init];
    }
    return _deck;
}

@end
