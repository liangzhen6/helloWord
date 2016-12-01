//
//  ListTableViewCell.m
//  pandaTV
//
//  Created by shenzhenshihua on 2016/12/1.
//  Copyright © 2016年 shenzhenshihua. All rights reserved.
//

#import "ListTableViewCell.h"
#import "ListModel.h"
@implementation ListTableViewCell

+ (id)listTableViewCellWithTableView:(UITableView *)tableView{
    NSString * className = NSStringFromClass([self class]);
    //1.加载nib
    UINib * nib = [UINib nibWithNibName:className bundle:nil];
    //2.注册cell
    [tableView registerNib:nib forCellReuseIdentifier:className];
    //3.返回cell
    return [tableView dequeueReusableCellWithIdentifier:className];
}

- (void)setModel:(ListModel *)model{
    _model = model;
    self.nickName.text = model.nick;
    self.cityName.text = model.city;
    self.onlineNum.text = [model.online_users stringValue];
    UIImage * placeHolder = [UIImage imageNamed:@"head.png"];
    [self.headImage sd_setImageWithURL:[NSURL URLWithString:model.portrait] placeholderImage:placeHolder];
    [self.mainImage sd_setImageWithURL:[NSURL URLWithString:model.portrait] placeholderImage:placeHolder];

}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}




- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
