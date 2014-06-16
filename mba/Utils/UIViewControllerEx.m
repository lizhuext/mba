//
//  UIViewController+UIViewControllerEx.m
//  mba
//
//  Created by Lad on 14-6-13.
//
//

#import "UIViewControllerEx.h"

@implementation UIViewController (UIViewControllerEx)


-(void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset
{
    if([scrollView isKindOfClass:[UITableView class]]){
        BOOL hidden = velocity.y < 0 ? NO:YES;
        [self.navigationController setNavigationBarHidden:hidden animated:YES];
        [self.tabBarController.tabBar setHidden:hidden];
    }
}

@end
