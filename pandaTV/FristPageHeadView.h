//
//  FristPageHeadView.h
//  pandaTV
//
//  Created by shenzhenshihua on 16/8/22.
//  Copyright © 2016年 shenzhenshihua. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol FristPageHeadDelegate <NSObject>
@required
- (void)touchAddAction;
@optional

@end


@interface FristPageHeadView : UIView

@property(nonatomic,copy)id<FristPageHeadDelegate>delegate;

@end
