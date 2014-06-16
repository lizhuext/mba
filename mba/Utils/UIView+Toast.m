//
//  UIView+Toast.m
//  SmartEast
//
//  Created by Lad on 14-6-10.
//  Copyright (c) 2014年 archermind. All rights reserved.
//

#import "UIView+Toast.h"
#import "PGToast.h"

@implementation UIView (Toast)

- (void)toast:(NSString *)str
{
    if(str == nil || [str isEqualToString:@""])
    {
        return;
    }
    PGToast *toast = [PGToast makeToast:str];
    [toast show];
}

- (void)startLoading
{
    MBProgressHUD *progress = [MBProgressHUD HUDForView:self];
    if(!progress){
        progress = [[MBProgressHUD alloc] initWithView:self];
        progress.userInteractionEnabled = NO;
        [self addSubview:progress];
    }
    [progress show:YES];
}

- (void)stopLoading
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.01 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [MBProgressHUD hideAllHUDsForView:self animated:YES];
    });
}

@end
