//
//  UIView+LXAddGestureBlock.m
//  WZShareUmbrella
//
//  Created by 漫漫 on 2018/4/25.
//  Copyright © 2018年 漫漫. All rights reserved.
//

#import "UIView+LXAddGestureBlock.h"
static const NSString *KEY_TAP = @"tapClick";
@implementation UIView (LXAddGestureBlock)
-(void)addTapGestureBlock:(LXTapClick)tapClick{
    self.tapClick = tapClick;
    UITapGestureRecognizer *tap =[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction)];
    [self addGestureRecognizer:tap];
}
-(void)tapAction{
    
    self.tapClick(self);
    
}
-(void)setTapClick:(LXTapClick)tapClick{
    objc_setAssociatedObject(self, &KEY_TAP, tapClick, OBJC_ASSOCIATION_RETAIN);
}
-(LXTapClick)tapClick{
    return objc_getAssociatedObject(self, &KEY_TAP);

}

@end
