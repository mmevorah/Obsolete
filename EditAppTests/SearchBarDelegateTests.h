//
//  SearchBarDelegateTests.h
//  EditApp
//
//  Created by Mark Mevorah on 7/26/12.
//  Copyright (c) 2012 University of Michigan. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>

@class ProductFactory;
@class Product;

@interface SearchBarDelegateTests : SenTestCase
{
    NSPersistentStoreCoordinator *coordinator;
    NSManagedObjectModel *model;
    NSManagedObjectContext *context;
    NSPersistentStore *store;
    
    ProductFactory *factory;
    Product *product1;
    Product *product2;
    Product *product3;
    Product *product4;
    Product *product5;
    
    NSArray *productArray;
    
}
@end
