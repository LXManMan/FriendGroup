//
//  ViewController.m
//  FriendGroup
//
//  Created by 万众创新 on 2018/7/12.
//  Copyright © 2018年 万众创新. All rights reserved.
//

#import "ViewController.h"
#import "FriendGroupController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
     self.title = @"雪晟";
    
}
//-(UIRectEdge)edgesForExtendedLayout{
//    return UIRectEdgeNone;
//}
- (IBAction)enter:(id)sender {
    FriendGroupController *groupVc= [[FriendGroupController alloc]init];
    [self.navigationController pushViewController:groupVc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
