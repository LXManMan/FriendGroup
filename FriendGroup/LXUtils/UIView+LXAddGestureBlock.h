//
//  UIView+LXAddGestureBlock.h
//  WZShareUmbrella
//
//  Created by 漫漫 on 2018/4/25.
//  Copyright © 2018年 漫漫. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^LXTapClick)(UIView *tapView);
@interface UIView (LXAddGestureBlock)
-(void)addTapGestureBlock:(LXTapClick)tapClick;

@property(nonatomic,copy)LXTapClick tapClick;
@end
