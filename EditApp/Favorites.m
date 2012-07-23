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

-(id)initWithPos:(int)pos
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
    if(self.count < 25)
    {
        [favoritesList addObject:product];
    }
}

-(void)removeProduct:(Product *)product
{
    [favoritesList removeObject:product];
}

-(int)count
{
    return favoritesList.count;
}

-(NSMutableArray *)favoritesList
{
    return favoritesList;
}

@end
