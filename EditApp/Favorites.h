//
//  Favorites.h
//  EditApp
//
//  Created by Mark Mevorah on 7/20/12.
//  Copyright (c) 2012 University of Michigan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Product.h"

@interface Favorites : NSObject
{
    NSMutableArray *favoritesList;
}

@property(nonatomic)BOOL hidden;

-(id)init;
-(void)addProduct:(Product *)product;
-(void)removeProduct:(Product *)product;
-(double)count;

-(NSMutableArray*)favoritesList;

@end
