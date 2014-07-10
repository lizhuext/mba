//
//  EditOkViewController.m
//  mba
//
//  Created by 王蕾 on 14-7-4.
//
//

#import "EditNoViewController.h"
#import <QuartzCore/QuartzCore.h>
#import <QuartzCore/CoreAnimation.h>
#import <MobileCoreServices/UTCoreTypes.h>

#define HEIGHT_FOR_HEADER_INSECTION 25.0f
#define HEIGHT_FOR_FIRST_HEADER_INSECTION 160.0f
#define HEIGHT_FOR_ROW 35.0f

@interface EditNoViewController ()<UITableViewDataSource,UITableViewDelegate>


@end

@implementation EditNoViewController


- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:nil object:nil];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = YES;
        arrayProvince = [[NSArray alloc] initWithObjects:@"湖北省",@"湖南省", nil];
        dicSchool = [[NSDictionary alloc] initWithObjectsAndKeys:[NSArray arrayWithObjects:@"武汉大学",@"华中科技大学", nil],@"湖北省",[NSArray arrayWithObjects:@"国防科技大学",@"中南大学", nil],@"湖南省", nil];
        arraySchool = [[NSArray alloc] initWithArray:[dicSchool objectForKey:@"湖北省"]];
        
        _arrayGrade = [[NSArray alloc] initWithObjects:@"14级",@"15级", nil];
        _dicClass = [[NSDictionary alloc] initWithObjectsAndKeys:[NSArray arrayWithObjects:@"01班",@"02班", nil],@"14级",[NSArray arrayWithObjects:@"04班",@"05班", nil],@"15级", nil];
        _arrayClass = [[NSArray alloc] initWithArray:[_dicClass objectForKey:@"14级"]];
    
        _arrayIndustry = [[NSArray alloc] initWithObjects:@"IT",@"舞蹈", nil];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:0.95f green:0.95f blue:0.95f alpha:1.0f];
    UIButton *bt = (UIButton *)[self.view viewWithTag:107];
    [bt.layer setCornerRadius:5.0f];
    bt.backgroundColor = [UIColor colorWithRed:0.7f green:0.8f blue:0.85f alpha:1.0f];
    _btCertification.backgroundColor = [UIColor colorWithRed:0.2 green:0.6 blue:0.4 alpha:1];
    
    UITapGestureRecognizer *tapGes = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyBoard)];
    [self.view addGestureRecognizer:tapGes];
    
    
//    _lbInCell = [[UILabel alloc] initWithFrame:CGRectMake(90, 0, 230, 35)];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(kerboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(kerboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
}

- (void)dismissKeyBoard
{
    [self.view endEditing:YES];
}

- (void)takePhotos
{
    UIActionSheet *actionSheet = [[UIActionSheet alloc]initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"拍照",@"从手机相册中选择", nil];
    [actionSheet showInView:self.view];
}

#pragma mark keyBoard Notification
- (void)kerboardWillShow:(NSNotification *)notification
{
    NSDictionary *userInfo = [notification userInfo];
    NSValue *aValue = [userInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGRect keyboardRect = [aValue CGRectValue];
    keyboardRect = [self.view convertRect:keyboardRect fromView:nil];
    
    CGFloat keyboardTop = keyboardRect.origin.y;
    CGRect newTextViewFrame = self.view.bounds;
    newTextViewFrame.size.height = keyboardTop - self.view.bounds.origin.y;
    
    NSValue *animationDurationValue = [userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey];
    NSTimeInterval animationDuration;
    [animationDurationValue getValue:&animationDuration];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:animationDuration];
    _tableView.frame = newTextViewFrame;
    
    [UIView commitAnimations];
}

- (void)kerboardWillHide:(NSNotification *)notification
{
    NSDictionary* userInfo = [notification userInfo];
    
    NSValue *animationDurationValue = [userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey];
    NSTimeInterval animationDuration;
    [animationDurationValue getValue:&animationDuration];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:animationDuration];
    
    _tableView.frame = self.view.bounds;
    [UIView commitAnimations];
}

#pragma mark UIPickerViewDelegate Method
- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component
{
    if (_pickerViewSchool == pickerView ||_pickerViewClass == pickerView) {
        if (0 == component) {
            return (self.view.bounds.size.width / 2);
        } else {
            return (self.view.bounds.size.width / 2);
        }
        } else {
            return self.view.bounds.size.width;
    }
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    
    return 35;
    
}

//- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
//{
//
//}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (_pickerViewSchool == pickerView) {
        if (0 == component) {
            return [arrayProvince count];
        } else {
            return [arraySchool count];
        }
    } else if (_pickerViewClass == pickerView) {
        if (0 == component) {
            return [_arrayGrade count];
        } else {
            return [_arrayClass count];
        }
    } else {
        return [_arrayIndustry count];
    }

}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    if (_pickerViewSchool == pickerView || _pickerViewClass == pickerView) {
        return 2;
    } else {
        return 1;
    }
    
}

- (UIView*)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    pickerView.backgroundColor = [UIColor whiteColor];
    
    UILabel *lb = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 150,35)];
    lb.center = CGPointMake(pickerView.bounds.size.width / 2, 0);
    lb.textAlignment = NSTextAlignmentCenter;
    if (_pickerViewSchool == pickerView ) {
        if (0 == component) {
            lb.text = [arrayProvince objectAtIndex:row];
        } else {
            lb.text = [arraySchool objectAtIndex:row];
        }
    } else if (_pickerViewClass == pickerView) {
        if (0 == component) {
            lb.text = [_arrayGrade objectAtIndex:row];
        } else {
            lb.text = [_arrayClass objectAtIndex:row];
        }
    } else if (_pickerViewIndustry == pickerView || _pickerViewInterest == pickerView) {
        lb.text = [_arrayIndustry objectAtIndex:row];
    }
    return lb;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (_pickerViewSchool == pickerView || _pickerViewClass == pickerView) {
        if (0 == component) {
            arraySchool = [dicSchool objectForKey:[arrayProvince objectAtIndex:row]];
            _arrayClass = [_dicClass objectForKey:[_arrayGrade objectAtIndex:row]];
            [pickerView selectRow:0 inComponent:1 animated:YES];
            [pickerView reloadComponent:1];
        }
    }
    
    if (_pickerViewSchool == pickerView) {
        NSInteger firstViewRow = [pickerView selectedRowInComponent:0];
        NSInteger subViewRow = [pickerView selectedRowInComponent:1];
        NSString* subSchoolString =[[dicSchool objectForKey:[arrayProvince objectAtIndex:firstViewRow] ] objectAtIndex:subViewRow];
        
         UITextField *textF = (UITextField *)[self.view viewWithTag:310];
        textF.text = subSchoolString;
//        UILabel *lb = (UILabel *)[self.view viewWithTag:319];
//        lb.text = subSchoolString;
    } else if (_pickerViewClass == pickerView) {
        NSInteger firstViewRow = [pickerView selectedRowInComponent:0];
        NSInteger subViewRow = [pickerView selectedRowInComponent:1];
        NSString *firstGradeString = [_arrayGrade objectAtIndex:firstViewRow];
        NSString* subClassString =[[_dicClass objectForKey:[_arrayGrade objectAtIndex:firstViewRow] ] objectAtIndex:subViewRow];
        UITextField *textFClass = (UITextField *)[self.view viewWithTag:311];
        textFClass.text = [NSString stringWithFormat:@"%@%@",firstGradeString,subClassString];
    } else if (_pickerViewInterest == pickerView){
        UITextField *textF = (UITextField *)[self.view viewWithTag:312];
        textF.text = [_arrayIndustry objectAtIndex:row];
    } else {
        UITextField *textF = (UITextField *)[self.view viewWithTag:313];
        textF.text = [_arrayIndustry objectAtIndex:row];
    }
}

#pragma mark UITextFieldDelegate Method
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
//    [self.tabBarController.tabBar setHidden:YES];
//    [UIView beginAnimations:Nil context:NULL];
//    [UIView setAnimationDuration:0.3];
//    _pickerView.frame = CGRectMake(0, self.view.bounds.size.height - 162, self.view.bounds.size.width, 162);
//    [UIView commitAnimations];
    return NO;
}


#pragma mark actionSheetDelegate Method
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    
    switch (buttonIndex) {
        case 0://take picture
            if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
                picker.sourceType = UIImagePickerControllerSourceTypeCamera;
            } else {
                NSLog(@"模拟器无法打开相机");
            }
            [self presentViewController:picker animated:YES completion:nil];
            break;
        case 1://from album
            picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            [self presentViewController:picker animated:YES completion:nil];
            break;
        default:
            break;
    }
}

