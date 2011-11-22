//
//  Favorite.h
//  mygames
//
//  Created by Vitor Navarro on 11/21/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Game;

@interface Favorite : NSManagedObject {
@private
}
@property (nonatomic, retain) NSString * comment;
@property (nonatomic, retain) NSNumber * rating;
@property (nonatomic, retain) Game * game;

@end
