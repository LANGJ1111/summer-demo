//
//  LogInViewController.h
//  share
//
//  Created by 浪极 on 2021/7/26.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LogInViewController : UIViewController

@property (nonatomic, copy) NSString *userName;
@property (nonatomic, copy) NSString *password;

@property (nonatomic, strong) UITextField *userNameTextField;
@property (nonatomic, strong) UITextField *passwordTextField;
@property (nonatomic, strong) UIButton *autoLogInButton;

@end

NS_ASSUME_NONNULL_END
