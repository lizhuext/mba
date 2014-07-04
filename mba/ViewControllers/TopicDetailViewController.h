//
//  TopicDetailViewController.h
//  mba
//
//  Created by archermind on 14-7-4.
//
//

#import "BaseViewController.h"

@interface TopicDetailViewController : BaseViewController{
    
    __weak IBOutlet UIScrollView *scr;
    __weak IBOutlet UILabel *lblTitle;
    __weak IBOutlet UIImageView *imgvHead;
    __weak IBOutlet UILabel *lblName;
    __weak IBOutlet UILabel *lblDateTime;
    __weak IBOutlet UILabel *lblCollegName;
    __weak IBOutlet UIImageView *imgvSex;
    __weak IBOutlet UIImageView *imgvLine;
    __weak IBOutlet UILabel *lblContent;
}

@end
