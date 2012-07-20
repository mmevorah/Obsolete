//
//  EmptyTableViewDataSource.m
//  EditApp
//
//  Created by Mark Mevorah on 7/19/12.
//  Copyright (c) 2012 University of Michigan. All rights reserved.
//

#import "ProductTableDataSource.h"

@implementation ProductTableDataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSParameterAssert(section == 0);
    return [products count];
}

NSString *productCellReuseIdentifier = @"Product";

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSParameterAssert([indexPath section] == 0);
    NSParameterAssert([indexPath row] < [products count]);
    UITableViewCell *productCell = [tableView dequeueReusableCellWithIdentifier:productCellReuseIdentifier ];
    if(!productCell)
    {
        productCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:productCellReuseIdentifier];
    }
    productCell.textLabel.text = [[products objectAtIndex:[indexPath row]] name];
    return productCell;
}

-(void)setTopics:(NSArray *)newProducts
{
    products = newProducts;
}

@end
