//
//  SubSettingSearchViewController.h
//  share
//
//  Created by 浪极 on 2021/7/28.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol ChoosePhotoDelegate <NSObject>

- (void)choosePhoto:(int)numberOfTouxiang andNumber:(NSInteger)numberOfPhotos;

@end



@interface SubSettingSearchViewController : UIViewController

@property (nonatomic, assign)id<ChoosePhotoDelegate> delegate;
@property (nonatomic, assign)int *imageSelected;

@end

NS_ASSUME_NONNULL_END
