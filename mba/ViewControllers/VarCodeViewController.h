//
//  VarCodeViewController.h
//  mba
//
//  Created by archermind on 14-7-2.
//
//

#import "BaseViewController.h"

@interface VarCodeViewController : BaseViewController{
    
    __weak IBOutlet UILabel *lblTip;
    __weak IBOutlet UIImageView *imgvBg;
    __weak IBOutlet UITextField *txtVarCode;
    __weak IBOutlet UIButton *btnGetVarCode;
    __weak IBOutlet UIButton *btnNext;
    int count;
    NSTimer *timer;
}
- (IBAction)btnGetVarCodeAction:(id)sender;
- (IBAction)btnNextAction:(id)sender;

@end
