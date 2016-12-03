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
@interface BarrageScrollView ()<UIScrollViewDelegate>
@property(nonatomic,strong)UIScrollView * scrollView;
@property(nonatomic,strong)BarrageView *baeeageView;
@property(nonatomic,strong)NSTimer * timer;
@property(nonatomic,strong)NSMutableArray * arr;
@property(nonatomic,strong)UIView * barrageBackView;
@property(nonatomic,assign)NSInteger times;
@property(nonatomic,assign)CGFloat historyX;
//@property(nonatomic,getter=isScroll)BOOL scroll;
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
    self.scrollView.showsHorizontalScrollIndicator = NO;
//    self.scrollView.delegate = self;
    [self.scrollView setContentSize:CGSizeMake(Screen_Width*2, 0)];
    [self.scrollView setContentOffset:CGPointMake(Screen_Width, 0)];
    self.barrageBackView = [[UIView alloc] initWithFrame:CGRectMake(Screen_Width, 0, Screen_Width, Screen_Height)];
    [self.scrollView addSubview:self.barrageBackView];
    
    BarrageView * baeeageView = [[BarrageView alloc] initWithFrame:CGRectMake(10, Screen_Height-150, Screen_Width-80, 100)];
    [self.barrageBackView addSubview:baeeageView];
    
    self.baeeageView = baeeageView;
    
    
    UIView * actionBackView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.baeeageView.frame), Screen_Width, 50)];
    [self.barrageBackView addSubview:actionBackView];
    
    UIButton * btn = [[UIButton alloc] initWithFrame:CGRectMake(20, 5, 40, 40)];
    [btn setImage:[UIImage imageNamed:@"say"] forState:UIControlStateNormal];
    [actionBackView addSubview:btn];
    [btn addTarget:self action:@selector(allBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
}
///发出语句
- (void)allBtnAction:(UIButton*)btn{

    NSDictionary * dcit = @{@"nickName":@"王思聪😁👌",@"words":@"好看哈哈哈哈😍😍😍"};
    self.baeeageView.addModel = [BarrageModel barrageModelWithDict:dcit];
    

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
//    [self performSelector:@selector(action) withObject:nil afterDelay:1];
    _timer=0;
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.5 repeats:YES block:^(NSTimer * _Nonnull timer) {
        [self action];
    }];
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
    

}
- (void)action{
    if (_times<self.arr.count) {
        BarrageModel * model = self.arr[_times];
        self.baeeageView.addModel = model;

    }else{//超出数据长度关闭定时器
        if ([self.timer isValid]) {
            [self.timer invalidate];
            self.timer = nil;
        }
    }
    
    _times++;


}





#pragma mark scrollViewdelegate

//- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
//    self.historyX = scrollView.contentOffset.x;
////    self.scroll = YES;
//}

//- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
//
//    NSLog(@"%f",scrollView.contentOffset.x);
//    CGFloat X = scrollView.contentOffset.x;
//    if (self.scroll) {
//        if (X-self.historyX<0) {
//            if (X<Screen_Width-50 && X>Screen_Width-Screen_Width/2) {
//                [scrollView setContentOffset:CGPointMake(0, 0) animated:YES];
//                self.scroll = NO;
//
//            }
//        }else if(X-self.historyX>0){
//            
//            if (X>50 && X<Screen_Width/2) {
//                [scrollView setContentOffset:CGPointMake(Screen_Width, 0) animated:YES];
//                self.scroll = NO;
//            }
//        }
//
//    }
//    
//}

//- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
//    CGFloat X = scrollView.contentOffset.x;
//
//    if (X-self.historyX<0) {
//        if (X<Screen_Width-50 && X>Screen_Width-Screen_Width/2) {
//            [scrollView setContentOffset:CGPointMake(0, 0) animated:YES];
//            
//        }
//    }else if(X-self.historyX>0){
//        
//        if (X>50 && X<Screen_Width/2) {
//            [scrollView setContentOffset:CGPointMake(Screen_Width, 0) animated:YES];
//        }
//    }
//
//
//}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)dealloc{
    if ([self.timer isValid]) {
        [self.timer invalidate];
        self.timer = nil;
    }

}

@end
