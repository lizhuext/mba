//
//  AMAlertView.h
//  SmartEast
//
//  Created by archermind on 14-5-29.
//  Copyright (c) 2014年 archermind. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^cancelBlock)(id alert);
typedef void(^otherBlock)(id alert);

@interface AMAlertView : UIAlertView<UIAlertViewDelegate>{
    cancelBlock _cblock;
    otherBlock _oblock;
}

-(void)showWithBlock:(void (^)(AMAlertView *alert))cblock otherButtonBlock:(void (^)(AMAlertView *alert))oblock;
-(id)initWithTitle:(NSString *)title message:(NSString *)message cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitle:(NSString *)otherButtonTitle;


@end
