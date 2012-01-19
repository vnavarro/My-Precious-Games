//
//  GameModel.h
//  mygames
//
//  Created by Vitor Navarro on 11/20/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Game.h"

@interface Game (Model)
+(NSArray *)findAllContainingText:(NSString *)value;
@end
