//
//  MeViewController.m
//  mba
//
//  Created by Lad on 14-6-12.
//
//

#import "MeViewController.h"
#import "EditNoViewController.h"
#import <QuartzCore/QuartzCore.h>
#import <QuartzCore/CoreAnimation.h>
#import <MobileCoreServices/UTCoreTypes.h>

#define HEIGHT_FOR_HEADER_INSECTION 25.0f
#define HEIGHT_FOR_FIRST_HEADER_INSECTION 160.0f
#define HEIGHT_FOR_ROW 35.0f

@interface MeViewController ()<UIActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@end

@implementation MeViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor =  [UIColor whiteColor];
    UIButton *bt = (UIButton *)[self.view viewWithTag:104];
    [bt.layer setCornerRadius:5.0f];
    [bt.layer setBorderWidth:1.0f];
    [bt.layer setBorderColor:[UIColor redColor].CGColor];
    
   
}

- (void)pushViewController
{
//    EditNoViewController *vC = [[EditNoViewController alloc] initWithNibName:@"EditNoViewController" bundle:nil];
//    [self.navigationController pushViewController:vC animated:YES];
}

- (void)takePhotos
{
    UIActionSheet *actionSheet = [[UIActionSheet alloc]initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"拍照",@"从手机相册中选择", nil];
    [actionSheet showInView:self.view];
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

#pragma mark tableViewDelegate
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
        [btForHeadPhoto addTarget:self action:@selector(editViewAction) forControlEvents:UIControlEventTouchUpInside];
        [view addSubview:btForHeadPhoto];
        
      UIButton *btInHeadPhoto = [UIButton buttonWithType:UIButtonTypeCustom];
        btInHeadPhoto.frame = CGRectMake(_btForHeadPhoto.bounds.size.width - 32, _btForHeadPhoto.bounds.size.height - 22,17, 17);
        [btInHeadPhoto setBackgroundImage:[UIImage imageNamed:@"bt_InHead"] forState:UIControlStateNormal];
        [btForHeadPhoto addSubview:btInHeadPhoto];
        
        UIButton *btForCertification = [UIButton buttonWithType:UIButtonTypeCustom];
        btForCertification.frame = CGRectMake(220, 0, 48, 16);
        btForCertification.center = CGPointMake(_imgVSectionBack.bounds.size.width / 2 + 80, _imgVSectionBack.bounds.size.height / 2);
        [btForCertification setTitle:@"已认证" forState:UIControlStateNormal];
        [btForCertification setBackgroundImage:[UIImage imageNamed:@"certification"] forState:UIControlStateNormal];
        [btForCertification setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        btForCertification.titleLabel.font = [UIFont systemFontOfSize:9.0f];
        [btForCertification addTarget:self action:@selector(pushViewController) forControlEvents:UIControlEventTouchUpInside];
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
        label.textColor = [UIColor colorWithRed:0.4 green:0.8 blue:0.3 alpha:1];
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
    static NSString *CellIdentifier = @"MeCell";
    
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
   
    UILabel *lbLeft = (UILabel *)[cell viewWithTag:100];
    lbLeft.text = [[arAllForLeft objectAtIndex:indexPath.section]objectAtIndex:indexPath.row];
    UILabel *lbRight = (UILabel *)[cell viewWithTag:101];
    lbRight.text = [[arAllForRight objectAtIndex:indexPath.section]objectAtIndex:indexPath.row];
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

-(void)editViewAction
{
    [self performSegueWithIdentifier:@"EditViewController" sender:nil];
}

@end
