//
//  FavoritesTests.m
//  EditApp
//
//  Created by Mark Mevorah on 7/20/12.
//  Copyright (c) 2012 University of Michigan. All rights reserved.
//

#import "FavoritesTests.h"
#import "Favorites.h"
#import "Product.h"
#import "EditManager.h"
#import "MockIDManager.h"

@implementation FavoritesTests

-(void)setUp
{
    model = [NSManagedObjectModel mergedModelFromBundles:nil];
    coordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:model];
    store = [coordinator addPersistentStoreWithType:NSInMemoryStoreType configuration:nil URL:nil options:nil error:NULL];
    context = [[NSManagedObjectContext alloc] init ];
    [context setPersistentStoreCoordinator:coordinator];
    
    idManager = [[MockIDManager alloc] init];
    editManager = [[EditManager alloc] initWithManagedObjectContext:context andIDManager:idManager];
    product = [editManager createProductWithAName:@"Shirt" anImage:nil andAPrice:[NSNumber numberWithDouble: 3.50]];
    
    favorites = [[Favorites alloc] init];
}

-(void)testFavoritesObjectExists
{
    STAssertNotNil(favorites, @"Favorites should be able to be created");
}

-(void)testCanAddProductsToFavorites
{
    [favorites addProduct: product];
    STAssertTrue(favorites.count > 0, @"Should be able to add products to favorites");
}

-(void)testCanRemoveProductsFromFavorites
{
    [favorites addProduct:product];
    [favorites removeProduct: product];
    
    STAssertFalse([favorites.favoritesList containsObject:product], @"Should be able to remove product from favorites list");
    
}

-(void)testFavoritesIsHiddenByDefault
{
    STAssertEquals([NSNumber numberWithBool: favorites.hidden], [NSNumber numberWithBool: TRUE], @"Favorites should be by default hidde");
}



@end
