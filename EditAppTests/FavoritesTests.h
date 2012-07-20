//
//  FavoritesTests.h
//  EditApp
//
//  Created by Mark Mevorah on 7/20/12.
//  Copyright (c) 2012 University of Michigan. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>

@class EditManager;
@class MockIDManager;
@class Product;
@class Favorites;
@interface FavoritesTests : SenTestCase
{
    NSPersistentStoreCoordinator *coordinator;
    NSManagedObjectModel *model;
    NSManagedObjectContext *context;
    NSPersistentStore *store;
    
    EditManager *editManager;
    MockIDManager *idManager;
    Product *product;
    
    Favorites *favorites;
    
}
@end
