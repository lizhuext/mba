//
//  SecondViewController.m
//  mba
//
//  Created by Lad on 14-6-11.
//
//

#import "ContactsViewController.h"
#import <QuartzCore/QuartzCore.h>
@interface ContactsViewController ()

@end

@implementation ContactsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [_scrollView setContentSize:CGSizeMake(2 * (self.view.bounds.size.width), 0)];
     [_segmentControl setBackgroundImage:[UIImage imageNamed:@"left_on_right_off"]  forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    [_segmentControl addTarget:self action:@selector(chooseTableView) forControlEvents:UIControlEventValueChanged];
}

#pragma mark segmentControl Method
- (void)chooseTableView
{
    [_scrollView setContentOffset:CGPointMake(self.view.size.width * _segmentControl.selectedSegmentIndex, -64.0f) animated:YES];
    if (0 == _segmentControl.selectedSegmentIndex) {
        [_segmentControl setBackgroundImage:[UIImage imageNamed:@"left_on_right_off"]  forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    } else {
        [_segmentControl setBackgroundImage:[UIImage imageNamed:@"left_off_right_on"]  forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    }
}

#pragma mark  UIScrollViewDelegate Method
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    int page = _scrollView.contentOffset.x / self.view.bounds.size.width;
    _segmentControl.selectedSegmentIndex = page;
    if (0 == page) {
         [_segmentControl setBackgroundImage:[UIImage imageNamed:@"left_on_right_off"]  forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    } else {
         [_segmentControl setBackgroundImage:[UIImage imageNamed:@"left_off_right_on"]  forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    }
}

#pragma mark  UITableViewDelegate Method
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 99;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
         [self performSegueWithIdentifier:@"UserInfo" sender:nil];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"ContactCell";
    UITableViewCell *cell = [tableView
                             dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]
                initWithStyle:UITableViewCellStyleDefault
                reuseIdentifier:CellIdentifier];
    }
    UIButton *btImg = (UIButton *)[cell viewWithTag:101];
    [btImg.layer setCornerRadius:10.0f];
    btImg.layer.masksToBounds = YES;
    UIButton *btAttention = (UIButton *)[cell viewWithTag:100];
    [btAttention.layer setCornerRadius:5];
    if (tableView == _tableViewPeople) {
        btAttention.hidden = YES;
    }
    return cell;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
