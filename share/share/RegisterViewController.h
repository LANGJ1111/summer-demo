//
//  RegisterViewController.h
//  share
//
//  Created by 浪极 on 2021/7/26.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface RegisterViewController : UIViewController

@property (nonatomic, strong) UITextField *email;
@property (nonatomic, strong) UITextField *userName;
@property (nonatomic, strong) UITextField *password;
@property (nonatomic, strong) UIButton *backButton;

@end

NS_ASSUME_NONNULL_END
