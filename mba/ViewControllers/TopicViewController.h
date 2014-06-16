//
//  TopicViewController.h
//  mba
//
//  Created by Lad on 14-6-11.
//
//

#import <UIKit/UIKit.h>


@interface TopicViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate>{
    
    __weak IBOutlet UIView *viewTopPop;
    UIView *maskView;
}



- (IBAction)btnMineAction:(id)sender;
- (IBAction)btnReferMeAction:(id)sender;
- (IBAction)btnMyPubishAction:(id)sender;
- (IBAction)btnMyParticipateAction:(id)sender;
- (IBAction)btnMyCollectionAction:(id)sender;

@end
