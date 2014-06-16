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
    __weak IBOutlet UITextField *txtVarCode;
    __weak IBOutlet UIButton *btnNext;
    __weak IBOutlet UIButton *btnGetVarCode;
    int count;
}

- (IBAction)btnGetVarCodeAction:(id)sender;
- (IBAction)btnNextAction:(id)sender;

@end