#pragma mark UIImagePickerControllerDelegate Method
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [UIApplication sharedApplication].statusBarHidden = NO;
    NSString *mediaType = [info objectForKey:UIImagePickerControllerMediaType];
    NSData *data;
    if ([mediaType isEqualToString:@"public.image"]) {
        UIImage *originImage = [info objectForKey:UIImagePickerControllerOriginalImage];
        UIImage *scaleImage = [self scaleImage:originImage toScale:0.3];
        if (UIImagePNGRepresentation(scaleImage) == nil) {
            data = UIImageJPEGRepresentation(scaleImage, 1);
        } else {
            data = UIImagePNGRepresentation(scaleImage);
        }
        UIImage *image = [UIImage imageWithData:data];
//        _imgVSectionBack.image = image;
        [_btForHeadPhoto setBackgroundImage:image forState:UIControlStateNormal];
    }
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (UIImage *)scaleImage:(UIImage *)image toScale:(float)scaleSize
{
    UIGraphicsBeginImageContext(CGSizeMake(image.size.width * scaleSize, image.size.height * scaleSize));
    [image drawInRect:CGRectMake(0, 0, image.size.width * scaleSize, image.size.height * scaleSize)];
    UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return scaledImage;
}

#pragma mark tableViewDelegate Method
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (0 == section) {
        return 3;
    } else if(1 == section) {
        return 5;
    } else {
        return 2;
    }
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}

-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    NSArray *arraySectiontitle = [NSArray arrayWithObjects:@"MBA信息",@"基础资料",@"社会资料", nil];
    UIView * view = [[UIView alloc]init];
    [view setBackgroundColor:[UIColor colorWithRed:0.95 green:0.95 blue:0.95 alpha:1]];
    if (0 == section) {
        view.frame = CGRectMake(0,0,self.view.size.width,HEIGHT_FOR_FIRST_HEADER_INSECTION);
        
        _imgVSectionBack = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, HEIGHT_FOR_FIRST_HEADER_INSECTION - HEIGHT_FOR_HEADER_INSECTION)];
        _imgVSectionBack.userInteractionEnabled = YES;
        _imgVSectionBack.image  = [UIImage imageNamed:@"headBImg"];
        
        _btForHeadPhoto = [UIButton buttonWithType:UIButtonTypeCustom];
        _btForHeadPhoto.frame = CGRectMake(0, 0, 78, 78);
        _btForHeadPhoto.center = CGPointMake(_imgVSectionBack.bounds.size.width / 2, _imgVSectionBack.bounds.size.height / 2 - 15);
        [_btForHeadPhoto setBackgroundImage:[UIImage imageNamed:@"headForMe"] forState:UIControlStateNormal];
        [view addSubview:_btForHeadPhoto];
        [view insertSubview:_imgVSectionBack aboveSubview:_btForHeadPhoto];
        
        UIButton *btForHeadPhoto = [UIButton buttonWithType:UIButtonTypeCustom];
        btForHeadPhoto.frame = CGRectMake(0, 0, 75, 75);
        btForHeadPhoto.center = CGPointMake(_imgVSectionBack.bounds.size.width / 2, _imgVSectionBack.bounds.size.height / 2 - 15);
        [btForHeadPhoto addTarget:self action:@selector(takePhotos) forControlEvents:UIControlEventTouchUpInside];
        [view addSubview:btForHeadPhoto];
        
        UIButton *btInHeadPhoto = [UIButton buttonWithType:UIButtonTypeCustom];
        btInHeadPhoto.frame = CGRectMake(_btForHeadPhoto.bounds.size.width - 32, _btForHeadPhoto.bounds.size.height - 23.5, 15, 15);
        [btInHeadPhoto setBackgroundImage:[UIImage imageNamed:@"bt_InEditHead"] forState:UIControlStateNormal];
        [btForHeadPhoto addSubview:btInHeadPhoto];
        
        UIButton *btForCertification = [UIButton buttonWithType:UIButtonTypeCustom];
        btForCertification.frame = CGRectMake(220, 0, 48, 16);
        btForCertification.center = CGPointMake(_imgVSectionBack.bounds.size.width / 2 + 80, _imgVSectionBack.bounds.size.height / 2);
        [btForCertification setTitle:@"未认证" forState:UIControlStateNormal];
        [btForCertification setBackgroundImage:[UIImage imageNamed:@"certification"] forState:UIControlStateNormal];
        [btForCertification setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        btForCertification.titleLabel.font = [UIFont systemFontOfSize:9.0f];
        btForCertification.backgroundColor = [UIColor colorWithRed:0.95f green:0.95f blue:0.95f alpha:1];
        [_imgVSectionBack addSubview:btForCertification];
        
        UILabel *lbName = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 10)];
        lbName.center = CGPointMake(_imgVSectionBack.bounds.size.width / 2 - 3, _imgVSectionBack.bounds.size.height - 25);
        lbName.text = @"Hemione Jeno";
        lbName.textColor = [UIColor whiteColor];
        lbName.font = [UIFont systemFontOfSize:12.0f];
        lbName.backgroundColor = [UIColor clearColor];
        [_imgVSectionBack addSubview:lbName];
        
        UIImageView *imgVBesideName = [[UIImageView alloc] initWithFrame:CGRectMake(0 , lbName.bounds.size.width - 20, lbName.bounds.size.height + 3, lbName.bounds.size.height + 3)];
        imgVBesideName.center = CGPointMake((_imgVSectionBack.bounds.size.width  + lbName.bounds.size.width) / 2 - 5, _imgVSectionBack.bounds.size.height - 24);
        imgVBesideName.image  = [UIImage imageNamed:@"women"];
        [_imgVSectionBack addSubview:imgVBesideName];
        
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(15, HEIGHT_FOR_FIRST_HEADER_INSECTION - HEIGHT_FOR_HEADER_INSECTION, 100, HEIGHT_FOR_HEADER_INSECTION)];
        label.font = [UIFont systemFontOfSize:12.0f];
        label.backgroundColor = [UIColor clearColor];
        label.textColor = [UIColor colorWithRed:0.4 green:0.8 blue:0.3 alpha:1];
        label.text = [arraySectiontitle objectAtIndex:section];
        [view addSubview:label];
    } else {
        view.frame = CGRectMake(0,0,self.view.size.width,HEIGHT_FOR_HEADER_INSECTION);
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(15, 0, 100, HEIGHT_FOR_HEADER_INSECTION)];
        label.font = [UIFont systemFontOfSize:12.0f];
        label.backgroundColor = [UIColor clearColor];
        label.textColor = [UIColor colorWithRed:0.4 green:0.8 blue:0.3 alpha:1];
        label.text = [arraySectiontitle objectAtIndex:section];
        [view addSubview:label];
        
    }
    return  view;
}



