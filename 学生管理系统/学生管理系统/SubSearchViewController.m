//
//  SubSearchViewController.m
//  学生管理系统
//
//  Created by 浪极 on 2021/8/8.
//

#import "SubSearchViewController.h"

@interface SubSearchViewController ()

@end

@implementation SubSearchViewController

- (void)viewDidLoad {
        [super viewDidLoad];
        
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"main.jpg"]];
        
        UILabel *titlelabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 100, 394, 50)];
       titlelabel.text = @"姓名                    班级                 成绩";
        titlelabel.textColor = [UIColor grayColor];
        titlelabel.font = [UIFont systemFontOfSize:20];
        [self.view addSubview:titlelabel];
        
        UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 160, 394, 45)];
        nameLabel.text = [NSString stringWithString:(NSString * _Nonnull)_nameArray];
        nameLabel.textColor = [UIColor whiteColor];
        nameLabel.font = [UIFont systemFontOfSize:17];
        [self.view addSubview:nameLabel];
        
        UILabel *classLabel = [[UILabel alloc] initWithFrame:CGRectMake(160, 160, 394, 45)];
        classLabel.text = [NSString stringWithString:(NSString * _Nonnull)_classArray];
        classLabel.textColor = [UIColor whiteColor];
        classLabel.font = [UIFont systemFontOfSize:17];
        [self.view addSubview:classLabel];
    
        UILabel *gradeLabel = [[UILabel alloc] initWithFrame:CGRectMake(280, 160, 394, 45)];
        gradeLabel.text = [NSString stringWithString:(NSString * _Nonnull)_gradeArray];
        gradeLabel.textColor = [UIColor whiteColor];
        gradeLabel.font = [UIFont systemFontOfSize:17];
        [self.view addSubview:gradeLabel];

        _backButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _backButton.frame = CGRectMake(135, 450, 100, 40);
        [_backButton setImage:[UIImage imageNamed:@"queren.png"] forState:UIControlStateNormal];
        [_backButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_backButton];
        
    }
- (void)back {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
