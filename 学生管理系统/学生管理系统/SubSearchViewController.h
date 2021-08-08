//
//  SubSearchViewController.h
//  学生管理系统
//
//  Created by 浪极 on 2021/8/8.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SubSearchViewController : UIViewController

@property (nonatomic, strong) NSMutableArray *nameArray;
@property (nonatomic, strong) NSMutableArray *classArray;
@property (nonatomic, strong) NSMutableArray *gradeArray;
@property (nonatomic, strong) UIButton *backButton;

@end

NS_ASSUME_NONNULL_END
