//
//  Favorites.m
//  EditApp
//
//  Created by Mark Mevorah on 7/20/12.
//  Copyright (c) 2012 University of Michigan. All rights reserved.
//

#import "Favorites.h"

@implementation Favorites
@synthesize hidden;

-(id)init
{
    if(self = [super init])
    {
        favoritesList = [[NSMutableArray alloc] init];
        hidden = TRUE;
    }
    return self;
}

-(void)addProduct:(Product *)product
{
    [favoritesList addObject:product];
}

-(void)removeProduct:(Product *)product
{
    [favoritesList removeObject:product];
}

-(double)count
{
    return favoritesList.count;
}

-(NSMutableArray *)favoritesList
{
    return favoritesList;
}

@end
