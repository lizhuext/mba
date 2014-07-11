//
//  SecondViewController.h
//  mba
//
//  Created by Lad on 14-6-11.
//
//

#import <UIKit/UIKit.h>

@interface ContactsViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>{
    
    __weak IBOutlet UISegmentedControl *_segmentControl;
    __weak IBOutlet UITableView *_tableViewPeople;
    __weak IBOutlet UIScrollView *_scrollView;
    
    __weak IBOutlet UITableView *_tableViewCollect;
    
}

@end
