//
//  ListModel.m
//  pandaTV
//
//  Created by shenzhenshihua on 2016/12/1.
//  Copyright © 2016年 shenzhenshihua. All rights reserved.
//

#import "ListModel.h"

@implementation ListModel

+ (ListModel *)listModelWithDict:(NSDictionary *)dict{

    ListModel * model = [[ListModel alloc] init];
    
    if (dict) {
        
        model.city =dict[@"city"];
        model.online_users = dict[@"online_users"];
        model.share_addr = dict[@"share_addr"];
        model.stream_addr = dict[@"stream_addr"];
        if (dict[@"creator"]) {
            model.gender = dict[@"creator"][@"gender"];
            model.Id = dict[@"creator"][@"id"];
            model.level = dict[@"creator"][@"level"];
            model.nick = dict[@"creator"][@"nick"];
            model.portrait = dict[@"creator"][@"portrait"];//@"http://a.hiphotos.baidu.com/image/h%3D200/sign=64175659840a19d8d403830503fb82c9/e7cd7b899e510fb3a78c787fdd33c895d0430c44.jpg";
            NSLog(@"%@",model.portrait);
        }
        
        
    }
    

    return model;
}


@end
