//
//  EditManagerTests.m
//  EditApp
//
//  Created by Mark Mevorah on 7/17/12.
//  Copyright (c) 2012 University of Michigan. All rights reserved.
//

#import "EditManagerTests.h"
#import "EditManager.h"
@implementation EditManagerTests

-(void)setUp
{
    model = [NSManagedObjectModel mergedModelFromBundles:nil];
    coordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:model];
    store = [coordinator addPersistentStoreWithType:NSInMemoryStoreType configuration:nil URL:nil options:nil error:NULL];
    context = [[NSManagedObjectContext alloc] init ];
    [context setPersistentStoreCoordinator:coordinator];
    
    editManager = [[EditManager alloc] initWithManagedObjectContext:context];
    product = [editManager createProductWithAName: @"Shirt" anImage: nil andAPrice: [NSNumber numberWithDouble:3.50]];
    
}

-(void)tearDown
{
    editManager = nil;
    
    context = nil;
    NSError *error = nil;
    STAssertTrue([coordinator removePersistentStore:store error:&error],@"couldn't remove persistent store: %@", error);
    store = nil;
    coordinator = nil;
    model = nil;
}

-(void)testEditManagerCreated
{
    STAssertNotNil(editManager, @"Edit manager should be successfully created");
}

-(void)testEditManageCanCreateAProduct
{    
    STAssertNotNil(product, @"Product should be able to be created from the editManager");
}

/*
 
 -(void)testProductCreatesAVariationWhenCreated
 {
 Product *newProduct = [productFactory createProductWithTheName:@"Shirt" theImage:nil andThePrice:3.5];
 STAssertTrue(newProduct.variation.count > 0, @"Creating a new product creates a new single variation as well");
 }
 
 -(void)testFirstCreatedVariationStartsWithRegularName
 {
 Product *newProduct = [productFactory createProductWithTheName:@"Shirt" theImage:nil andThePrice:3.50];
 STAssertEquals([[newProduct.variation.allObjects objectAtIndex: 0] name], @"Regular", @"First product variation should be named regular");
 }
 
 -(void)testProductSetsMasterAtCreation
 {
 Product *newProduct = [productFactory createProductWithTheName:@"Shirt" theImage:nil andThePrice:3.5];
 Important to add the "boolValue" to the end of each number below
 STAssertEquals([[[newProduct.variation.allObjects objectAtIndex:0] master] boolValue], [[NSNumber numberWithBool:YES] boolValue], @"A Product created should set the first variation to master");
 }
 
 -(void)testProductCanSetPrice
 {
 Product *newProduct = [productFactory createProductWithTheName:@"Shirt" theImage:nil andThePrice:3.5];
 STAssertEquals([[[newProduct.variation.allObjects objectAtIndex:0] price] doubleValue], [[NSNumber numberWithDouble:3.5] doubleValue], @"Product should be able to set the price of product");
 }
 
 -(void)testCanAccessProductPriceThroughMasterPriceMethod
 {
 Product *newProduct = [productFactory createProductWithTheName:@"Shirt" theImage:nil andThePrice:3.50];
 STAssertEquals([newProduct.masterPrice doubleValue], [[NSNumber numberWithDouble:3.50] doubleValue], @"Should be able to access the gneeral prce through master price method");
 }
 */

@end
