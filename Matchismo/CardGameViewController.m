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

@property (strong, nonatomic) PlayingCardDeck *playingCardDeck;

@end

@implementation CardGameViewController

- (void)viewDidLoad
{
    self.playingCardDeck = [[PlayingCardDeck alloc] init];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    [self setPlayingCardDeck:nil];
}

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
        Card *card = [self.playingCardDeck drawRandomCard];
        [sender setTitle:card.contents forState:UIControlStateSelected];
        [self.playingCardDeck addCard:card atTop:NO];
    }
}

@end
