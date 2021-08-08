//
//  AddViewController.h
//  学生管理系统
//
//  Created by 浪极 on 2021/8/8.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol AddDelegate <NSObject>

- (void)addReloadWithNameArray:(NSMutableArray *)nameArray classArray:(NSMutableArray *)classArray andGradeArray:(NSMutableArray *)gradeArray;

@end


@interface AddViewController : UIViewController

@property (nonatomic, strong) NSMutableArray *nameArray;
@property (nonatomic, strong) NSMutableArray *classArray;
@property (nonatomic, strong) NSMutableArray *gradeArray;
@property (nonatomic, strong) UITextField *nameTextField;
@property (nonatomic, strong) UITextField *classTextField;
@property (nonatomic, strong) UITextField *gradeTextField;
@property (nonatomic, strong) UIButton *confirmButton;
@property (nonatomic, strong) UIButton *backButton;

@property id<AddDelegate> addDelegate;

@end

NS_ASSUME_NONNULL_END
