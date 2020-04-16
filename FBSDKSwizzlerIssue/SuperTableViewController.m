//
//  SuperTableViewController.m
//  FBSDKSwizzlerIssue
//
//  Created by Oliver Huang on 2020/4/16.
//  Copyright © 2020 Oliver Huang. All rights reserved.
//

#import "SuperTableViewController.h"

@interface SuperTableViewController ()

@end

@implementation SuperTableViewController

- (void)viewDidLoad
{
	[super viewDidLoad];
	[self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"ID"];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ID" forIndexPath:indexPath];
	cell.textLabel.text = indexPath.description;
	return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
	[tableView cellForRowAtIndexPath:indexPath].backgroundColor = @[UIColor.blueColor, UIColor.redColor, UIColor.greenColor][arc4random() % 3];
}

@end
