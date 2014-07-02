//
//  Regist1ViewController.h
//  mba
//
//  Created by Lad on 14-6-13.
//
//

#import <UIKit/UIKit.h>

@interface Regist1ViewController : BaseViewController{
    
    __weak IBOutlet UITextField *txtPhoneNum;
    __weak IBOutlet UIButton *btnNext;
    __weak IBOutlet UIImageView *imgvBg;
}

- (IBAction)btnNextAction:(id)sender;

@end
