//
//  MeViewController.h
//  mba
//
//  Created by Lad on 14-6-12.
//
//

#import "BaseViewController.h"

@interface MeViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate>{
  
    UIImageView *_imgVSectionBack;
    UIButton *_btForHeadPhoto;
}

@property (nonatomic,copy)NSString *lastChosenMediaType;
@end
