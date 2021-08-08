//
//  DeleteViewController.h
//  学生管理系统
//
//  Created by 浪极 on 2021/8/8.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol DeleteDelegate <NSObject>

- (void)deleteReloadWithNameArray:(NSMutableArray *)nameArray classArray:(NSMutableArray *)classArray andGradeArray:(NSMutableArray *)gradeArray;

@end

@interface DeleteViewController : UIViewController

@property (nonatomic, strong) NSMutableArray *nameArray;
@property (nonatomic, strong) NSMutableArray *classArray;
@property (nonatomic, strong) NSMutableArray *gradeArray;
@property (nonatomic, strong) UITextField *deleteTextField;
@property (nonatomic, strong) UIButton *confirmButton;
@property (nonatomic, strong) UIButton *backButton;
//声明代理
@property id<DeleteDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
