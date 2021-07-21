//
//  ViewControllerHome.h
//  Zara仿写
//
//  Created by 浪极 on 2021/7/20.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ViewControllerHome : UIViewController<UIScrollViewDelegate>

//滚动视图
@property(nonatomic, strong)UIScrollView *scrollView;
//按钮
@property(nonatomic, strong)UIButton *buttonLeft;
@property(nonatomic, strong)UIButton *buttonRight;
@property(nonatomic, strong)UIButton *buttonHead;

@end

NS_ASSUME_NONNULL_END
