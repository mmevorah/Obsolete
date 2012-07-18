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
#import "IDManager.h"
#import "AppDelegate.h"


@implementation EditManager

@synthesize productFactory;
@synthesize variationFactory;
@synthesize idManager;
@synthesize context;

-(id)initWithManagedObjectContext:(NSManagedObjectContext *)setContext andIDManager:(IDManager *)setIDManaged
{
    if(self = [super init])
    {
        productFactory = [[ProductFactory alloc] init];
        variationFactory = [[VariationFactory alloc] init];
        productFactory.context = setContext;
        variationFactory.context = setContext;
    
        context = setContext;
        idManager = setIDManaged;
        
    }
    return self;    
}

-(Product*)createProductWithAName:(NSString *)name anImage:(UIImage*)image andAPrice:(NSNumber *)price
{
    Product *newProduct = [productFactory createProductWithTheName:name theImage:image];
    Variation *newVariation = [variationFactory createVariationWithTheName:@"Regular" thePrice:price andIsItTheMaster:YES];
    
    newProduct.iD = [idManager nextAvailableProductID];
    newVariation.iD = [idManager nextAvailableVariantID];
    [idManager incrementTempProductIDCount];
    [idManager incrementTempVariantIDCount];
    
    [newProduct addVariationObject:newVariation];
    
    return newProduct;
}

-(void)addVariationToProduct:(Product *)product withName:(NSString *)name andPrice:(NSNumber *)price
{
    Variation *newVariation = [variationFactory createVariationWithTheName:name thePrice:price andIsItTheMaster:NO];
    newVariation.iD = [idManager nextAvailableVariantID];
    [idManager incrementTempVariantIDCount];
    
    [product addVariationObject:newVariation];
}

-(void)deleteProduct:(Product *)product
{
    [context deleteObject:product];
}

-(void)deleteVariation:(Variation *)variation inProduct:(Product *)product
{
    NSArray *array = [self arrangeVariants:product.variation];          //have a sorted array
    if((product.variation.count - 1) != 0)
    {
        if([variation.master boolValue] == YES)
        {
            Variation *aVariation = [array objectAtIndex:1];
            aVariation.master = [NSNumber numberWithBool: YES];
            NSLog(@"aVariation is: %@", aVariation.master);
        }
        [product removeVariationObject:variation];
        [context deleteObject:variation];
    }
}

-(NSArray *)arrangeVariants:(NSSet *)set
{
    NSMutableArray *arranged = [[NSMutableArray alloc] initWithArray:set.allObjects];
    NSSortDescriptor *descriptor = [[NSSortDescriptor alloc] initWithKey:@"iD" ascending:YES];
    [arranged sortUsingDescriptors:[NSArray arrayWithObjects:descriptor, nil]];
    return arranged;
}

-(void)changeProduct:(Product *)product nameTo:(NSString *)name
{
    product.name = name;
}

-(void)changeProduct:(Product *)product imageTo:(UIImage *)image
{
    product.image = image;
}

-(void)changeVariation:(Variation *)variation nameTo:(NSString *)name
{
    variation.name = name;
}

-(void)changeVariation:(Variation *)variation priceTo:(NSNumber *)price
{
    variation.price = price;
}

-(void)saveContext
{
    AppDelegate *theDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    [theDelegate saveContext];
    [idManager saveIDS];
}

-(void)cancelContext
{
    [context rollback];
    
}


@end
