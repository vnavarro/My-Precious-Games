//
//  Category.m
//  mygames
//
//  Created by Vitor Navarro on 11/20/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "Category.h"
#import "Game.h"


@implementation Category
@dynamic name;
@dynamic games;

- (void)addGamesObject:(Game *)value {    
    NSSet *changedObjects = [[NSSet alloc] initWithObjects:&value count:1];
    [self willChangeValueForKey:@"games" withSetMutation:NSKeyValueUnionSetMutation usingObjects:changedObjects];
    [[self primitiveValueForKey:@"games"] addObject:value];
    [self didChangeValueForKey:@"games" withSetMutation:NSKeyValueUnionSetMutation usingObjects:changedObjects];
    [changedObjects release];
}

- (void)removeGamesObject:(Game *)value {
    NSSet *changedObjects = [[NSSet alloc] initWithObjects:&value count:1];
    [self willChangeValueForKey:@"games" withSetMutation:NSKeyValueMinusSetMutation usingObjects:changedObjects];
    [[self primitiveValueForKey:@"games"] removeObject:value];
    [self didChangeValueForKey:@"games" withSetMutation:NSKeyValueMinusSetMutation usingObjects:changedObjects];
    [changedObjects release];
}

- (void)addGames:(NSSet *)value {    
    [self willChangeValueForKey:@"games" withSetMutation:NSKeyValueUnionSetMutation usingObjects:value];
    [[self primitiveValueForKey:@"games"] unionSet:value];
    [self didChangeValueForKey:@"games" withSetMutation:NSKeyValueUnionSetMutation usingObjects:value];
}

- (void)removeGames:(NSSet *)value {
    [self willChangeValueForKey:@"games" withSetMutation:NSKeyValueMinusSetMutation usingObjects:value];
    [[self primitiveValueForKey:@"games"] minusSet:value];
    [self didChangeValueForKey:@"games" withSetMutation:NSKeyValueMinusSetMutation usingObjects:value];
}


@end
