//
//  EditOkViewController.h
//  mba
//
//  Created by 王蕾 on 14-7-4.
//
//

#import <UIKit/UIKit.h>

@interface EditNoViewController : BaseViewController<UIActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UIPickerViewDataSource,UIPickerViewDelegate,UITextFieldDelegate>
{
  
    __weak IBOutlet UIPickerView *_pickerViewInterest;
    __weak IBOutlet UIPickerView *_pickerViewSchool;
    __weak IBOutlet UIPickerView *_pickerViewIndustry;
    __weak IBOutlet UIPickerView *_pickerViewClass;
    __weak IBOutlet UITableView *_tableView;
    __weak IBOutlet UIButton *_btCertification;
    UIImageView *_imgVSectionBack;
    UIButton *_btForHeadPhoto;
    
//    UILabel *_lbInCell;
    
    NSArray *arrayProvince;
    NSArray *arraySchool;
    NSDictionary *dicSchool;
    
    NSArray *_arrayGrade;
    NSArray *_arrayClass;
    NSDictionary *_dicClass;
    
    NSArray *_arrayIndustry;
}
@end
