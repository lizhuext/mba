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

@implementation AddTopicViewController{
    NSMutableArray *selectTagKeys;
}

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
    [txtInput switchToDefaultKeyboard];
    [txtInput becomeFirstResponder];
    selectTagKeys = [NSMutableArray arrayWithCapacity:0];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)btnAddTagAction:(id)sender {
    if(!txtInput.emoticonsKeyboard){
        [txtInput switchToEmoticonsKeyboard:[WUDemoKeyboardBuilder sharedEmoticonsKeyboard]];
        NSDictionary *textKeys = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"EmotionTextKeys" ofType:@"plist"]];
        [txtInput.emoticonsKeyboard setKeyPressBlock:^(NSString *key) {
            if([selectTagKeys containsObject:key]){
                [selectTagKeys removeObject:key];
            }
            else{
                if(selectTagKeys.count>=3){
                    [self.view toast:@"最多只能添加3个标签"];
                    return;
                }
                [selectTagKeys addObject:key];
            }
            lblTag1.text = @"";
            lblTag2.text = @"";
            lblTag3.text = @"";
            for (int i=1000; i<1000+selectTagKeys.count; i++) {
                UILabel *lbl = (UILabel *)[self.view viewWithTag:i];
                lbl.text = [textKeys objectForKey:[selectTagKeys objectAtIndex:(i-1000)]];
            }
        }];

    }
    else{
        [txtInput switchToDefaultKeyboard];
    }
}

- (IBAction)btnSaveAction:(id)sender {
    
    [self.navigationController popToRootViewControllerAnimated:YES];
}
@end
