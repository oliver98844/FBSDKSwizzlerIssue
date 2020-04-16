//
//  ViewController.m
//  FBSDKSwizzlerIssue
//
//  Created by Oliver Huang on 2020/4/16.
//  Copyright © 2020 Oliver Huang. All rights reserved.
//

#import "ViewController.h"
#import "SuperTableViewController.h"
#import "ChlidTableViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (IBAction)pushSuper:(id)sender
{
	UITableViewController *controller = [SuperTableViewController new];
	controller.title = @"Super";
	[self.navigationController pushViewController:controller animated:YES];
}

- (IBAction)pushChild:(id)sender
{
	UITableViewController *controller = [ChlidTableViewController new];
	controller.title = @"Child";
	[self.navigationController pushViewController:controller animated:YES];
}

@end
