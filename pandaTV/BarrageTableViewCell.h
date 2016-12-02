//
//  BarrageTableViewCell.h
//  pandaTV
//
//  Created by liangzhen on 2016/12/2.
//  Copyright © 2016年 shenzhenshihua. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BarrageModel;
@interface BarrageTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *wordsLabel;

@property(nonatomic,strong)BarrageModel*model;

+ (id)barrageTableViewCellWithTableView:(UITableView*)tableView;


@end
