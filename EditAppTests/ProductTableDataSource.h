//
//  EmptyTableViewDataSource.h
//  EditApp
//
//  Created by Mark Mevorah on 7/19/12.
//  Copyright (c) 2012 University of Michigan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ProductTableDataSource : NSObject <UITableViewDataSource>
{
    NSArray *products;
}
-(void)setProducts:(NSArray *)newProducts;

@end
