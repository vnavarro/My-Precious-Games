//
//  MyGamesTableViewController.m
//  mygames
//
//  Created by Vitor Navarro on 11/21/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MyGamesTableViewController.h"


@implementation MyGamesTableViewController


-(void)update:(NSString *)searchText{  
  if([searchText isEqualToString:@""])    
    self.games = [Favorite findAllSortedBy:@"game.title" ascending:YES];
  else{
    NSArray *games = [Game findAllContainingText:searchText];
    NSMutableArray *favorite = [NSMutableArray arrayWithCapacity:[games count]];
    for (Game *game in games) {  
      if (game.mygame)
        [favorite addObject:game.mygame];
    }
    self.games = favorite;
  }
  [self.tableView reloadData];
}

-(void)updateData{
  self.games = [Favorite findAll];
  [self.tableView reloadData];
}

#pragma mark - Custom Cell Delegate

- (void)disclosureTouched:(NSString *)title{
  Game *game = [Game findFirstByAttribute:@"title" withValue:title];
  [game.mygame deleteEntity];
  [self updateData];
}

#pragma mark - View lifecycle
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}



-(void)loadData{  
  self.games = [Favorite findAll];
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
  [self setTitle:@"My Precious"];
}


-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
  Favorite *myGame = [self.games objectAtIndex:indexPath.row];
  Game *game = myGame.game;
  
  [(CustomCellViewController*)cell layoutCustomCell:indexPath.row withImageUrl:[NSURL URLWithString:game.avatar_url] title:game.title andSubtitle:[NSString stringWithFormat:@"%@, %@",game.genre,game.publisher]];
  
  [(CustomCellViewController*)cell addDisclosureHidden:YES];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
  Favorite *myGame = [self.games objectAtIndex:indexPath.row];
  GameDetailsViewController *detailsController = [[[GameDetailsViewController alloc]initWithGame:myGame.game andLoadFromMyGame:NO]autorelease];
  [self.navigationController pushViewController:detailsController animated:YES];
}

- (void)viewDidUnload
{

    [super viewDidUnload];
}

- (void)dealloc {
  
  [super dealloc];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
