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

- (void)isFollowWithFollowType:(followType)type
                   FollowValue:(NSInteger)followId
                      isFollow:(isFollow)flag
                       Handler:(completionHandler)handler {
    [self cancelAllRequest];
    NSString *url = [NSString stringWithFormat:@"%@%@",URL_API,URL_Follow];
    NSDictionary *dict = @{
                           @"followType":@(type),
                           @"followValue":@(followId),
                           @"flag":@(flag)
                           };
    [self POST:url parameters:dict progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        handler([self handleSuccessBlockWithResponse:responseObject]);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        handler([self handleFailureBlockWithError:error]);
    }];
}

- (void)getFollowListWithFollowType:(followType)type
                     followUserType:(followUserType)userType
                               skip:(NSInteger)skip
                            Handler:(completionInfiniteArrayHandler)handler {
    [self cancelAllRequest];
    NSString *url = [NSString stringWithFormat:@"%@%@",URL_API,URL_FollowList];
    NSDictionary *dict = @{
                           @"followType":@(type),
                           @"followUserType":@(userType),
                           @"curPage":@(skip),
                           @"maxLine":@([self size])
                           };
    [self POST:url parameters:dict progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSError *err = [self handleSuccessBlockWithResponse:responseObject];
        if (!err) {
            NSArray *json = responseObject[@"data"];
            NSArray *list = [MTLJSONAdapter modelsOfClass:[Follow class] fromJSONArray:json error:nil];
            handler(list,list.count < [self size],nil);
        } else {
            handler(nil,NO, err);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        handler(nil,NO, [self handleFailureBlockWithError:error]);
    }];
}

@end
