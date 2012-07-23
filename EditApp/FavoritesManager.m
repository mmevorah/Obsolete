//
//  FavoritesManager.m
//  EditApp
//
//  Created by Mark Mevorah on 7/23/12.
//  Copyright (c) 2012 University of Michigan. All rights reserved.
//

#import "FavoritesManager.h"
#import "FavoriteList.h"
@implementation FavoritesManager

@synthesize favList0, favList1, favList2, favList3, favList4;

-(id)init
{
    NSLog(@"THIS SHOULD NOT RUN!!!!!!!!!!!!!!!");
    if(self = [super init])
    {
        
    }
    return self;
}

-(void)insertProductWithID:(NSNumber*)productID intoFavoritesList:(int)favList atPosition:(int)pos
{
    if(favList == 0)
    {
        [favList0 addProductWithID:productID toPosition:pos];
    }else if (favList == 1)
    {
        [favList1 addProductWithID:productID toPosition:pos];
    }else if (favList == 2)
    {
        [favList2 addProductWithID:productID toPosition:pos];
    }else if (favList == 3)
    {
        [favList3 addProductWithID:productID toPosition:pos];
    }else if (favList == 4)
    {
        [favList4 addProductWithID:productID toPosition:pos];
    }
}

-(void)removeProductFromList:(int)favList atPostion:(int)pos
{
    if(favList == 0)
    {
        [favList0 clearProductAtPosition:pos];
    }else if (favList == 1)
    {
        [favList1 clearProductAtPosition:pos];
    }else if (favList == 2)
    {
        [favList2 clearProductAtPosition:pos];
    }else if (favList == 3)
    {
        [favList3 clearProductAtPosition:pos];
    }else if (favList == 4)
    {
        [favList4 clearProductAtPosition:pos];
    }
}


@end
