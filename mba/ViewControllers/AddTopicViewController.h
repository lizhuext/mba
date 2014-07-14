//
//  AddTopicViewController.h
//  mba
//
//  Created by archermind on 14-7-4.
//
//

#import "BaseViewController.h"

@interface AddTopicViewController : BaseViewController{
    
    __weak IBOutlet UITextView *txtInput;
    __weak IBOutlet UILabel *lblTag1;
    __weak IBOutlet UILabel *lblTag2;
    __weak IBOutlet UILabel *lblTag3;
    __weak IBOutlet UIButton *btnKeyboardSwitch;
    
}
- (IBAction)btnAddTagAction:(id)sender;
- (IBAction)btnSaveAction:(id)sender;

@end
