//
//  Game.h
//  mygames
//
//  Created by Vitor Navarro on 11/20/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Game : NSManagedObject {
@private
}
@property (nonatomic, retain) NSString * developer;
@property (nonatomic, retain) NSString * publisher;
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSNumber * players;
@property (nonatomic, retain) NSString * avatar_url;
@property (nonatomic, retain) NSString * detail;
@property (nonatomic, retain) NSString * platform;
@property (nonatomic, retain) NSString * genre;
@property (nonatomic, retain) NSString * esrb;
@property (nonatomic, retain) NSSet* categories;
@property (nonatomic, retain) NSManagedObject * mygame;

@end
