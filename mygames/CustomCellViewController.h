//
//  CustomCellViewController.h
//  mygames
//
//  Created by Vitor Navarro on 11/20/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIImageView+WebCache.h"

@protocol CustomCellDelegate <NSObject>

-(void)disclosureTouched:(NSString *)title;

@end

@interface CustomCellViewController : UITableViewCell {
    
}

@property (nonatomic, retain) IBOutlet UIImageView *background;
@property (nonatomic, retain) IBOutlet UIImageView *avatar;
@property (nonatomic, retain) IBOutlet UILabel *title;
@property (nonatomic, retain) IBOutlet UILabel *subTitle;
@property (nonatomic, retain) IBOutlet UIButton *disclosure;
@property (nonatomic, assign) id<CustomCellDelegate> delegate;

- (IBAction)disclosureTouched:(id)sender;

-(void)addDisclosureHidden:(BOOL)hidden;
-(void)layoutCustomCell:(NSInteger)index withImageUrl:(NSURL *)url
                  title:(NSString *)title andSubtitle:(NSString *)subTitle;
@end
