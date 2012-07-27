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
#import "ProductTableDataSource.h"
#import "SearchBarDelegate.h"

static const char *notificationKey = "EditViewControllerTestsAssociatedNotificationKey";
static const char *viewDidAppearKey = "EditViewControllerTestsViewDidAppearKey";
static const char *viewWillDisappearKey = "EditViewControllerTestsViewWillDisappearKey";

@implementation UIViewController (TestSuperClassCalled)

-(void)editViewControllerTests_viewDidAppear: (BOOL)animated
{
    NSNumber *parameter = [NSNumber numberWithBool:animated];
    objc_setAssociatedObject(self, viewDidAppearKey, parameter, OBJC_ASSOCIATION_RETAIN);
}

-(void)editViewControllerTests_viewWillDisappear: (BOOL)animated
{
    NSNumber *parameter = [NSNumber numberWithBool:animated];
    objc_setAssociatedObject(self, viewWillDisappearKey, parameter, OBJC_ASSOCIATION_RETAIN);
}

@end

@implementation EditViewController (TestNotificationDelivery)

-(void)editControllerTests_userDidSelectProductNotification: (NSNotification *)note
{
    objc_setAssociatedObject(self, notificationKey, note, OBJC_ASSOCIATION_RETAIN);
}

@end

@implementation EditViewControllerTests
{
    EditViewController *editViewController;
    UINavigationController *navController;
    
    UITableView *tableView;
    id<UITableViewDelegate, UITableViewDataSource> dataSource;
    UISearchBar *searchBar;
    id<UISearchBarDelegate> searchBarDelegate;
    
    SEL realViewDidAppear, testViewDidAppear;
    SEL realViewWillDisappear, testViewWillDisappear;
    SEL realUserDidSelectProduct, testUserDidSelectProduct;
}

+(void)swapInstanceMethodsForClass:(Class) cls selector: (SEL)sel1 andSelector: (SEL)sel2
{
    Method method1 = class_getInstanceMethod(cls, sel1);
    Method method2 = class_getInstanceMethod(cls, sel2);
    method_exchangeImplementations(method1, method2);
}

-(void)setUp
{
    editViewController = [[EditViewController alloc] init];
    navController = [[UINavigationController alloc] initWithRootViewController:editViewController];
    
    tableView = [[UITableView alloc] init];
    editViewController.tableView = tableView;
    dataSource = [[ProductTableDataSource alloc] init];
    editViewController.dataSource = dataSource;
    
    searchBar = [[UISearchBar alloc] init];
    editViewController.searchBar = searchBar;
    searchBarDelegate = [[SearchBarDelegate alloc] init];
    editViewController.searchBarDelegate = searchBarDelegate;
    
    objc_removeAssociatedObjects(editViewController);
    realViewDidAppear = @selector(viewDidAppear:);
    testViewDidAppear = @selector(editViewControllerTests_viewDidAppear:);
    [EditViewControllerTests swapInstanceMethodsForClass:[UIViewController class]
                                                selector:realViewDidAppear
                                             andSelector:testViewDidAppear];
    realViewWillDisappear = @selector(viewWillDisappear:);
    testViewWillDisappear = @selector(editViewControllerTests_viewWillDisappear:);
    [EditViewControllerTests swapInstanceMethodsForClass:[UIViewController class]
                                            selector:realViewWillDisappear
                                        andSelector:testViewWillDisappear];
    
    realUserDidSelectProduct = @selector(userDidSelectProductNotification:);
    testUserDidSelectProduct = @selector(editControllerTests_userDidSelectProductNotification:);
}

