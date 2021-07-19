//
//  ViewController.h
//  Slider&ProgressView
//
//  Created by 浪极 on 2021/7/18.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
    //下载或视频播放进度
    UIProgressView *_progressview;
    //调整音乐音量
    UISlider *_slider;
}

@property(retain, nonatomic)UIProgressView *pView;
@property(retain, nonatomic)UISlider *slider;

@end

