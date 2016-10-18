//
//  ViewController.h
//  音频
//
//  Created by 王宝 on 16/10/17.
//  Copyright © 2016年 王宝. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface ViewController : UIViewController<AVAudioPlayerDelegate>
{
    UIButton *_btnplay ;
    UIButton *_btnpause ;
    UIButton *_btnstop ;
    UIProgressView *_progress ;
    UISlider *_slider ;
    UISwitch *_vomumon ;
    AVAudioPlayer *_player ;
    NSTimer *_timer ;
}


@end

