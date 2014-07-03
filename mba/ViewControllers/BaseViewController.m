//
//  BaseViewController.m
//  mba
//
//  Created by Lad on 14-6-11.
//
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

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
    self.view.backgroundColor = [UIColor colorFromHexRGB:@"f2f2f2"];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *imgBg = [UIImage imageNamed:@"nav_back"];
    button.frame = CGRectMake(5,5, 12, 22);
    [button setImage:imgBg forState:UIControlStateNormal];
    button.showsTouchWhenHighlighted = YES;
    [button addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *back = [[UIBarButtonItem alloc] initWithCustomView:button];
    self.navigationItem.leftBarButtonItem = back;
}

-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    if([touch.view isKindOfClass:[UIControl class]]){
        return NO;
    }
    return YES;
}

-(void)backAction
{
    if ([self.parentViewController.presentedViewController isEqual:self] || self.parentViewController.presentingViewController){
        
        [self dismissViewControllerAnimated:YES completion:^{
           
        }];
        
    } else{
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

@end
