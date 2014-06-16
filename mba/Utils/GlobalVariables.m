//
//  GlobalVariables.m
//  mba
//
//  Created by Lad on 14-6-13.
//
//

#import "GlobalVariables.h"

@implementation GlobalVariables
+(GlobalVariables *)shareInstance
{
    static GlobalVariables *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if(!instance){
            instance = [[self alloc] init];
        }
    });
    return instance;
}

-(BOOL)isAutoLogin
{
    BOOL isAutoLogin = [[NSUserDefaults standardUserDefaults] boolForKey:AUTO_LOGIN_KEY];
    return isAutoLogin;
}

-(void)setAutoLogin:(BOOL)isAutoLogin
{
    [[NSUserDefaults standardUserDefaults] setBool:isAutoLogin forKey:AUTO_LOGIN_KEY];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
@end
