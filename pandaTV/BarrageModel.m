//
//  BarrageModel.m
//  pandaTV
//
//  Created by shenzhenshihua on 2016/12/2.
//  Copyright © 2016年 shenzhenshihua. All rights reserved.
//

#import "BarrageModel.h"

@implementation BarrageModel


+ (id)barrageModelWithDict:(NSDictionary *)dict{
    BarrageModel * model = [[BarrageModel alloc] init];
    if (dict) {
        model.nickName = dict[@"nickName"];
        model.words = dict[@"words"];
        model.allString = [NSString stringWithFormat:@"%@:%@",model.nickName,model.words];
        model.rowHight = [model.allString boundingRectWithSize:CGSizeMake(Screen_Width-80, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:[NSDictionary dictionaryWithObject:[UIFont systemFontOfSize:15] forKey:NSFontAttributeName] context:nil].size.height;
        
    }
    return model;
}



@end
