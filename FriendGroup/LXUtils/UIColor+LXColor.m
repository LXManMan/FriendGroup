//
//  UIColor+LXColor.m
//  WZShareUmbrella
//
//  Created by 漫漫 on 2018/4/23.
//  Copyright © 2018年 漫漫. All rights reserved.
//

#import "UIColor+LXColor.h"

@implementation UIColor (LXColor)
+(UIColor *)buttonNomalColor{
    
    return [UIColor hexStringToColor:@"FF726D"];
}
+(UIColor *)buttonDisabledColor{
    return [UIColor hexStringToColor:@"FFB9B6"];

}
+(UIColor *)buttonHilightedColor{
    return [UIColor hexStringToColor:@"CC5B57"];

}
@end
