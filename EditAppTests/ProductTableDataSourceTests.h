//
//  ProductTableDataSourceTests.h
//  EditApp
//
//  Created by Mark Mevorah on 7/19/12.
//  Copyright (c) 2012 University of Michigan. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>

@class EditManager;
@class IDManager;

@interface ProductTableDataSourceTests : SenTestCase
{
    NSPersistentStoreCoordinator *coordinator;
    NSManagedObjectModel *model;
    NSManagedObjectContext *context;
    NSPersistentStore *store;
    
    EditManager *editManager;
    IDManager *idManager;
}
@end
