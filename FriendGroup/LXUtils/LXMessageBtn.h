//
//  LXMessageBtn.h
//  WZShareUmbrella
//
//  Created by 漫漫 on 2018/4/23.
//  Copyright © 2018年 漫漫. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LXMessageBtn : UIButton
{
    dispatch_source_t myTimer;
}
-(void)veriflication;//验证码
-(void)resume;//恢复

@end
