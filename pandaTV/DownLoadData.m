//
//  DownLoadData.m
//  tet4
//
//  Created by mac on 16/2/19.
//  Copyright © 2016年 United Network Services Ltd. of Shenzhen City. All rights reserved.
//

#import "DownLoadData.h"
#import "AFNetworking.h"
@implementation DownLoadData

#pragma get/post 请求；
+ (void)requestWithUrlString:(NSString *)urlString parameters:(id)parameters type:(HttpRequestType)type success:(void(^)(id success))success failue:(void(^)(NSError * failue))failue{
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];

    manager.requestSerializer = [AFHTTPRequestSerializer serializer];

    manager.responseSerializer = [AFHTTPResponseSerializer serializer];




    switch (type) {
        case HttpRequestTypeGet:
        {
            /*[manager GET:urlString parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
                if (success) {
                    NSDictionary * dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];

                    success(dic);
                }
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                if (failue) {
                    failue(error);
//                    [Utility alearShowWithString:@"请检查网络设置"];
                }
            }];*/
            [manager GET:urlString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                if (success) {
                    NSDictionary * dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
                    
                    success(dic);
                }

            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                if (failue) {
                    failue(error);
                    if (error.code==-1005)
                    {//无法访问当前的url
//                        [Utility alearShowWithString:@"Please check your network connection."];
                        NSLog(@"Please check your network connection.");
                    }
                    //                    [Utility alearShowWithString:@"请检查网络设置"];
                }

            }];
            
            
        }
           break;
        case HttpRequestTypePost:
        {
            
           /* [manager POST:urlString parameters:parameters constructingBodyWithBlock:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
                if (success) {


                    NSDictionary * dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];


                    success(dic);
                }

            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {

                if (failue) {
                    failue(error);
//                     [Utility alearShowWithString:@"后台API请求失败"];
                }
            }];*/
            
            [manager POST:urlString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                if (success) {
                    
                    
                    NSDictionary * dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
                    
                    
                    success(dic);
                }

            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                if (failue) {
                    failue(error);
                    if (error.code==-1005)
                    {//无法访问当前的url
//                        [Utility alearShowWithString:@"Please check your network connection."];
                        NSLog(@"Please check your network connection.");
                    }
                    //                     [Utility alearShowWithString:@"后台API请求失败"];
                }

            }];


        }
            break;

        default:
           break;

    }

}

#pragma mark -- 上传图片 --
+ (void)uploadWithURLString:(NSString *)URLString parameters:(id)parameters uploadParam:(UploadParam *)uploadParam success:(void (^)(id success))success failure:(void (^)(NSError * failure))failure {

    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];

    [manager POST:URLString parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        [formData appendPartWithFileData:uploadParam.data name:uploadParam.name fileName:uploadParam.filename mimeType:uploadParam.mimeType];

    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];
}
@end
