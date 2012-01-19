//
//  RootViewController.h
//  mygames
//
//  Created by Vitor Navarro on 11/20/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PullRefreshTableViewController.h"
#import "UIImageView+WebCache.h"
#import "CustomCellViewController.h"
#import "GameModel.h"
#import "Favorite.h"
#import "GameDetailsViewController.h"

@interface GameTableViewController : PullRefreshTableViewController<UITableViewDelegate,
UITableViewDataSource,UISearchBarDelegate,CustomCellDelegate> {
  UISearchBar *_searchBar;
  UIButton *_btnInfo;
}

@property (nonatomic, retain) IBOutlet UINib *table_cell_nib;
@property (nonatomic, retain) IBOutlet CustomCellViewController *table_cell_temp;
@property (nonatomic, retain) NSArray *games;
@property (nonatomic, retain) IBOutlet UISearchBar *searchBar;
@property (nonatomic, retain) UIView *shader;
@property (nonatomic, retain) IBOutlet UIButton *btnInfo;
- (IBAction)infoTouched:(id)sender;

-(void)update:(NSString *)searchText;
@end
