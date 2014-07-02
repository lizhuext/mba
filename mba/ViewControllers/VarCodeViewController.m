//
//  VarCodeViewController.m
//  mba
//
//  Created by archermind on 14-7-2.
//
//

#import "VarCodeViewController.h"

@interface VarCodeViewController ()

@end

@implementation VarCodeViewController

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
    count = 60;
    UITapGestureRecognizer *oneTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hiddenKeyboard)];
    oneTap.delegate =  self;
    [self.view addGestureRecognizer:oneTap];
    [btnNext.layer setCornerRadius:5.0f];
    btnNext.layer.masksToBounds = YES;
    UIImage *imgBg = [[UIImage imageNamed:@"regist_bg"] stretchableImageWithLeftCapWidth:5 topCapHeight:0];
    [imgvBg setImage:imgBg];
    [self beginTimer];
}

-(void)beginTimer
{
    if(timer){
        [timer invalidate];
        timer = nil;
    }
    btnGetVarCode.userInteractionEnabled = NO;
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(countDown) userInfo:nil repeats:YES];
}

- (IBAction)btnGetVarCodeAction:(id)sender
{
    [btnGetVarCode setTitle:@"重新发送(60)" forState:UIControlStateNormal];
    [self beginTimer];
}

- (void)countDown
{
    count--;
    NSString *title = [NSString stringWithFormat:@"重新发送(%d)",count];
    [btnGetVarCode setTitle:title forState:UIControlStateNormal];
    if(count == 0){
        [timer invalidate];
        timer = nil;
        btnGetVarCode.userInteractionEnabled = YES;
        count = 60;
        [btnGetVarCode setTitle:@"重新发送" forState:UIControlStateNormal];
    }
}

-(void)hiddenKeyboard
{
    [txtVarCode resignFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)btnNextAction:(id)sender {
    
    [self performSegueWithIdentifier:@"Regist2ViewController" sender:nil];
}
@end
