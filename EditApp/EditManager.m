//
//  EditManager.m
//  EditApp
//
//  Created by Mark Mevorah on 7/17/12.
//  Copyright (c) 2012 University of Michigan. All rights reserved.
//

#import "EditManager.h"
#import "ProductFactory.h"
#import "VariationFactory.h"
#import "Product.h"
#import "Variation.h"
@implementation EditManager

@synthesize productFactory;
@synthesize variationFactory;

-(id)initWithManagedObjectContext:(NSManagedObjectContext *)context
{
    productFactory = [[ProductFactory alloc] init];
    variationFactory = [[VariationFactory alloc] init];
    productFactory.context = context;
    variationFactory.context = context;
    return self;    
}

-(Product*)createProductWithAName:(NSString *)name anImage:(UIImage*)image andAPrice:(NSNumber *)price
{
    Product *newProduct = [productFactory createProductWithTheName:name theImage:image];
    Variation *newVariation = [variationFactory createVariationWithTheName:@"Regular" thePrice:price andIsItTheMaster:YES];
    
    [newProduct addVariationObject:newVariation];
    
    return newProduct;
}

@end
