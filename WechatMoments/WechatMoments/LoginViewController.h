//
//  LoginViewController.h
//  WechatMoments
//
//  Created by 浪极 on 2021/8/2.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LoginViewController : UIViewController

@property (nonatomic, copy) NSString *userName;
@property (nonatomic, copy) NSString *password;

@property (nonatomic, strong) UITextField *userNameTextField;
@property (nonatomic, strong) UITextField *passwordTextField;

@end

NS_ASSUME_NONNULL_END
