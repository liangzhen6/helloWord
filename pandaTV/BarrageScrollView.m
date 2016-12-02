//
//  BarrageScrollView.m
//  pandaTV
//
//  Created by liangzhen on 2016/12/2.
//  Copyright © 2016年 shenzhenshihua. All rights reserved.
//

#import "BarrageScrollView.h"
#import "BarrageView.h"
#import "BarrageModel.h"
@interface BarrageScrollView ()
@property(nonatomic,strong)UIScrollView * scrollView;
@property(nonatomic,strong)BarrageView *baeeageView;

@property(nonatomic,strong)NSMutableArray * arr;
@end

@implementation BarrageScrollView


- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self initView];
        [self ininData];
    }

    return self;
}

- (void)initView{

    self.scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
    [self addSubview:self.scrollView];
    
    self.scrollView.pagingEnabled = YES;
    
//    self.scrollView.delegate = self;
    [self.scrollView setContentSize:CGSizeMake(Screen_Width*2, 0)];
    [self.scrollView setContentOffset:CGPointMake(Screen_Width, 0)];
    UIView * barrageBackView = [[UIView alloc] initWithFrame:CGRectMake(Screen_Width, 0, Screen_Width, Screen_Height)];
    [self.scrollView addSubview:barrageBackView];
    
    BarrageView * baeeageView = [[BarrageView alloc] initWithFrame:CGRectMake(10, Screen_Height-120, Screen_Width-80, 100)];
    [barrageBackView addSubview:baeeageView];
    
    self.baeeageView = baeeageView;

    
    
}
- (void)ininData{
    NSString * path = [[NSBundle mainBundle] pathForResource:@"BarrageList" ofType:@"plist"];
    
    NSArray * arr = [NSArray arrayWithContentsOfFile:path];
    self.arr = [NSMutableArray array];
    for (NSDictionary * dict in arr) {
        BarrageModel * model = [BarrageModel barrageModelWithDict:dict];
        [self.arr addObject:model];
    }
    //设置定时器
    [self performSelector:@selector(action) withObject:nil afterDelay:1];

}
- (void)action{
    static int i = 0;
    if (i<self.arr.count) {
        BarrageModel * model = self.arr[i];
        self.baeeageView.addModel = model;

    }
    
    i++;


}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
