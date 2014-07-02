//
//  Regist1ViewController.m
//  mba
//
//  Created by Lad on 14-6-13.
//
//

#import "Regist1ViewController.h"

@interface Regist1ViewController ()

@end

@implementation Regist1ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UITapGestureRecognizer *oneTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hiddenKeyboard)];
    oneTap.delegate =  self;
    [self.view addGestureRecognizer:oneTap];
    [btnNext.layer setCornerRadius:5.0f];
    btnNext.layer.masksToBounds = YES;
    UIImage *imgBg = [[UIImage imageNamed:@"regist_bg"] stretchableImageWithLeftCapWidth:5 topCapHeight:0];
    [imgvBg setImage:imgBg];
}

-(void)hiddenKeyboard
{
    [txtPhoneNum resignFirstResponder];
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



- (IBAction)btnNextAction:(id)sender
{
    [self performSegueWithIdentifier:@"VarCodeViewController" sender:nil];
}
@end
