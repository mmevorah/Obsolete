//
//  ProductTableDataSource.h
//  EditApp
//
//  Created by Mark Mevorah on 7/25/12.
//  Copyright (c) 2012 University of Michigan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Product.h"
@interface ProductTableDataSource : NSObject <UITableViewDataSource>
{
    NSArray *products;
}

-(void)setProducts:(NSArray *)newProducts;
- (Product *)productForIndexPath:(NSIndexPath *)indexPath;

@end