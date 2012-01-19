//
//  GameDetailsViewController.m
//  mygames
//
//  Created by Vitor Navarro on 11/20/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "GameDetailsViewController.h"


@implementation GameDetailsViewController
@synthesize gameTitle;
@synthesize avatar;
@synthesize detail;
@synthesize genre;
@synthesize publisher;
@synthesize developer;
@synthesize platform;
@synthesize esrb;
@synthesize players;
@synthesize playersImage;
@synthesize rating;
@synthesize scrollView;
@synthesize game =_game;
@synthesize fromMyGame =_fromMyGame;

-(void)loadInfoFromMyGame{
  [self.gameTitle setText:self.game.title];
  [self.publisher setText:self.game.publisher];
  [self.developer setText:self.game.developer];
  [self.genre setText:self.game.genre];
  [self.players setText:[NSString stringWithFormat:@"Number of Players:%@",self.game.players]];
  [self.esrb setText:self.game.esrb];
  [self.avatar setImageWithURL:[NSURL URLWithString:self.game.avatar_url] placeholderImage:[UIImage imageNamed:@"loading.png"]];
  [self.platform setText:self.game.platform];
  if(self.game.mygame && self.fromMyGame){
    [self.detail setText:[(Favorite *)self.game.mygame comment]];
    [self.rating setText:[[(Favorite *)self.game.mygame rating]stringValue]];
  }
  else{
    [self.rating setHidden:YES];
    [self.detail setText:self.game.detail];
  }
  [self.playersImage setImage:[UIImage imageNamed:@"controller.png"]];
}

#pragma mark - View lifecycle
- (id)initWithGame:(Game *)game andLoadFromMyGame:(BOOL)fromMyGame
{
  self = [super initWithNibName:@"GameDetailsView" bundle:nil];
  if (self) {
    self.game = game;
    self.fromMyGame = fromMyGame;
  }
  return self;
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
  [super viewDidLoad];
  [self.scrollView setScrollEnabled:YES];
  [self.scrollView setContentSize:CGSizeMake(self.view.frame.size.width, self.view.frame.size.height)];
  
  [self loadInfoFromMyGame];
}

- (void)viewDidUnload
{
   self.game = nil;
    [self setGameTitle:nil];
    [self setAvatar:nil];
    [self setDetail:nil];
    [self setGenre:nil];
    [self setPublisher:nil];
    [self setDeveloper:nil];
    [self setPlatform:nil];
    [self setEsrb:nil];
    [self setPlayers:nil];
    [self setPlayersImage:nil];
    [self setRating:nil];
  [self setScrollView:nil];
    [super viewDidUnload];
}

- (void)dealloc
{

    [_game release];
  [gameTitle release];
  [avatar release];
  [detail release];
  [genre release];
  [publisher release];
  [developer release];
  [platform release];
  [esrb release];
  [players release];
  [playersImage release];
  [rating release];
  [scrollView release];
  [super dealloc];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
