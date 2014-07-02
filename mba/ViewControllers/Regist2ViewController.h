//
//  Regist2ViewController.h
//  mba
//
//  Created by Lad on 14-6-13.
//
//

#import "BaseViewController.h"

@interface Regist2ViewController : BaseViewController{
    __weak IBOutlet UIImageView *imgvBg;
    __weak IBOutlet UITextField *txtPassword1;
    __weak IBOutlet UITextField *txtPassword2;
    __weak IBOutlet UIButton *btnRegist;
    
}

- (IBAction)onBtnRegistAction:(id)sender;

@end
