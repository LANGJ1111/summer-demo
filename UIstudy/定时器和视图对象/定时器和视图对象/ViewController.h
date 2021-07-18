//
//  ViewController.h
//  定时器和视图对象
//
//  Created by 浪极 on 2021/7/18.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
    NSTimer *_timerView;
}

@property(retain, nonatomic)NSTimer *timerView;

@end

