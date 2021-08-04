//
//  ViewController1.m
//  WechatMoments
//
//  Created by 浪极 on 2021/8/2.
//

#import "ViewController1.h"
#import "MomentsViewController.h"

@interface ViewController1 ()

@end

@implementation ViewController1

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"1";
    _barButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"push" style:UIBarButtonItemStylePlain target:self action:@selector(next)];
    self.navigationItem.leftBarButtonItem = _barButtonItem;
}

- (void)next {
    MomentsViewController *momentsViewController = [[MomentsViewController alloc] init];
    momentsViewController.modalPresentationStyle = UIModalPresentationFullScreen;
    [self.navigationController pushViewController:momentsViewController animated:YES
     ];
}

@end
