//
//  MABtnsView.m
//  爱车
//
//  Created by mayingbing on 16/4/1.
//  Copyright © 2016年 aiche. All rights reserved.
//

#import "MABtnsView.h"
#import "MAbtnBaseView.h"
#import <AVFoundation/AVFoundation.h>
#define screenSize [UIScreen mainScreen].bounds.size

@interface MABtnsView ()

@property(nonatomic ,strong)UIView *telShowView;
@property(nonatomic ,strong)MAbtnBaseView *lightView;

@property(nonatomic ,assign)BOOL islightOpen;

@end
@implementation MABtnsView

-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        [self setupChildViews];
    }
    
    return self;
}
-(void)setupChildViews{
    
    _islightOpen = NO;
    
    //telphone
    MAbtnBaseView *telView = [[MAbtnBaseView alloc]initWithFrame:CGRectMake(0, 0, screenSize.width/3, 95)];
    [self addSubview:telView];
    _telView = telView;
    
    telView.btnImageView.image = [UIImage imageNamed:@"my_8"];
    telView.btnLable.text = @"紧急呼叫";
    
    UITapGestureRecognizer *taptelViewGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(jumpToTelView)];
    [telView addGestureRecognizer:taptelViewGesture];
    
    //lightView
    MAbtnBaseView *lightView = [[MAbtnBaseView alloc]initWithFrame:CGRectMake(screenSize.width/3, 0, screenSize.width/3, 95)];
    [self addSubview:lightView];
    _lightView = lightView;
    lightView.btnImageView.image = [UIImage imageNamed:@"light"];
    lightView.btnLable.text = @"应急照明";
    
    UITapGestureRecognizer *taplightViewGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(jumpTolightView)];
    [lightView addGestureRecognizer:taplightViewGesture];
    
    
    //camera
    MAbtnBaseView *cameraView = [[MAbtnBaseView alloc]initWithFrame:CGRectMake(screenSize.width/3*2, 0, screenSize.width/3, 95)];
    [self addSubview:cameraView];
    cameraView.btnImageView.image = [UIImage imageNamed:@"camer"];
    cameraView.btnLable.text = @"录像取证";
    
    UITapGestureRecognizer *tapcameraViewGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(jumpTocameraView)];
    [cameraView addGestureRecognizer:tapcameraViewGesture];
    
}
-(void)jumpToTelView{
    
    if ([self.delegate respondsToSelector:@selector(MABtnsViewJumpOutOrInWithMABtnsView:)]) {
        [self.delegate MABtnsViewJumpOutOrInWithMABtnsView:self];
    }
}
-(void)jumpTolightView{
    _islightOpen = !_islightOpen;
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    if ([device hasTorch]) {
        [device lockForConfiguration:nil];
        if (_islightOpen) {
            [device setTorchMode:AVCaptureTorchModeOn];
            self.lightView.btnLable.textColor = [UIColor yellowColor];
        } else {
            [device setTorchMode:AVCaptureTorchModeOff];
            self.lightView.btnLable.textColor = [UIColor orangeColor];
        }
        [device unlockForConfiguration];
    }

    
}
-(void)jumpTocameraView{
    
    if ([self.cameraDelegate respondsToSelector:@selector(MABtnsViewCameraJumpOutWithMABtnsView:)]) {
        [self.cameraDelegate MABtnsViewCameraJumpOutWithMABtnsView:self];
    }
    
}
@end