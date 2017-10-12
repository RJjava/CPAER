//
//  FollowService.m
//  CPAER
//
//  Created by 刘赞 on 2017/6/21.
//  Copyright © 2017年 zhuzh. All rights reserved.
//

#import "FollowService.h"

@implementation FollowService

+ (instancetype)sharedService
{
    static id service = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        service = [[self class] new];
    });
    return service;
}

- (void)isFollowWithFollowType:(NSString *)type
                   FollowValue:(NSString *)followId
                      isFollow:(NSString *)flag
                       Handler:(completionHandler)handler{
    [self cancelAllRequest];
    NSString *url = [NSString stringWithFormat:@"%@%@",URL_API,URL_Follow];
    NSDictionary *dict = @{
                           @"followType":type,
                           @"followValue":followId,
                           @"flag":flag
                           };
    [self POST:url parameters:dict progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        handler([self handleSuccessBlockWithResponse:responseObject]);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        handler([self handleFailureBlockWithError:error]);
    }];
}

- (void)getFollowListWithFollowType:(NSString *)type
                     followUserType:(NSString *)userType
                       searchCondit:(NSString *)searchCondit
                               skip:(NSString *)skip
                            Handler:(completionObjectHandler)handler{
    [self cancelAllRequest];
    NSString *url = [NSString stringWithFormat:@"%@%@",URL_API,URL_FollowList];
    NSDictionary *dict;
    if (searchCondit == nil || [searchCondit isEqualToString:@""]) {//搜索Id为空
        dict = @{
                 @"followType":type,
                 @"followUserType":userType,
                 @"curPage":skip,
                 @"maxLine":@"1000"
                 };
    }else{
        dict = @{
                 @"searchCondit":searchCondit,
                 @"followType":type,
                 @"followUserType":userType,
                 @"curPage":skip,
                 @"maxLine":@"1000"
                 };
    }
    [self POST:url parameters:dict progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSError *err = [self handleSuccessBlockWithResponse:responseObject];
        if (!err) {
            handler(responseObject,nil);
        } else {
            handler(nil,err);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        handler(nil,[self handleFailureBlockWithError:error]);
    }];
}

@end
