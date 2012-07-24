//
//  EditViewControllerTests.m
//  EditApp
//
//  Created by Mark Mevorah on 7/24/12.
//  Copyright (c) 2012 University of Michigan. All rights reserved.
//

#import "EditViewControllerTests.h"
#import "EditViewController.h"
#import <objc/runtime.h>                    // need this to check properties
#import "EmptyTableViewDataSource.h"
#import "EmptyTableViewDelegate.h"

@implementation EditViewControllerTests
{
    EditViewController *editViewController;
    UITableView *tableView;
}

-(void)setUp
{
    editViewController = [[EditViewController alloc] init];
    tableView = [[UITableView alloc] init];
    editViewController.tableView = tableView;
}

-(void)tearDown
{
    editViewController = nil;
    tableView = nil;
}

-(void)testViewControllerHasATableViewProperty
{
    objc_property_t tableViewProperty = class_getProperty([editViewController class], "tableView"); //for runtime checking
    STAssertTrue(tableViewProperty != NULL, @"EditViewController needs a table property");
}

-(void)testViewControllerHasADataSourceProperty
{
    objc_property_t dataSourceProperty = class_getProperty([editViewController class], "dataSource");
    STAssertTrue(dataSourceProperty != NULL, @"EditViewController needs a data source");
}

-(void)testViewControllerHasATableViewDelegateProperty
{
    objc_property_t delegateProperty = class_getProperty([editViewController class], "tableViewDelegate");
    STAssertTrue(delegateProperty != NULL, @"EditViewController needs a table view delegate");
}

-(void)testViewControllerConnectsDataSourceInViewDidLoad
{
    id<UITableViewDataSource> dataSource = [[EmptyTableViewDataSource alloc] init];
    editViewController.dataSource = dataSource;
    [editViewController viewDidLoad];
    STAssertEqualObjects([tableView dataSource], dataSource, @"EditViewController should have set the table view's data source");
}

-(void)testViewControllerConnectsDelegateInViewDidLoad
{
    id<UITableViewDelegate> delegate = [[EmptyTableViewDelegate alloc] init];
    editViewController.tableViewDelegate = delegate;
    [editViewController viewDidLoad];
    STAssertEqualObjects([tableView delegate], delegate, @"EditViewController should have set the table view's delegate");
}


@end
