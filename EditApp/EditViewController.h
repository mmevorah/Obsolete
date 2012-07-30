//
//  EditViewController.h
//  EditApp
//
//  Created by Mark Mevorah on 7/24/12.
//  Copyright (c) 2012 University of Michigan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EditViewController : UIViewController

@property(strong) UITableView *tableView;
<<<<<<< HEAD
@property(strong) id<UITableViewDataSource, UITableViewDelegate> dataSource;

@property(strong) UISearchBar *searchBar;
@property(strong) id<UISearchBarDelegate> searchBarDelegate;

-(void)userDidSelectProductNotification: (NSNotification *)note;
=======
@property(strong) id<UITableViewDataSource> dataSource;
@property(strong) id<UITableViewDelegate> tableViewDelegate;
>>>>>>> parent of 0b985c6... Working State

@end
