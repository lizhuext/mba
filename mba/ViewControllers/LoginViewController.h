//
//  LoginViewController.h
//  mba
//
//  Created by Lad on 14-6-13.
//
//

#import <UIKit/UIKit.h>

@interface LoginViewController : BaseViewController{
    
    __weak IBOutlet UITextField *txtAccount;
    __weak IBOutlet UITextField *txtPassword;
    __weak IBOutlet UISwitch *switchAutoLogin;
    __weak IBOutlet UIButton *btnLogin;
    __weak IBOutlet UIImageView *imgvBg;
}

- (IBAction)switchChangedAction:(id)sender;
- (IBAction)btnLoginAction:(id)sender;
- (IBAction)btnRegistAction:(id)sender;
- (IBAction)btnForgetPasswordAction:(id)sender;

@end
