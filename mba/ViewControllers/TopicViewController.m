//
//  TopicViewController.m
//  mba
//
//  Created by Lad on 14-6-11.
//
//

#import "TopicViewController.h"
#import "LoginViewController.h"

@interface TopicViewController ()

@end

@implementation TopicViewController

- (void)viewDidLoad
{
    
    [super viewDidLoad];
    maskView = [[UIView alloc] initWithFrame:CGRectMake(0, 0,SCREEN_WIDTH ,SCREEN_HEIGHT)];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hiddenTopPopView)];
    [self initTopPopView];
    [maskView addGestureRecognizer:tap];
}

-(void)initTopPopView
{
    viewTopPop.layer.shadowOpacity = 0.1f;
    viewTopPop.layer.shadowOffset = CGSizeMake(0,2);
    viewTopPop.layer.shadowColor = [UIColor blackColor].CGColor;
    #if (defined(__IPHONE_7_0))
        [viewTopPop applyMotionEffects];
    #endif
}

-(void)viewWillAppear:(BOOL)animated
{
    [self hiddenTopPopView];
    
}

-(void)viewWillDisappear:(BOOL)animated
{
    [self hiddenTopPopView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

//-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"TopicCell";
    
    UITableViewCell *cell = [tableView
                             dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]
                initWithStyle:UITableViewCellStyleDefault
                reuseIdentifier:CellIdentifier];
    }
    
    return cell;
}



- (IBAction)btnMineAction:(id)sender {
    if(viewTopPop.bottom == 0){
        [self showTopPopView];
    }
    else{
        [self hiddenTopPopView];
    }
}

- (IBAction)btnReferMeAction:(id)sender
{
    [self performSegueWithIdentifier:@"ReferMeTableViewController" sender:nil];
}

- (IBAction)btnMyPubishAction:(id)sender
{

}

- (IBAction)btnMyParticipateAction:(id)sender
{
}

- (IBAction)btnMyCollectionAction:(id)sender
{
}


-(void)showTopPopView
{
    if(viewTopPop.bottom > 0){
        return;
    }
    else{
        CALayer *maskLayer = [CALayer layer];
        maskLayer.frame = self.view.bounds;
        maskLayer.backgroundColor = [UIColor blackColor].CGColor;
        [self.view.layer setMask:maskLayer];
        
        [UIView animateWithDuration:0.3f delay:0.0f options:UIViewAnimationOptionCurveEaseInOut|UIViewAnimationOptionAllowUserInteraction animations:^{
            viewTopPop.top = 64;
        } completion:nil];
    }
}

-(void)hiddenTopPopView
{
    if(viewTopPop.bottom <= 0){
        return;
    }
    else{
        [UIView animateWithDuration:0.3f delay:0.0f options:UIViewAnimationOptionCurveEaseInOut|UIViewAnimationOptionAllowUserInteraction animations:^{
            viewTopPop.bottom = 0;
        } completion:^(BOOL finished) {
            [maskView removeFromSuperview];
        }];
    }
}



@end
