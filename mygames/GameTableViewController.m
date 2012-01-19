//
//  RootViewController.m
//  mygames
//
//  Created by Vitor Navarro on 11/20/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "GameTableViewController.h"

@implementation GameTableViewController
@synthesize table_cell_nib=_table_cell_nib;
@synthesize table_cell_temp=_table_cell_temp;
@synthesize games = _games;
@synthesize searchBar = _searchBar;
@synthesize shader=_shader;
@synthesize btnInfo = _btnInfo;

- (IBAction)infoTouched:(id)sender {
  UIViewController *controller = [[[UIViewController alloc]initWithNibName:@"AboutView" bundle:nil]autorelease];
  [self.navigationController pushViewController:controller animated:YES];
}

-(void)loadInfoButton{
  UIBarButtonItem *right_button = [[[UIBarButtonItem alloc]initWithCustomView:self.btnInfo]autorelease];    
  [self.navigationItem setRightBarButtonItem:right_button];
}

#pragma mark - Custom Cell Delegate

- (void)disclosureTouched:(NSString *)title{
  Game *game = [Game findFirstByAttribute:@"title" withValue:title];
  if(game.mygame)
    [game.mygame deleteEntity];
  else{
    Favorite *myGame = [Favorite createEntity];
    myGame.game = game;
  }
  self.games = [Game findAllSortedBy:@"title" ascending:YES];
  [self.tableView reloadData];
}

#pragma mark - Shader

-(void)shaderOn{
  [UIView animateWithDuration:0.8 animations:^{
    [self.shader setAlpha:0.5];    
  }];
}

-(void)shaderOff{
  [UIView animateWithDuration:0.8 animations:^{
    [self.shader setAlpha:0];    
  }];  
}

#pragma mark - Search Bar Delegate

-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
  [self shaderOff];
  [self.searchBar setText:@""];
  [self.searchBar setShowsCancelButton:NO animated:YES];
  [self.searchBar resignFirstResponder];  
  [self.tableView setScrollEnabled:YES];
}
-(void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar{
  [self shaderOn];
  [self.searchBar setShowsCancelButton:YES animated:YES];
  [self.tableView setScrollEnabled:NO];
}

-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
  [self update:searchText];
}

-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
  [self update:[searchBar text]];
  [self shaderOff];
  [self.searchBar setShowsCancelButton:NO animated:YES];
  [self.searchBar resignFirstResponder];
  [self.tableView setScrollEnabled:YES];  
}



-(void)update:(NSString *)searchText{  
  if([searchText isEqualToString:@""])
    self.games = [Game findAllSortedBy:@"title" ascending:YES];
  else{
    self.games = [Game findAllContainingText:searchText];
  }
  [self.tableView reloadData];
}


#pragma mark - View Lifecycle

- (id)init {
  self = [super init];
  if (self) {

  }
  return self;
}

- (void)viewDidLoad
{
  [super viewDidLoad];
  
  [self loadInfoButton];
  
   self.table_cell_nib = [UINib nibWithNibName:@"CustomCellView" bundle:nil];
  self.shader = [[[UIView alloc]init]autorelease];
  [self.shader setBackgroundColor:[UIColor blackColor]];
  [self.shader setFrame:CGRectMake(0, self.searchBar.frame.size.height, 320, self.tableView.frame.size.height)];
  [self.shader setAlpha:0];
  [self.view addSubview:self.shader];
  [self setTitle:@"Games"];
  
}

-(void)updateData{
  self.games = [Game findAllSortedBy:@"title" ascending:YES];
  [self.tableView reloadData];
}

-(void)viewWillAppear:(BOOL)animated{
  [self updateData];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
  return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  return [self.games count];
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
  Game *game = [self.games objectAtIndex:indexPath.row];

  [(CustomCellViewController*)cell layoutCustomCell:indexPath.row withImageUrl:[NSURL URLWithString:game.avatar_url] title:game.title andSubtitle:[NSString stringWithFormat:@"%@, %@",game.genre,game.publisher]];
  
  [(CustomCellViewController*)cell addDisclosureHidden:game.mygame != nil];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  static NSString *CellIdentifier = @"cell";
  
  CustomCellViewController *cell = (CustomCellViewController *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
  
  if (cell == nil){
    
    [self.table_cell_nib instantiateWithOwner:self options:nil];
		cell = self.table_cell_temp;
		self.table_cell_temp = nil;
  }
  
  cell.delegate = self;

    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
  GameDetailsViewController *detailsController = [[[GameDetailsViewController alloc]initWithGame:[self.games objectAtIndex:indexPath.row] andLoadFromMyGame:NO]autorelease];
  [self.navigationController pushViewController:detailsController animated:YES];
}

-(void)refresh{
  [self updateData];
  [self stopLoading];
}


- (void)viewDidUnload
{
  self.table_cell_nib = nil;
  self.table_cell_temp = nil;
  self.games = nil;
  self.shader =nil;
  [self setSearchBar:nil];
  [self setBtnInfo:nil];
  [super viewDidUnload];
}

- (void)dealloc
{
  [_shader release];
  [_games release];
  [_table_cell_nib release];
  [_table_cell_temp release];
  [_searchBar release];
  [_btnInfo release];
  [super dealloc];
}

@end
