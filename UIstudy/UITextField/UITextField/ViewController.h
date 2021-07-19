//
//  ViewController.h
//  UITextField
//
//  Created by 浪极 on 2021/7/18.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITextFieldDelegate> {
    UITextField *_textField;
}

@property(nonatomic, retain)UITextField *textField;

@end

