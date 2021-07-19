//
//  VCImageShow.m
//  照片墙
//
//  Created by 浪极 on 2021/7/19.
//

#import "VCImageShow.h"

@interface VCImageShow ()

@end

@implementation VCImageShow

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _imageView = [UIImageView new];
    _imageView.frame = CGRectMake(0, 0, 320, 480);
    _imageView.image = _image;
    
    _imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%d.jpeg", _imageTag - 100]];
    [self.view addSubview:_imageView];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
