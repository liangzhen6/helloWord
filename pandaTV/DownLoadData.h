//
//  DownLoadData.h
//  tet4
//
//  Created by mac on 16/2/19.
//  Copyright © 2016年 United Network Services Ltd. of Shenzhen City. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface UploadParam : NSObject
/**
 *  图片的二进制数据
 */
@property (nonatomic, strong) NSData * data;
/**
 *  服务器对应的参数名称
 */
@property (nonatomic, copy) NSString * name;
/**
 *  文件的名称(上传到服务器后，服务器保存的文件名)
 */
@property (nonatomic, copy) NSString * filename;
/**
 *  文件的MIME类型(image/png,image/jpg等)
 */
@property (nonatomic, copy) NSString * mimeType;
@end

@class UploadParam;
typedef NS_ENUM(NSInteger,HttpRequestType){

    /**
     *  get请求
     */ HttpRequestTypeGet = 0,
    /**
     *  post请求
     */ HttpRequestTypePost

};
@interface DownLoadData : NSObject
/*s 数据请求
 */
+ (void)requestWithUrlString:(NSString *)urlString parameters:(id)parameters type:(HttpRequestType)type success:(void(^)(id success))success failue:(void(^)(NSError * failue))failue;
/**
 *  图片上传
 */
+ (void)uploadWithURLString:(NSString *)URLString parameters:(id)parameters uploadParam:(UploadParam *)uploadParam success:(void (^)(id success))success failure:(void (^)(NSError * failure))failure;
@end
