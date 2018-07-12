//
//  LXMessageBtn.m
//  WZShareUmbrella
//
//  Created by 漫漫 on 2018/4/23.
//  Copyright © 2018年 漫漫. All rights reserved.
//

#import "LXMessageBtn.h"

@implementation LXMessageBtn


//按钮倒计时事件
-(void)veriflication
{
    __block NSInteger time = 59; //倒计时时间
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    myTimer  = _timer;
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    
    dispatch_source_set_event_handler(_timer, ^{
        
        if(time <= 0){ //倒计时结束，关闭
            
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                
                //设置按钮的样式
                [self setTitle:@"获取验证码" forState:UIControlStateNormal];
                self.backgroundColor = [UIColor hexStringToColor:@"7CB3F3"] ;

//                [self setTitleColor:[UIColor hexStringToColor:@"7CB3F3"] forState:UIControlStateNormal];
                self.userInteractionEnabled = YES;
            });
            
        }else{
            
            int seconds = time % 60;
            dispatch_async(dispatch_get_main_queue(), ^{
                
                //设置按钮显示读秒效果
                [self setTitle:[NSString stringWithFormat:@"重新发送(%d)", seconds] forState:UIControlStateNormal];
                self.backgroundColor = [UIColor hexStringToColor:@"727987"] ;
//                [self setTitleColor:[UIColor hexStringToColor:@"727987"] forState:UIControlStateNormal];
                self.userInteractionEnabled = NO;
            });
            time--;
        }
    });
    dispatch_resume(_timer);
    
}
-(void)resume{
    dispatch_source_cancel(myTimer);
    dispatch_async(dispatch_get_main_queue(), ^{
        
        //设置按钮的样式
        [self setTitle:@"获取验证码" forState:UIControlStateNormal];
        self.backgroundColor = [UIColor hexStringToColor:@"7CB3F3"] ;

//        [self setTitleColor:LXMainColor forState:UIControlStateNormal];
        self.userInteractionEnabled = YES;
    });
}

@end

