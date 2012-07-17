//
//  EditManager.h
//  EditApp
//
//  Created by Mark Mevorah on 7/17/12.
//  Copyright (c) 2012 University of Michigan. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Product;
@class Variation;
@class ProductFactory;
@class VariationFactory;

@interface EditManager : NSObject

@property(strong, nonatomic) ProductFactory *productFactory;
@property(strong, nonatomic) VariationFactory *variationFactory;


-(id)initWithManagedObjectContext:(NSManagedObjectContext*)context;
-(Product*)createProductWithAName:(NSString *)name anImage:(UIImage*)image andAPrice:(NSNumber *)price;



@end
