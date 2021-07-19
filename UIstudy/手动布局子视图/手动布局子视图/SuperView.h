//
//  SuperView.h
//  手动布局子视图
//
//  Created by 浪极 on 2021/7/18.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SuperView : UIView {
    UIView *_view1;
    UIView *_view2;
    UIView *_view3;
    UIView *_view4;
    UIView *_view5;
}

- (void)createSubViews;

@end

NS_ASSUME_NONNULL_END
