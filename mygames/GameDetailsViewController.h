//
//  GameDetailsViewController.h
//  mygames
//
//  Created by Vitor Navarro on 11/20/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Game.h"
#import "Favorite.h"
#import "UIImageView+WebCache.h"

@interface GameDetailsViewController : UIViewController {
    
  UILabel *gameTitle;
  UIImageView *avatar;
  UITextView *detail;
  UILabel *genre;
  UILabel *publisher;
  UILabel *developer;
  UILabel *platform;
  UILabel *esrb;
  UILabel *players;
  UIImageView *playersImage;
  UILabel *rating;
  UIScrollView *scrollView;
}
@property (nonatomic, retain) IBOutlet UILabel *gameTitle;
@property (nonatomic, retain) IBOutlet UIImageView *avatar;
@property (nonatomic, retain) IBOutlet UITextView *detail;
@property (nonatomic, retain) IBOutlet UILabel *genre;
@property (nonatomic, retain) IBOutlet UILabel *publisher;
@property (nonatomic, retain) IBOutlet UILabel *developer;
@property (nonatomic, retain) IBOutlet UILabel *platform;
@property (nonatomic, retain) IBOutlet UILabel *esrb;
@property (nonatomic, retain) IBOutlet UILabel *players;
@property (nonatomic, retain) IBOutlet UIImageView *playersImage;
@property (nonatomic, retain) IBOutlet UILabel *rating;
@property (nonatomic, retain) IBOutlet UIScrollView *scrollView;
@property (nonatomic, retain) Game *game;
@property (nonatomic, assign) BOOL fromMyGame;

-(void)loadInfoFromMyGame;
- (id)initWithGame:(Game *)game andLoadFromMyGame:(BOOL)fromMyGame;
@end
