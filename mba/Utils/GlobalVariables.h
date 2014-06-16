//
//  GlobalVariables.h
//  mba
//
//  Created by Lad on 14-6-13.
//
//

#import <Foundation/Foundation.h>

#define AUTO_LOGIN_KEY @"com.mba.auto_login"

@interface GlobalVariables : NSObject

+(GlobalVariables *)shareInstance;
-(BOOL)isAutoLogin;
-(void)setAutoLogin:(BOOL)isAutoLogin;
@end
