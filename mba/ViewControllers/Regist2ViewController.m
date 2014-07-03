//
//  Regist2ViewController.m
//  mba
//
//  Created by Lad on 14-6-13.
//
//

#import "Regist2ViewController.h"

@interface Regist2ViewController ()

@end

@implementation Regist2ViewController

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
    UITapGestureRecognizer *oneTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hiddenKeyboard)];
    oneTap.delegate =  self;
    [self.view addGestureRecognizer:oneTap];
    [btnRegist.layer setCornerRadius:5.0f];
    btnRegist.layer.masksToBounds = YES;
    UIImage *imgBg = [[UIImage imageNamed:@"login_bg"] stretchableImageWithLeftCapWidth:5 topCapHeight:0];
    [imgvBg setImage:imgBg];
    btnRegist.enabled = NO;
}

-(void)hiddenKeyboard
{
    [txtPassword1 resignFirstResponder];
    [txtPassword2 resignFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)onBtnRegistAction:(id)sender
{
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)btnCheckAction:(id)sender
{
    btnCheck.selected = !(btnCheck.selected);
    if(btnCheck.selected){
        btnRegist.enabled = YES;
    }
    else{
        btnRegist.enabled = NO;
    }
}

- (IBAction)btnPravicyAction:(id)sender
{
    
}

@end
