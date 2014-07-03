//
//  PrivacyViewController.m
//  mba
//
//  Created by archermind on 14-7-3.
//
//

#import "PrivacyViewController.h"


@interface PrivacyViewController (){
    NJKWebViewProgressView *_progressView;
}

@end

@implementation PrivacyViewController

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
    
    _progressProxy = [[NJKWebViewProgress alloc] init]; // instance variable
    web.delegate = _progressProxy;
    _progressProxy.webViewProxyDelegate = self;
    _progressProxy.progressDelegate = self;
    
    CGFloat progressBarHeight = 2.f;
    CGRect navigaitonBarBounds = self.navigationController.navigationBar.bounds;
    CGRect barFrame = CGRectMake(0, navigaitonBarBounds.size.height - progressBarHeight, navigaitonBarBounds.size.width, progressBarHeight);
    _progressView = [[NJKWebViewProgressView alloc] initWithFrame:barFrame];
    _progressView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
    
    [self loadData];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar addSubview:_progressView];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [_progressView removeFromSuperview];
}

-(void)loadData
{
    NSURLRequest *req = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:@"http://m.163.com/special/newsclient/privacy.html"]];
    [web loadRequest:req];
}

- (IBAction)reloadButtonPushed:(id)sender
{
    [web reload];
}


#pragma mark - NJKWebViewProgressDelegate
-(void)webViewProgress:(NJKWebViewProgress *)webViewProgress updateProgress:(float)progress
{
    [_progressView setProgress:progress animated:YES];
    self.title = [web stringByEvaluatingJavaScriptFromString:@"document.title"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
