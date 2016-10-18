//
//  ViewController.m
//  音频
//
//  Created by 王宝 on 16/10/17.
//  Copyright © 2016年 王宝. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    CATransition* tran = [CATransition animation];
    
    
    _btnplay = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _btnplay.frame = CGRectMake(100, 100, 100, 40);
    [_btnplay addTarget:self action:@selector(play) forControlEvents:UIControlEventTouchUpInside];
    [_btnplay setTitle:@"播放" forState:UIControlStateNormal];
    [self.view addSubview:_btnplay];
    
    _btnpause = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _btnpause.frame = CGRectMake(100, 150, 100, 40);
    [_btnpause addTarget:self action:@selector(pause) forControlEvents:UIControlEventTouchUpInside];
    [_btnpause setTitle:@"暂停" forState:UIControlStateNormal];
    [self.view addSubview:_btnpause];
    
    _btnstop = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _btnstop.frame = CGRectMake(100, 200, 100, 40);
    [_btnstop addTarget:self action:@selector(stop) forControlEvents:UIControlEventTouchUpInside];
    [_btnstop setTitle:@"停止" forState:UIControlStateNormal];
    [self.view addSubview:_btnstop];
    
    _progress = [[UIProgressView alloc] initWithFrame:CGRectMake(50, 250, 200, 40)];
    [self.view addSubview:_progress];
    
    _slider = [[UISlider alloc] initWithFrame:CGRectMake(50, 300, 200, 20)];
    _slider.minimumValue = 0;
    _slider.maximumValue = 100;
    _slider.value = 50;
    [_slider addTarget:self action:@selector(volumeChange:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:_slider];
    
    [self creatAudio];
    
    _player.delegate = self;
    
}

- (void)creatAudio {
    NSString *str = [[NSBundle mainBundle] pathForResource:@"群星 - 寸草心" ofType:@"mp3"];
    NSURL *url = [NSURL fileURLWithPath:str];
    //创建播放器对象
    _player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    //准备播放，解码
    [_player prepareToPlay];
    //循环播放次数
    _player.numberOfLoops = 1;
    //播放音量(0~1)
    _player.volume = 0.5;
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(changeT) userInfo:nil repeats:YES];
}

- (void)play {
    [_player play];
}

- (void)pause {
    [_player pause];
}

- (void)stop {
    [_player stop];
    _player.currentTime = 0;
}

- (void)volumeChange:(UISlider *)slide {
    _player.volume = slide.value/100;
}

- (void)changeT {
    _progress.progress = _player.currentTime/_player.duration;
}

//当播放结束后调用
- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag {
    [_timer invalidate];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
