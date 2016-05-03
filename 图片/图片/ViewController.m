//
//  ViewController.m
//  图片
//
//  Created by MAX on 16/4/28.
//  Copyright © 2016年 MAX. All rights reserved.
//

#import "ViewController.h"
#import "BsImage.h"
@interface ViewController ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate,UIActionSheetDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *topImageView;

@property (weak, nonatomic) IBOutlet UILabel *numlabel;
@property (weak, nonatomic) IBOutlet UISlider *slider;
@property (weak, nonatomic) IBOutlet UIStepper *stepper;
@property (weak, nonatomic) IBOutlet UIImageView *bottomImage;
@property (strong,nonatomic) UIImagePickerController *imagePicker;
@property (strong,nonatomic) NSMutableArray *dateArr;
@property (assign,nonatomic) int currentindex;
@property (assign,nonatomic) int allIndex;
@end

@implementation ViewController

-(NSMutableArray *)dateArr
{
    if (_dateArr == nil) {
        _dateArr = [[NSMutableArray alloc] init];
        
    }
    return _dateArr;
}
-(void)subimage
{
    for (int i = 1; i<= 9; i++) {
        UIImage *image1 = [UIImage imageNamed:[NSString stringWithFormat:@"%d",i]];
        [self.dateArr addObject:image1];
        
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self subimage];
    [self subView];
}

-(void)subView
{
    self.topImageView.image = [self.dateArr objectAtIndex:0];
    self.topImageView.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(channelBigImage:)];
    [self.topImageView addGestureRecognizer:tap];
    
    self.numlabel.text = [NSString stringWithFormat:@"%d/%ld",self.currentindex+1,self.dateArr.count];
    
    self.slider.minimumValue = 0;
    self.slider.maximumValue = self.dateArr.count-1;
    self.slider.value = self.currentindex;
    
    self.stepper.minimumValue = 0;
    self.stepper.maximumValue = self.dateArr.count-1;
    self.stepper.value = self.currentindex;
    self.stepper.stepValue = 1;
}
- (IBAction)stepperClick:(id)sender {
    self.currentindex = ((UIStepper *)sender).value;
    self.slider.value = self.currentindex;
    self.topImageView.image = [self.dateArr objectAtIndex:self.currentindex];
    
    self.numlabel.text = [NSString stringWithFormat:@"%d/%ld",self.currentindex+1,self.dateArr.count];
    
  
}

- (IBAction)sliderClick:(id)sender {
    self.currentindex = ((UISlider *)sender).value;
    self.stepper.value = self.currentindex;
    
    self.topImageView.image = [self.dateArr objectAtIndex:self.currentindex];
    
    self.numlabel.text = [NSString stringWithFormat:@"%d/%ld",self.currentindex+1,self.dateArr.count];
    

}

-(void)channelBigImage:(id)sender
{
 [BsImage showImage:self.topImageView num:[NSString stringWithFormat:@"%d/%ld",self.currentindex+1,self.dateArr.count-1]];
}
- (IBAction)photoClick:(id)sender
{
    UIActionSheet *sheet;
    
    // 判断是否支持相机
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
    {
        sheet  = [[UIActionSheet alloc] initWithTitle:@"选择图像" delegate:self cancelButtonTitle:nil destructiveButtonTitle:@"取消" otherButtonTitles:@"拍照", @"从相册选择", nil];
    }
    else {
        sheet = [[UIActionSheet alloc] initWithTitle:@"选择图像" delegate:self cancelButtonTitle:nil destructiveButtonTitle:@"取消" otherButtonTitles:@"从相册选择", nil];
    }
    
    sheet.tag = 255;
    
    [sheet showInView:self.view];
}
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (actionSheet.tag == 255) {
        NSUInteger sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        // 判断是否支持相机
        if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
            switch (buttonIndex) {
                case 0:
                    return;
                case 1: //相机
                    sourceType = UIImagePickerControllerSourceTypeCamera;
                    break;
                case 2: //相册
                    sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
                    break;
            }
        }
        else {
            if (buttonIndex == 0) {
                return;
            } else {
                sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
            }
        }
        // 跳转到相机或相册页面
        UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
        imagePickerController.delegate = self;
        imagePickerController.allowsEditing = YES;
        imagePickerController.sourceType = sourceType;
        
        [self presentViewController:imagePickerController animated:YES completion:^{}];
    }
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    UIImage *originImage = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
#warning 写成类 以后直接用
    //图片压缩
    UIImage *scaleImage = [self scaleImage:originImage toScale:0.3];
    NSData *data = [NSData data];
    //以下这两步都是比较耗时的操作，最好开一个HUD提示用户，这样体验会好些，不至于阻塞界面
    if (UIImagePNGRepresentation(scaleImage) == nil) {
        //将图片转换为JPG格式的二进制数据
        data = UIImageJPEGRepresentation(scaleImage, 1);
    } else {
        //将图片转换为PNG格式的二进制数据
        data = UIImagePNGRepresentation(scaleImage);
    }
    //将二进制数据生成UIImage
    UIImage *image = [UIImage imageWithData:data];
    
    
    [self.dateArr addObject:image];
    NSLog(@"%@",_dateArr);
    self.bottomImage.image = image;
    self.slider.maximumValue = self.dateArr.count-1;
    self.stepper.maximumValue = self.dateArr.count-1;
    self.numlabel.text = [NSString stringWithFormat:@"%d/%ld",self.currentindex+1,self.dateArr.count];
    [self dismissViewControllerAnimated:YES completion:^{}];
}

-(UIImage *)scaleImage:(UIImage *)image toScale:(float)scaleSize
{
    UIGraphicsBeginImageContext(CGSizeMake(image.size.width*scaleSize,image.size.height*scaleSize));
    [image drawInRect:CGRectMake(0, 0, image.size.width * scaleSize, image.size.height *scaleSize)];
    UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return scaledImage;
}
@end
