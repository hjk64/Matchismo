//
//  GameResultViewController.m
//  Matchismo
//
//  Created by Hans-Jürgen Krüger on 09.02.13.
//  Copyright (c) 2013 Hans-Jürgen Krüger. All rights reserved.
//

#import "GameResultViewController.h"
#import "GameResult.h"

typedef enum {
    GameResultSortByDate = 0,
    GameResultSortByScore,
    GameResultSortByDuration
} GameResultSort;

@interface GameResultViewController ()

@property (weak, nonatomic) IBOutlet UITextView *display;
@property (nonatomic) GameResultSort sortBy;

@end

@implementation GameResultViewController

#define DATE_COMPONENTS @"ddMMyyyyHHmmss"

+ (NSString *)dateToString:(NSDate *)date
{
    static NSDateFormatter *dateFormatter = nil;
    if (!dateFormatter) {
        dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:[NSDateFormatter dateFormatFromTemplate:DATE_COMPONENTS options:0 locale:[NSLocale currentLocale]]];
    }
    return [dateFormatter stringFromDate:date];
}

- (void)updateUI
{
    NSString *displayText = @"";
    
    NSArray *sortedGameResults = [[GameResult allGameResults].mutableCopy
        sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2)
        {
            if ([obj1 isKindOfClass:[GameResult class]] && [obj2 isKindOfClass:[GameResult class]]) {
                GameResult *result1 = (GameResult *)obj1;
                GameResult *result2 = (GameResult *)obj2;
                if (self.sortBy == GameResultSortByScore) { // highest score at top
                    if (result1.score < result2.score) return NSOrderedDescending;
                    else if (result1.score > result2.score) return NSOrderedAscending;
                    else return NSOrderedSame;
                } else if (self.sortBy == GameResultSortByDuration) { // note reversed comparison here; shortes duration at top
                    if (result2.duration < result1.duration) return NSOrderedDescending;
                    else if (result2.duration > result1.duration) return NSOrderedAscending;
                    else return NSOrderedSame;
                } else { // note reversed comparison here; last start date at top
                    return [result2.start compare:result1.start];
                }
            } else {
                return NSOrderedSame;
            }
        }];
    
    for (GameResult *result in sortedGameResults) {
        displayText = [displayText stringByAppendingFormat:@"Score: % 3d (%@, %0gs)\n", result.score, [GameResultViewController dateToString:result.end], round(result.duration)];
    }
    self.display.text = displayText;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self updateUI];
}

- (void)setup
{
    // initialiation that can't wait until viewDidLoad
}

-(void)awakeFromNib
{
    [self setup];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    [self setup];
    return self;
}

- (IBAction)sortByDate
{
    self.sortBy = GameResultSortByDate;
    [self updateUI];
}

- (IBAction)sortByScore
{
    self.sortBy = GameResultSortByScore;
    [self updateUI];
}

- (IBAction)sortByDuration
{
    self.sortBy = GameResultSortByDuration;
    [self updateUI];
}

@end
