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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)onBtnRegistAction:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
