//
//  SettingSearchViewController.h
//  share
//
//  Created by 浪极 on 2021/7/28.
//

#import <UIKit/UIKit.h>
#import "SubSettingSearchViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface SettingSearchViewController : UIViewController<ChoosePhotoDelegate>

@property(nonatomic, assign)NSString *value;
@property(nonatomic, strong)UIButton *imageButton;
@property(nonatomic, strong)UILabel *numberLabel;

- (void)choosePhoto:(int)numberOfTouxiang andNumber:(NSInteger)numberOfPhotos;

@end

NS_ASSUME_NONNULL_END
