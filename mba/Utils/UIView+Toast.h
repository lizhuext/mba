//
//  UIView+Toast.h
//  SmartEast
//
//  Created by Lad on 14-6-10.
//  Copyright (c) 2014年 archermind. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"

@interface UIView (Toast)
/**
 *	@brief	弹出底部的提示文字
 *
 *	@param 	str 需要弹出的字符串
 */
- (void)toast:(NSString *)str;

- (void)startLoading;
- (void)stopLoading;

@end
