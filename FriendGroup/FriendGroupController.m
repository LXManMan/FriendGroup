//
//  FriendGroupController.m
//  FriendGroup
//
//  Created by 万众创新 on 2018/7/12.
//  Copyright © 2018年 万众创新. All rights reserved.
//

#import "FriendGroupController.h"
#import "MyGGCell.h"
#import "MyModel.h"
@interface FriendGroupController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic ,strong)UITableView *tableView;
@property (nonatomic ,strong)NSMutableArray *dataA;

@end

@implementation FriendGroupController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    if (kSystemVersion <11.0) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        // 这部分使用到的过期api
        self.automaticallyAdjustsScrollViewInsets = NO;
#pragma clang diagnostic pop
        
    }
    
    
    self.title = @"FriendGroup";
    self.view.backgroundColor =[UIColor hexStringToColor:@"bfbfbf"];
    
    [self.view addSubview:self.tableView];
    
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"test" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:path];
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    [self.dataA removeAllObjects];
    for (NSDictionary *dic in dict[@"data"]) {
        MyModel *model =[MyModel mj_objectWithKeyValues:dic];
        [self.dataA addObject:model];
    }
    
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataA.count;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    MyGGCell *cell =[tableView dequeueReusableCellWithIdentifier:@"MyGGCell" forIndexPath:indexPath];
    cell.selectionStyle = 0;
    cell.model = self.dataA[indexPath.row];
    
    return cell;
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
}

-(UITableView *)tableView{
    if (!_tableView) {
        _tableView =[[UITableView alloc]initWithFrame:CGRectMake(0, NAVH, kScreenWidth, kScreenHeight - NAVH) style:UITableViewStylePlain];
        _tableView.delegate  = self;
        _tableView.dataSource = self;
        _tableView.estimatedSectionFooterHeight = 0;
        _tableView.estimatedSectionHeaderHeight = 0;
        _tableView.estimatedRowHeight = 200;
        _tableView.rowHeight = UITableViewAutomaticDimension;
        _tableView.tableFooterView = [UIView new];
        _tableView.showsVerticalScrollIndicator = YES;
        _tableView.showsHorizontalScrollIndicator = NO;
        _tableView.separatorStyle = 0 ;
        QYRegistCellClass(_tableView, @"MyGGCell");
        AdjustsScrollViewInsetNever(self, _tableView);
    }
    return _tableView;
}
-(NSMutableArray *)dataA{
    if (!_dataA) {
        _dataA =[NSMutableArray array];
    }
    return _dataA;
}
@end
