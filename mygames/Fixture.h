//
//  Fixture.h
//  bookgames
//
//  Created by Vitor Navarro on 11/20/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Game.h"
#import "MyGames.h"

@interface Fixture : NSObject
+(void)insertGames;
+(NSInteger)gamesCount;
+(void)setupCoreData;
+(void)truncateAll;
@end
