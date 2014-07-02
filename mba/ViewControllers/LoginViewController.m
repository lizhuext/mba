//
//  LoginViewController.m
//  mba
//
//  Created by Lad on 14-6-13.
//
//

#import "LoginViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface LoginViewController ()

@end

@implementation LoginViewController

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
    [btnLogin.layer setCornerRadius:5.0f];
    btnLogin.layer.masksToBounds = YES;
    UIImage *imgBg = [[UIImage imageNamed:@"login_bg"] stretchableImageWithLeftCapWidth:5 topCapHeight:0];
    [imgvBg setImage:imgBg];
}



-(void)hiddenKeyboard
{
    [txtAccount resignFirstResponder];
    [txtPassword resignFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)switchChangedAction:(id)sender
{
    
}

- (IBAction)btnLoginAction:(id)sender
{
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)btnRegistAction:(id)sender {
    [self performSegueWithIdentifier:@"Regist1ViewController" sender:nil];
}

- (IBAction)btnForgetPasswordAction:(id)sender {
}
@end
