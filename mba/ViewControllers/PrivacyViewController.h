//
//  PrivacyViewController.h
//  mba
//
//  Created by archermind on 14-7-3.
//
//

#import "BaseViewController.h"
#import "NJKWebViewProgress.h"
#import "NJKWebViewProgressView.h"

@interface PrivacyViewController : BaseViewController<NJKWebViewProgressDelegate,UIWebViewDelegate>{
    NJKWebViewProgress *_progressProxy;
    __weak IBOutlet UIWebView *web;
}

@end
