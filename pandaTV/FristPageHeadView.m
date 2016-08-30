
//
//  FristPageHeadView.m
//  pandaTV
//
//  Created by shenzhenshihua on 16/8/22.
//  Copyright © 2016年 shenzhenshihua. All rights reserved.
//

#import "FristPageHeadView.h"

@interface FristPageHeadView ()
@property(nonatomic,strong)UIView * backView;
@property(nonatomic,strong)UIScrollView * titleScrollView;

@end

@implementation FristPageHeadView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initView];
    }
    
    return self;
}

- (void)initView
{
    [self addSubview:self.backView];
    [self addSubview:self.titleScrollView];

}

- (UIView *)backView
{
    if (!_backView) {
        CGFloat H = Screen_Width * 3/4-40;
        _backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, H)];
        _backView.backgroundColor = [UIColor greenColor];
    }

    return _backView;
}

- (UIScrollView *)titleScrollView
{
    if (!_titleScrollView) {
        _titleScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_backView.frame), Screen_Width-45, 40)];
        _titleScrollView.backgroundColor = [UIColor grayColor];
    }

    return _titleScrollView;

}
@end
