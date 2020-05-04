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

@interface NSObject ()
+ (void)swizzleSelector:(SEL)aSelector onClass:(Class)aClass withBlock:(void (^)(id, SEL, id, id))aBlock named:(NSString *)aName;
@end

@implementation ViewController

- (IBAction)pushSuper:(id)sender
{
	UITableViewController *controller = [SuperTableViewController new];
	controller.title = @"Super";
	void (^block)(id, SEL, id, id) = ^(id target, SEL command, UITableView *tableView, NSIndexPath *indexPath) {
		NSLog(@"super swizzling");
	};
	[NSClassFromString(@"FBSDKSwizzler") swizzleSelector:@selector(tableView:didSelectRowAtIndexPath:) onClass:[SuperTableViewController class] withBlock:block named:@"super"];
	[self.navigationController pushViewController:controller animated:YES];
}

- (IBAction)pushChild:(id)sender
{
	UITableViewController *controller = [ChlidTableViewController new];
	controller.title = @"Child";
	void (^block)(id, SEL, id, id) = ^(id target, SEL command, UITableView *tableView, NSIndexPath *indexPath) {
		NSLog(@"child swizzling");
	};
	[NSClassFromString(@"FBSDKSwizzler") swizzleSelector:@selector(tableView:didSelectRowAtIndexPath:) onClass:[ChlidTableViewController class] withBlock:block named:@"child"];
	[self.navigationController pushViewController:controller animated:YES];
}

@end
