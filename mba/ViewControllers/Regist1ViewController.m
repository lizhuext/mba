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
    count = 60;
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

- (IBAction)btnGetVarCodeAction:(id)sender
{
    btnGetVarCode.userInteractionEnabled = NO;
    [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(countDown:) userInfo:nil repeats:YES];
}

- (void)countDown:(NSTimer *)timer
{
    count--;
    NSString *title = [NSString stringWithFormat:@"重新获取%ds",count];
    [btnGetVarCode setTitle:title forState:UIControlStateNormal];
    if(count == 0){
        [timer invalidate];
        timer = nil;
        btnGetVarCode.userInteractionEnabled = YES;
        count = 60;
        [btnGetVarCode setTitle:@"获取验证码" forState:UIControlStateNormal];
    }
}

- (IBAction)btnNextAction:(id)sender
{
    
}
@end
