//
//  EmptyTableViewDelegate.h
//  EditApp
//
//  Created by Mark Mevorah on 7/24/12.
//  Copyright (c) 2012 University of Michigan. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ProductTableDataSource;
@interface ProductTableDelegate : NSObject <UITableViewDelegate>

@property(strong) ProductTableDataSource *tableDataSource;

@end
