//
//  ProductFactoryTests.h
//  EditApp
//
//  Created by Mark Mevorah on 7/16/12.
//  Copyright (c) 2012 University of Michigan. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>

@class ProductFactory;
@interface ProductFactoryTests : SenTestCase
{
    NSPersistentStoreCoordinator *coordinator;
    NSManagedObjectModel *model;
    NSManagedObjectContext *context;
    NSPersistentStore *store;
    
    ProductFactory *productFactory;
}
@end
