//
//  SearchBarDelegateTests.m
//  EditApp
//
//  Created by Mark Mevorah on 7/26/12.
//  Copyright (c) 2012 University of Michigan. All rights reserved.
//

#import "SearchBarDelegateTests.h"
#import "ProductFactory.h"

@implementation SearchBarDelegateTests

-(void)setUp
{
    model = [NSManagedObjectModel mergedModelFromBundles:nil];
    coordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:model];
    store = [coordinator addPersistentStoreWithType:NSInMemoryStoreType configuration:nil URL:nil options:nil error:NULL];
    context = [[NSManagedObjectContext alloc] init ];
    [context setPersistentStoreCoordinator:coordinator];
    
    factory = [[ProductFactory alloc] init];
    factory.context = context;
    
    product1 = [factory createProductWithTheName:@"Apple" theImage:nil];
    product2 = [factory createProductWithTheName:@"Banana" theImage:nil];
    product3 = [factory createProductWithTheName:@"Cactus" theImage:nil];
    product4 = [factory createProductWithTheName:@"Grape" theImage:nil];
    product5 = [factory createProductWithTheName:@"Lemon" theImage:nil];
    
    productArray = [[NSArray alloc] initWithObjects:product1, product2, product3, product4, product5, nil];
}

-(void)tearDown
{
    model = nil;
    coordinator = nil;
    store = nil;
    context = nil;
}



@end
