//
//  ListModel.h
//  pandaTV
//
//  Created by shenzhenshihua on 2016/12/1.
//  Copyright © 2016年 shenzhenshihua. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ListModel : NSObject

@property(nonatomic,copy)NSString *city;
@property(nonatomic,copy)NSNumber *gender;
@property(nonatomic,copy)NSNumber *Id;
@property(nonatomic,copy)NSNumber *level;
@property(nonatomic,copy)NSString *nick;
@property(nonatomic,copy)NSNumber *online_users;
@property(nonatomic,copy)NSString *portrait;
@property(nonatomic,copy)NSString *share_addr;
@property(nonatomic,copy)NSString *stream_addr;

+ (ListModel *)listModelWithDict:(NSDictionary *)dict;


/*
http://img2.inke.cn/MTQ3ODc1NDc3MjcxOCM2MzYjanBn.jpg
 
http://img2.inke.cn/MTQ4MDQ5MDIxNTc4MSM5OTYjanBn.jpg
 
http://img2.inke.cn/MTQ3OTgzNzEwNjE2OCMyNjEjanBn.jpg
 
http://image.scale.inke.com/imageproxy2/dimgm/scaleImage?url=http%3A%2F%2Fimg2.inke.cn%2FMTQ4MDMzNjA4MDkwNSM5NDAjanBn.jpg&w=640&s=80&h=640&c=0&o=0



http://image.scale.inke.com/imageproxy2/dimgm/scaleImage?url=http%3A%2F%2Fimg2.inke.cn%2FMTQ4MDMzNjA4MDkwNSM5NDAjanBn.jpg&w=640&s=80&h=640&c=0&o=0


http://image.scale.inke.com/imageproxy2/dimgm/scaleImage?url=http%3A%2F%2Fimg.meelive.cn%2FMTQ4MDAwMjk4MDUwOSMyNjgjanBn.jpg&w=-1&s=80&h=-1&c=0&o=1&l=0
 */

@end
