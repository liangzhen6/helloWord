//
//  ListTableViewCell.h
//  pandaTV
//
//  Created by shenzhenshihua on 2016/12/1.
//  Copyright © 2016年 shenzhenshihua. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ListModel;
@interface ListTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *headImage;
@property (weak, nonatomic) IBOutlet UILabel *nickName;
@property (weak, nonatomic) IBOutlet UILabel *cityName;
@property (weak, nonatomic) IBOutlet UILabel *onlineNum;
@property(nonatomic,strong)ListModel * model;
@property (weak, nonatomic) IBOutlet UIImageView *mainImage;

+ (id)listTableViewCellWithTableView:(UITableView *)tableView;

@end
