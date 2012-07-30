//
//  EditViewController.m
//  EditApp
//
//  Created by Mark Mevorah on 7/24/12.
//  Copyright (c) 2012 University of Michigan. All rights reserved.
//

#import "EditViewController.h"
<<<<<<< HEAD
#import "ProductTableDataSource.h"
=======
>>>>>>> parent of 0b985c6... Working State

@interface EditViewController ()

@end

@implementation EditViewController

@synthesize tableView;
@synthesize dataSource;
@synthesize searchBar;
@synthesize searchBarDelegate;

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
<<<<<<< HEAD
    self.tableView.delegate = self.dataSource;
    self.tableView.dataSource = self.dataSource;
    self.searchBar.delegate = self.searchBarDelegate;
=======
	// Do any additional setup after loading the view.
    self.tableView.dataSource  = self.dataSource;
    self.tableView.delegate = self.tableViewDelegate;
>>>>>>> parent of 0b985c6... Working State
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [[NSNotificationCenter defaultCenter]
     addObserver:self
     selector:@selector(userDidSelectProductNotification:)
     name:ProductTableDidSelectProductNotification
     object:nil];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [[NSNotificationCenter defaultCenter]
     removeObserver:self
     name:ProductTableDidSelectProductNotification
     object:nil];
}

-(void)userDidSelectProductNotification: (NSNotification *)note
{
    EditViewController *nextViewController = [[EditViewController alloc] init];
    [[self navigationController] pushViewController:nextViewController animated:YES];
}

@end
