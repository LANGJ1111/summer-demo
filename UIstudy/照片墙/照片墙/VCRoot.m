//
//  VCRoot.m
//  照片墙
//
//  Created by 浪极 on 2021/7/19.
//

#import "VCRoot.h"
#import "VCImageShow.h"

@interface VCRoot ()

@end

@implementation VCRoot

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"照片墙";
    //self.navigationController.navigationBar.barTintColor = [UIColor purpleColor];
    self.navigationController.navigationBar.hidden = NO;
    self.navigationController.navigationBar.translucent = NO;
    UIScrollView *sv = [UIScrollView new];
    sv.frame = CGRectMake(10, 10, 300, 480);
    sv.contentSize = CGSizeMake(300, 480 * 1.5);
    sv.userInteractionEnabled = YES;
    self.view.backgroundColor = [UIColor whiteColor];
    
    for (int i = 0; i < 15; i++) {
        NSString *strName = [NSString stringWithFormat:@"%d.jpeg", i + 1];
        UIImage *image = [UIImage imageNamed:strName];
        UIImageView *iView = [[UIImageView alloc] initWithImage:image];
        iView.frame = CGRectMake(3 + (i % 3) * 100, (i / 3) * 140 + 10, 90, 130);
        [sv addSubview:iView];
        //开启交互模式
        iView.userInteractionEnabled = YES;
        //创建点击手势
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pressTap:)];
        //单次点击
        tap.numberOfTapsRequired = 1;
        //单个手指
        tap.numberOfTouchesRequired = 1;
        [iView addGestureRecognizer:tap];
        iView.tag = 101 + i;
    }
    
    [self.view addSubview:sv];
}

//- (void)pressTap:(UITapGestureRecognizer *)tap {
//    UIImageView *imageView = (UIImageView *)tap.view;
//    //创建视图控制器
//    VCImageShow *imageShow = [VCImageShow new];
//    //点击的图像视图赋值
//    imageShow.image = imageView.image;
//    //将控制器推出
//    [self.navigationController pushViewController:imageShow animated:YES];
//}

- (void)pressTap:(UITapGestureRecognizer *)tap {
    UIImageView *imageView = (UIImageView *)tap.view;
    //创建视图控制器
    VCImageShow *imageShow = [VCImageShow new];
    //点击的图像视图赋值
    imageShow.imageTag = imageView.tag;
    //将控制器推出
    [self.navigationController pushViewController:imageShow animated:YES];
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
