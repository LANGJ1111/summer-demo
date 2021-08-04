//
//  SubHomeViewController.m
//  share
//
//  Created by 浪极 on 2021/7/28.
//

#import "SubHomeViewController.h"


@interface SubHomeViewController ()

@end

@implementation SubHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 390, 750)];
    scrollView.contentSize = CGSizeMake(390, 1198);
    scrollView.backgroundColor = [UIColor whiteColor];
    UIImageView *first =[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"subHome_first.png"]];
    first.frame = CGRectMake(0, 0, 390, 561);
    [scrollView addSubview:first];
    UIImageView *second =[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"subHome_second.png"]];
    second.frame = CGRectMake(0, 561, 390, 637);
    [scrollView addSubview:second];
    [self.view addSubview:scrollView];
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
