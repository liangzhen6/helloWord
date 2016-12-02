//
//  BarrageTableViewCell.m
//  pandaTV
//
//  Created by liangzhen on 2016/12/2.
//  Copyright © 2016年 shenzhenshihua. All rights reserved.
//

#import "BarrageTableViewCell.h"
#import "BarrageModel.h"
#import "UILabel+Category.h"

@implementation BarrageTableViewCell

+ (id)barrageTableViewCellWithTableView:(UITableView*)tableView{

    NSString * className = NSStringFromClass([self class]);
    
    UINib * nib = [UINib nibWithNibName:className bundle:nil];
    
    [tableView registerNib:nib forCellReuseIdentifier:className];
    
    return [tableView dequeueReusableCellWithIdentifier:className];

}


- (void)setModel:(BarrageModel *)model{
    _model = model;
    
    NSMutableAttributedString * attStr = [[NSMutableAttributedString alloc] initWithString:model.allString];
    NSDictionary * attDict = @{NSFontAttributeName:[UIFont systemFontOfSize:15],NSForegroundColorAttributeName:[UIColor orangeColor]};
    NSRange rang = [model.allString rangeOfString:[model.nickName stringByAppendingString:@":"]];
    
    [attStr setAttributes:attDict range:rang];
    
    self.wordsLabel.attributedText = attStr;
    
    [self.wordsLabel onTapRangeActionWithString:@[model.nickName] tapClicked:^(NSString *string, NSRange range, NSInteger index) {
        NSLog(@"%@",string);
    }];


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
