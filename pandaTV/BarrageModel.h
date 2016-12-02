//
//  BarrageModel.h
//  pandaTV
//
//  Created by shenzhenshihua on 2016/12/2.
//  Copyright © 2016年 shenzhenshihua. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BarrageModel : NSObject

@property(nonatomic,copy)NSString *nickName;

@property(nonatomic,copy)NSString *words;

@property(nonatomic,copy)NSString *allString;

@property(nonatomic,assign)CGFloat rowHight;

+ (id)barrageModelWithDict:(NSDictionary *)dict;

@end
