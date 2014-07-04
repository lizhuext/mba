//
//  AddTopicViewController.m
//  mba
//
//  Created by archermind on 14-7-4.
//
//

#import "AddTopicViewController.h"
#import "WUDemoKeyboardBuilder.h"

@interface AddTopicViewController ()

@end

@implementation AddTopicViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    if (txtInput.isFirstResponder) {
        if (txtInput.emoticonsKeyboard) [txtInput switchToDefaultKeyboard];
        else [txtInput switchToEmoticonsKeyboard:[WUDemoKeyboardBuilder sharedEmoticonsKeyboard]];
    }else{
        [txtInput switchToEmoticonsKeyboard:[WUDemoKeyboardBuilder sharedEmoticonsKeyboard]];
        [txtInput becomeFirstResponder];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
