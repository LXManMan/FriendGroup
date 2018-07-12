//
//  NSString+LXDate.h
//  WZShareUmbrella
//
//  Created by 漫漫 on 2018/4/23.
//  Copyright © 2018年 漫漫. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (LXDate)
+(NSString *)timeIntervalFromTimeStr:(NSString *)timeStr; //时间转换为时间戳字符串

+(NSInteger)int_timeIntervalFromTimeStr:(NSString *)timeStr; //时间转换为时间戳int
+(NSString *)formateDate:(NSString *)string;//时间戳转换为时间
+(NSInteger)getNowInterVal;//获取当前的时间戳
+(NSString *)getNowTime;//获取当前的时间字符串
+(NSString *)formateDateToDay:(NSString *)string;//时间戳转换为时间

+(NSString *)getWeekFirstDay;
+(NSString *)getMonthFirstDay;

//计算两个时间之间的间隔
+(NSInteger)getIntervalFomeTimeStr1:(NSString *)str1 timeStr2:(NSString *)str2;


@end
