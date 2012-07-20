//
//  EditViewControllerTests.m
//  EditApp
//
//  Created by Mark Mevorah on 7/19/12.
//  Copyright (c) 2012 University of Michigan. All rights reserved.
//

#import "EditViewControllerTests.h"
#import "EditViewController.h"
#import "EmptyTableViewDelegate.h"
#import "ProductTableDataSource.h"
#import <objc/runtime.h>

@implementation EditViewControllerTests
{
    EditViewController *viewController;
    UITableView *tableView;
}

-(void)setUp
{
    viewController = [[EditViewController alloc] init];
    tableView = [[UITableView alloc] init ];
    viewController.tableView = tableView;
}

-(void)tearDown
{
    viewController = nil;
    tableView = nil;
}

-(void)testViewControllerConnectsDataSourceInViewDidLoad
{
    id<UITableViewDataSource> dataSource = [[ProductTableDataSource alloc] init ];
    viewController.dataSource = dataSource;
    [viewController viewDidLoad];
    STAssertEqualObjects([tableView dataSource], dataSource, @"View controller should have set the table view's data source");
}

-(void)testViewControllerConnectsDelegateInViewDidLoad
{
    id<UITableViewDelegate> delegate = [[EmptyTableViewDelegate alloc] init];
    viewController.tableViewDelegate = delegate;
    [viewController viewDidLoad];
    STAssertEqualObjects([tableView delegate], delegate, @"View controller should have set the table view's delegate");
}

-(void)testViewControllerHasATableViewProperty
{
    objc_property_t tableViewProperty = class_getProperty([viewController class], "tableView");
    STAssertTrue(tableViewProperty != NULL, @"EditViewController needs a table view");
}

-(void)testViewControllerHasADataSourceProperty
{
    objc_property_t dataSourceProperty = class_getProperty([viewController class], "dataSource");
    STAssertTrue(dataSourceProperty != NULL, @"View Controller needs a data source");
}

-(void)testViewControllerHasATableViewDelegateProperty
{
    objc_property_t delegateProperty = class_getProperty([viewController class], "tableViewDelegate");
    STAssertTrue(delegateProperty != NULL, @"View Controller needs a table view delegate");
}


@end