-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"EditCell";
    
    UITableViewCell *cell = [tableView
                             dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]
                initWithStyle:UITableViewCellStyleDefault
                reuseIdentifier:CellIdentifier];
    }
    NSArray *array = [NSArray arrayWithObjects:@"学校：",@"班级：",@"学号：", nil];
    NSArray *arrayTwo = [NSArray arrayWithObjects:@"年龄：",@"兴趣领域：",@"QQ：",@"微信：",@"微博：", nil];
    NSArray *arrayThree= [NSArray arrayWithObjects:@"行业选择：",@"职务：", nil];
    NSArray *arAllForLeft= [[NSArray alloc] initWithObjects:array,arrayTwo,arrayThree, nil];
    
    NSArray *arrayOneRight = [NSArray arrayWithObjects:@"华中师范大学",@"15级02班",@"20151314", nil];
    NSArray *arrayTwoRight = [NSArray arrayWithObjects:@"18",@"IT",@"4567865",@"文艺小野猫",@"文艺小野猫", nil];
    NSArray *arrayThreeRight= [NSArray arrayWithObjects:@"IT",@"设计总监", nil];
    NSArray *arAllForRight = [[NSArray alloc] initWithObjects:arrayOneRight,arrayTwoRight,arrayThreeRight, nil];
    
    UILabel *lbLeft = (UILabel *)[cell viewWithTag:300];
    lbLeft.text = [[arAllForLeft objectAtIndex:indexPath.section]objectAtIndex:indexPath.row];
    UITextField *textField = (UITextField *)[cell viewWithTag:301];
//    textField.delegate = self;
    
//    _lbInCell.backgroundColor = [UIColor clearColor];
    if (0 == indexPath.section && 0 == indexPath.row) {
        textField.inputView = _pickerViewSchool;
        textField.tag = 310;
//        _lbInCell.tag = 319;
//        [cell addSubview:_lbInCell];
    } else if (0 == indexPath.section && 1 == indexPath.row) {
        textField.inputView = _pickerViewClass;
        textField.tag = 311;
    } else if ((1 == indexPath.section && 1 == indexPath.row)) {
        textField.inputView = _pickerViewInterest;
        textField.tag = 312;
    } else if ((2 == indexPath.section && 0 == indexPath.row)) {
        textField.inputView = _pickerViewIndustry;
        textField.tag = 313;
    }
    
    if ((0 == indexPath.section && 2 == indexPath.row) || (1 == indexPath.section && (2 == indexPath.row || 0 == indexPath.row))) {
        textField.keyboardType = UIKeyboardTypeNumberPad;
    }
    textField.text = [[arAllForRight objectAtIndex:indexPath.section]objectAtIndex:indexPath.row];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (0 == section) {
        return HEIGHT_FOR_FIRST_HEADER_INSECTION;
    } else {
        return HEIGHT_FOR_HEADER_INSECTION;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return HEIGHT_FOR_ROW;
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
