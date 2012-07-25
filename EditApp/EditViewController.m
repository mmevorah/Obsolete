//
//  EditViewController.m
//  EditApp
//
//  Created by Mark Mevorah on 7/24/12.
//  Copyright (c) 2012 University of Michigan. All rights reserved.
//

#import "EditViewController.h"
#import "ProductTableDelegate.h"
#import "ProductTableDataSource.h"

@interface EditViewController ()

@end

@implementation EditViewController

@synthesize tableView;
@synthesize dataSource;
@synthesize tableViewDelegate;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.tableViewDelegate.tableDataSource = self.dataSource;
    self.tableView.delegate = self.tableViewDelegate;
    self.tableView.dataSource = self.dataSource;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

@end
