//
//  BarrageView.m
//  pandaTV
//
//  Created by shenzhenshihua on 2016/12/2.
//  Copyright © 2016年 shenzhenshihua. All rights reserved.
//

#import "BarrageView.h"
#import "BarrageModel.h"
#import "BarrageTableViewCell.h"
@interface BarrageView ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView * tableView;
@property(nonatomic,strong)NSMutableArray * dataSource;

@end

@implementation BarrageView

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self initView];
    }

    return self;
}

- (void)initView{
    self.tableView = [[UITableView alloc] initWithFrame:self.bounds style:UITableViewStylePlain];
    //取消分割线
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self addSubview:self.tableView];
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.showsVerticalScrollIndicator = NO;

    
    //滚动显示最后一条数据
//    [self.tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionBottom animated:YES];
//    [self.tableView scrollToNearestSelectedRowAtScrollPosition:UITableViewScrollPositionBottom animated:YES];
    
}


- (void)setAddModel:(BarrageModel *)addModel{
    _addModel = addModel;
    [self.dataSource addObject:addModel];
    [self.tableView reloadData];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:self.dataSource.count-1 inSection:0];
    [self.tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionBottom animated:YES];

}

#pragma mark tableView delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    BarrageModel * model = self.dataSource[indexPath.row];
    return model.rowHight+5;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    BarrageTableViewCell * cell = [BarrageTableViewCell barrageTableViewCellWithTableView:tableView];
    cell.model = self.dataSource[indexPath.row];
    
    return cell;

}


- (NSMutableArray *)dataSource{
    if (_dataSource==nil) {
        _dataSource = [[NSMutableArray alloc] init];
    }
    return _dataSource;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
