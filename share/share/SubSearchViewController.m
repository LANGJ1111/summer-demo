//
//  SubSearchViewController.m
//  share
//
//  Created by 浪极 on 2021/7/28.
//

#import "SubSearchViewController.h"

@interface SubSearchViewController ()

@end

@implementation SubSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.view.backgroundColor = [UIColor colorWithWhite:0.935 alpha:1];
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 390, 750)];
    scrollView.contentSize = CGSizeMake(390, 844);
    scrollView.backgroundColor = [UIColor colorWithWhite:0.935 alpha:1];
    UIImageView *image =[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"search_result.png"]];
    image.frame = CGRectMake(0, 0, 390, 360);
    [scrollView addSubview:image];
    [self.view addSubview:scrollView];
}

@end
