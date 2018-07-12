//
//  MyGGCell.m
//  TestDemo
//
//  Created by 万众创新 on 2018/7/11.
//  Copyright © 2018年 万众创新. All rights reserved.
//

#import "MyGGCell.h"
#import "photoContainerView.h"
@interface MyGGCell()
@property (nonatomic ,strong)UIImageView *icon;
@property (nonatomic ,strong)UILabel *nameLabel;
@property (nonatomic ,strong)UILabel *contentLabel;
@property (nonatomic ,strong)photoContainerView *ggView;
@property (nonatomic ,strong)UIView *lineView;


@end
@implementation MyGGCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self= [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self setUp];
    }
    return self;
}
-(void)setUp{
    
    [self.contentView addSubview:self.icon];
    [self.contentView addSubview:self.nameLabel];
    [self.contentView addSubview:self.contentLabel];
    [self.contentView addSubview:self.ggView];
    [self.contentView addSubview:self.lineView];
    
    
    [self.icon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(16);
        make.top.mas_equalTo(10);
        make.size.mas_equalTo(CGSizeMake(55, 55));

    }];
    
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.icon.mas_right).offset(15);
        make.right.equalTo(self.contentView).offset(-15);
        make.height.mas_equalTo(16);
        make.top.equalTo(self.icon);
        
    }];
    
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.nameLabel);
        make.right.equalTo(self.nameLabel);
        make.top.mas_equalTo(self.nameLabel.mas_bottom).offset(10);
    }];
    
    
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.ggView.mas_bottom).offset(10);
        make.left.right.and.bottom.equalTo(self.contentView);
        make.height.mas_equalTo(1);
    }];

    MASAttachKeys(self.ggView,self.contentLabel,self.nameLabel,self.icon,self.lineView);
    
}
-(void)setModel:(MyModel *)model{
    
    _model = model;
    
    [self.icon sd_setImageWithURL:[NSURL URLWithString:model.iconUrl] placeholderImage:[UIImage imageNamed:@"placeholder"] options:0];
    
    self.nameLabel.text = model.name;
    self.contentLabel.text = model.content;
    self.ggView.picPathStringsArray = model.links;
    
    [self.ggView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentLabel.mas_bottom).offset(10).with.priorityHigh();
        make.left.equalTo(self.nameLabel);
    }];
    

}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(UIImageView *)icon{
    if (!_icon) {
        _icon =[[UIImageView alloc]init];
        _icon.image =[UIImage imageNamed:@"icon"];
    }
    return _icon;
}
-(UILabel *)nameLabel{
    if (!_nameLabel) {
        _nameLabel = [UILabel LXLabelWithTextNoFrame:@"雪晟" textColor:[UIColor hexStringToColor:@"1D2230"] backgroundColor:[UIColor whiteColor] font:Font(17) textAlignment:NSTextAlignmentLeft];
    }
    return _nameLabel;
}

-(UILabel *)contentLabel{
    if (!_contentLabel) {
        _contentLabel = [UILabel LXLabelWithTextNoFrame:@"拉面的时侯，" textColor:[UIColor hexStringToColor:@"1D2230"] backgroundColor:[UIColor whiteColor] font:Font(15) textAlignment:NSTextAlignmentLeft];
        _contentLabel.numberOfLines = 0;
        _contentLabel.verticalStyle = LXVerticalAlignmentTop;
    }
    return _contentLabel;
}
-(UIView *)lineView{
    if (!_lineView) {
        _lineView  =[[UIView alloc]init];
        _lineView.backgroundColor = [UIColor hexStringToColor:@"ececec"];
    }
    return _lineView;
}
-(photoContainerView *)ggView{
    if (!_ggView) {
        _ggView =[[photoContainerView alloc]init];
    }
    return _ggView;
}
@end
