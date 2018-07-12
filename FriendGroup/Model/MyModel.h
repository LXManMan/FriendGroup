//
//  MyModel.h
//  TestDemo
//
//  Created by 万众创新 on 2018/7/11.
//  Copyright © 2018年 万众创新. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyModel : NSObject
@property (nonatomic ,strong)NSString *name;
@property (nonatomic ,strong)NSString *iconUrl;
@property (nonatomic ,strong)NSString *content;
@property (nonatomic ,strong)NSArray *links;

@end

@interface MylinkModel : NSObject
@property (nonatomic ,strong)NSString *linkurl;


@end
