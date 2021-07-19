//
//  SuperView.m
//  手动布局子视图
//
//  Created by 浪极 on 2021/7/18.
//

#import "SuperView.h"

@implementation SuperView

- (void)createSubViews {
    _view1 = [UIView new];
    _view1.frame = CGRectMake(0, 0, 40, 40);
    _view2 = [UIView new];
    _view2.frame = CGRectMake(self.bounds.size.width - 40, 0, 40, 40);
    _view3 = [UIView new];
    _view3.frame = CGRectMake(self.bounds.size.width - 40, self.bounds.size.height - 40, 40, 40);
    _view4 = [UIView new];
    _view4.frame = CGRectMake(0, self.bounds.size.height - 40, 40, 40);
    _view1.backgroundColor = [UIColor orangeColor];
    _view2.backgroundColor = [UIColor orangeColor];
    _view3.backgroundColor = [UIColor orangeColor];
    _view4.backgroundColor = [UIColor orangeColor];
    [self addSubview:_view1];
    [self addSubview:_view2];
    [self addSubview:_view3];
    [self addSubview:_view4];
}

- (void)layoutSubviews {
    _view1.frame = CGRectMake(0, 0, 40, 40);
    _view2.frame = CGRectMake(self.bounds.size.width - 40, 0, 40, 40);
    _view3.frame = CGRectMake(self.bounds.size.width - 40, self.bounds.size.height - 40, 40, 40);
    _view4.frame = CGRectMake(0, self.bounds.size.height - 40, 40, 40);
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
