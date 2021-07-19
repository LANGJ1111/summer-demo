//
//  ViewController.h
//  步进器和分栏控件
//
//  Created by 浪极 on 2021/7/18.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
    //按照一定数字来调整某个数据
    UIStepper * _stepper;
    UISegmentedControl * _segControl;
}

@property(retain, nonatomic)UIStepper *stepper;
@property(retain, nonatomic)UISegmentedControl *segControl;


@end

