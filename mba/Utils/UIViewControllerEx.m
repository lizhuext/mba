//
//  UIViewController+UIViewControllerEx.m
//  mba
//
//  Created by Lad on 14-6-13.
//
//

#import "UIViewControllerEx.h"

@implementation UIViewController (UIViewControllerEx)

- (void)viewDidLoad
{
    self.view.backgroundColor = [UIColor colorFromHexRGB:@"f2f2f2"];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *imgBg = [UIImage imageNamed:@"nav_back"];
    button.frame = CGRectMake(5,5, 12, 22);
    [button setImage:imgBg forState:UIControlStateNormal];
    button.showsTouchWhenHighlighted = YES;
    [button addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *back = [[UIBarButtonItem alloc] initWithCustomView:button];
    self.navigationItem.leftBarButtonItem = back;
}

-(void)backAction
{
    if ([self.parentViewController.presentedViewController isEqual:self] || [self.parentViewController.presentingViewController isEqual:self.navigationController]){
        
        [self dismissViewControllerAnimated:YES completion:^{
            
        }];
        
    } else{
        [self.navigationController popViewControllerAnimated:YES];
    }
}

-(void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset
{
    if([scrollView isKindOfClass:[UITableView class]]){
        BOOL hidden = velocity.y < 0 ? NO:YES;
        [self.navigationController setNavigationBarHidden:hidden animated:YES];
        [self.tabBarController.tabBar setHidden:hidden];
    }
}

@end
