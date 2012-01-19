//
//  GameModel.m
//  mygames
//
//  Created by Vitor Navarro on 11/20/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "GameModel.h"


@implementation Game (Model)

+(NSArray *)findAllContainingText:(NSString *)value{
  NSString *search = [NSString stringWithFormat:@"(title CONTAINS[cd] \"%1$@\") OR (genre CONTAINS[cd] \"%1$@\") OR (publisher CONTAINS[cd] \"%1$@\")  OR (platform CONTAINS[cd] \"%1$@\") OR (developer CONTAINS[cd] \"%1$@\")",value];
  NSPredicate *predicate = [NSPredicate predicateWithFormat:search];
  NSLog(@"%@",predicate);
  
  NSArray *result = [Game findAllWithPredicate:predicate];
  
  NSSortDescriptor *sortDescriptor = [[[NSSortDescriptor alloc] initWithKey:@"title" ascending:YES] autorelease];
  NSArray *sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
  
  return [result sortedArrayUsingDescriptors:sortDescriptors];
}

@end
