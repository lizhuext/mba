//
//  AMAlertView.m
//  SmartEast
//
//  Created by archermind on 14-5-29.
//  Copyright (c) 2014年 archermind. All rights reserved.
//

#import "AMAlertView.h"

@implementation AMAlertView

- (id)init
{
    self = [super init];
    if (self) {
        self.delegate = self;
    }
    return self;
}

-(id)initWithTitle:(NSString *)title message:(NSString *)message cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitle:(NSString *)otherButtonTitle
{
    self = [super initWithTitle:title
                 message:message
                delegate:self
       cancelButtonTitle:cancelButtonTitle
       otherButtonTitles:otherButtonTitle, nil];
    return self;
}

-(void)showWithBlock:(void (^)(AMAlertView *alert))cblock otherButtonBlock:(void (^)(AMAlertView *alert))oblock
{
    _cblock = cblock;
    _oblock = oblock;
    [self show];
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(buttonIndex == 0){
        if(_cblock){
            _cblock(self);
        }
    }
    else if(buttonIndex == 1){
        if(_oblock){
            _oblock(self);
        }
    }
}

@end
