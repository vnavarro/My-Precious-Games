//
//  CustomCellViewController.m
//  mygames
//
//  Created by Vitor Navarro on 11/20/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CustomCellViewController.h"


@implementation CustomCellViewController
@synthesize background=_background;
@synthesize avatar=_avatar;
@synthesize title=_title;
@synthesize subTitle=_subTitle;
@synthesize disclosure=_disclosure;
@synthesize delegate=_delegate;


#pragma mark - View lifecycle

- (IBAction)disclosureTouched:(id)sender {  
  [self.delegate disclosureTouched:self.title.text];
}

-(void)layoutCustomCell:(NSInteger)index withImageUrl:(NSURL *)url
                  title:(NSString *)title andSubtitle:(NSString *)subTitle;{
  UIImageView *bg = [[[UIImageView alloc]init]autorelease];
  if(index % 2)
    [bg setImage:[UIImage imageNamed:@"strippedbackground_2.png"]];
  else
    [bg setImage:[UIImage imageNamed:@"strippedbackground.png"]];
  [self setBackgroundView:bg];
  [self.avatar setImageWithURL:url placeholderImage:[UIImage imageNamed:@"loading.png"]];
  [self.title setText:title];
  [self.subTitle setText:subTitle];
}

-(void)addDisclosureHidden:(BOOL)hidden{
  if(hidden)
    [self.disclosure setImage:[UIImage imageNamed:@"Delete.png"] forState:UIControlStateNormal];
  else
    [self.disclosure setImage:[UIImage imageNamed:@"Add.png"] forState:UIControlStateNormal];
}

- (void)dealloc
{
  [self setBackground:nil];
  [self setAvatar:nil];
  [self setTitle:nil];
  [self setSubTitle:nil];
  [self setDisclosure:nil];
  [_background release];
  [_avatar release];
  [_title release];
  [_subTitle release];
  [_disclosure release];
  [super dealloc];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