-(void)tearDown
{
    objc_removeAssociatedObjects(editViewController);

    editViewController = nil;
    navController = nil;
    tableView = nil;
    dataSource = nil;
    
    [EditViewControllerTests swapInstanceMethodsForClass:[UIViewController class]
                                                selector:realViewDidAppear
                                            andSelector:testViewDidAppear];
    [EditViewControllerTests swapInstanceMethodsForClass:[UIViewController class]
                                                selector:realViewWillDisappear
                                             andSelector:testViewWillDisappear];
    
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

-(void)testViewControllerConnectsDataSourceInViewDidLoad
{
    [editViewController viewDidLoad];
    STAssertEqualObjects([tableView dataSource], dataSource, @"EditViewController should have set the table view's data source");
}

-(void)testViewControllerConnectsTableDelegateInViewDidLoad
{
    [editViewController viewDidLoad];
    STAssertEqualObjects([tableView delegate], dataSource, @"EditViewController should have set the table view's delegate");
}

-(void)testViewControllerHasASearchBarProperty
{
    objc_property_t searchBarProperty = class_getProperty([editViewController class], "searchBar");
    STAssertTrue(searchBarProperty != NULL, @"EditViewController needs a search bar property");
}

-(void)testViewControllerHasASearchBarDelegate
{
    objc_property_t searchBarDelegateProperty = class_getProperty([editViewController class], "searchBarDelegate");
    STAssertTrue(searchBarDelegateProperty != NULL, @"EditViewController needs a search bar delegate");
}

-(void)testViewControllerConnectsSearchBarDelegateInViewDidLoad
{
    [editViewController viewDidLoad];
    STAssertEqualObjects([searchBar delegate], searchBarDelegate, @"EditViewController should have set the searchBar's delegate");
}

-(void)testDefaultStateOfViewControllerDoesNotReceiveNotifications
{
    [EditViewControllerTests swapInstanceMethodsForClass:[EditViewController class]
                                            selector:realUserDidSelectProduct
                                        andSelector:testUserDidSelectProduct];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:ProductTableDidSelectProductNotification object:nil userInfo:nil];
    STAssertNil(objc_getAssociatedObject(editViewController, notificationKey), @"Notificaiton should not be received before -viewDidAppear:");
    [EditViewControllerTests swapInstanceMethodsForClass:[EditViewController class]
                                                selector:realUserDidSelectProduct
                                             andSelector:testUserDidSelectProduct];
}

-(void)testViewControllerReceivesTableSelectionNotificationAfterViewDidAppear
{
    [EditViewControllerTests swapInstanceMethodsForClass:[EditViewController class]
                                            selector:realUserDidSelectProduct
                                        andSelector:testUserDidSelectProduct];
    
    [editViewController viewDidAppear:NO];
    [[NSNotificationCenter defaultCenter] postNotificationName:ProductTableDidSelectProductNotification object:nil userInfo:nil];
    STAssertNotNil(objc_getAssociatedObject(editViewController, notificationKey), @"After -viewDidAppear: the view controller should handle selection notifications");
    
    [EditViewControllerTests swapInstanceMethodsForClass:[EditViewController class]
                                            selector:realUserDidSelectProduct
                                        andSelector:testUserDidSelectProduct];
}

-(void)testViewControllerDoesNotReceiveTableSelestNotificationAfterViewWillDisappear
{
    [EditViewControllerTests swapInstanceMethodsForClass:[EditViewController class] selector:realUserDidSelectProduct andSelector:testUserDidSelectProduct];
    
    [editViewController viewDidAppear:NO];
    [editViewController viewWillDisappear:NO];
    [[NSNotificationCenter defaultCenter] postNotificationName:ProductTableDidSelectProductNotification object:nil userInfo:nil];
    STAssertNil(objc_getAssociatedObject(editViewController, notificationKey), @"After -viewWillDisappear: is called, the vew controller should no longer respond to topic selection notifications");
    
    [EditViewControllerTests swapInstanceMethodsForClass:[EditViewController class]
                                                selector:realUserDidSelectProduct
                                             andSelector:testUserDidSelectProduct];
}

-(void)testViewControllerCallsSuperviewDidAppear
{
    [editViewController viewDidAppear:NO];
    STAssertNotNil(objc_getAssociatedObject(editViewController, viewDidAppearKey), @"-viewDidAppear: should call through to superclass implementation");
}

-(void)testViewControllerCallsSuperViewWillDisappear
{
    [editViewController viewWillDisappear:NO];
    STAssertNotNil(objc_getAssociatedObject(editViewController, viewWillDisappearKey), @"-viewWillDisappear: should call through to superclass implementation");
}

-(void)testSelectingProductPushesNewViewController
{
    [editViewController userDidSelectProductNotification: nil];
    UIViewController *currentTopVc = navController.topViewController;
    STAssertFalse([currentTopVc isEqual:editViewController], @"New view controller should be pushed onto the stack");
    STAssertTrue([currentTopVc isKindOfClass:[EditViewController class]], @"New view controller should be a EditViewController");
}

@end
