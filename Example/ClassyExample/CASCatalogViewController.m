//
//  CASCatalogViewController.m
//  ClassyExample
//
//  Created by Jonas Budelmann on 21/10/13.
//  Copyright (c) 2013 Jonas Budelmann. All rights reserved.
//

#import "CASCatalogViewController.h"
#import "CASCatalogButtonsViewController.h"

static NSString * const CASRootCellReuseIdentifier = @"CASRootCellReuseIdentifier";

@interface CASCatalogViewController ()

@property (nonatomic, strong) NSArray *exampleControllers;
@end

@implementation CASCatalogViewController

- (id)init {
    self = [super init];
    if (!self) return nil;

    self.title = @"Catalog";

    self.exampleControllers = @[
                                CASCatalogButtonsViewController.new
                                ];
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    //self.view.backgroundColor = [UIColor greenColor];
    
    
    [self.tableView registerClass:UITableViewCell.class forCellReuseIdentifier:CASRootCellReuseIdentifier];
}

#pragma mark - UITableViewDataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UIViewController *viewController = self.exampleControllers[indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CASRootCellReuseIdentifier forIndexPath:indexPath];
    cell.textLabel.text = viewController.title;
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.exampleControllers.count;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UIViewController *viewController = self.exampleControllers[indexPath.row];
    [self.navigationController pushViewController:viewController animated:YES];
}

@end
