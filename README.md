# FBSDKSwizzlerIssue
Test project to reproduce [FBSDKSwizzler issue](https://github.com/facebook/facebook-ios-sdk/issues/1318)

## Details
`FBSDKSuggestedEventsIndexer` may swizzles `tableView:didSelectRowAtIndexPath:` on all classes which are delegate of `UITableView`.

If both super class and child class implements `tableView:didSelectRowAtIndexPath:` and child class call super implementation, it may cause infinite call loop.

```
@implementation ChlidTableViewController

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
  // FBSDKSwizzler will call child's implementation and cause infinite loop
	[super tableView:tableView didSelectRowAtIndexPath:indexPath];
}

@end
```

## Step to reproduce

1. Pushes Super.
2. Pushes Child.
3. Taps any row.
