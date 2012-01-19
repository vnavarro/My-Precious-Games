//
//  fixtureTests.m
//  bookgames
//
//  Created by Vitor Navarro on 11/20/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "fixtureTests.h"

@implementation fixtureTests

- (void)setUp
{
  [super setUp];
  
  // Set-up code here.
}

- (void)tearDown
{
  [Fixture truncateAll];
  [super tearDown];
}

// All code under test must be linked into the Unit Test bundle
- (void)testInsertGame
{
  [Fixture insertGames];
  NSInteger count = [Fixture gamesCount];  
  NSInteger expectedGames = 1;
  STAssertTrue(count = 1, @"Didn`t save games to core data, expected:%@, got: %@",expectedGames,count);
}

@end
