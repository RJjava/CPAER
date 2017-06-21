//
//  CollectService.m
//  CPAER
//
//  Created by 刘赞 on 2017/6/21.
//  Copyright © 2017年 zhuzh. All rights reserved.
//

#import "CollectService.h"

@implementation CollectService

+ (instancetype)sharedService
{
    static id service = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        service = [[self class] new];
    });
    return service;
}

- (void)isCollectWithCollectType:(collectType)type
                    CollectValue:(NSInteger)collectId
                       isCollect:(isCollect)flag
                         Handler:(completionHandler)handler {
    [self cancelAllRequest];
    NSString *url = [NSString stringWithFormat:@"%@%@",URL_API,URL_Collect];
    NSDictionary *dict = @{
                           @"uuid" : @"0c8297d7-6d3a-46da-b782-0df2434f88b1",
                           @"userId":@"",
                           @"collectType":@(type),
                           @"collectValue":@(collectId),
                           @"flag":@(flag)
                           };
    [self POST:url parameters:dict progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        handler([self handleSuccessBlockWithResponse:responseObject]);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        handler([self handleFailureBlockWithError:error]);
    }];
}

- (void)getCollectListWithCollectType:(collectType)type
                                 skip:(NSInteger)skip
                              Handler:(completionInfiniteArrayHandler)handler {
    [self cancelAllRequest];
    NSString *url = [NSString stringWithFormat:@"%@%@",URL_API,URL_CollectList];
    NSDictionary *dict = @{
                           @"uuid" : @"0c8297d7-6d3a-46da-b782-0df2434f88b1",
                           @"userId":@"",
                           @"collectType":@(type),
                           @"curPage":@(skip),
                           @"maxLine":@([self size])
                           };
    [self POST:url parameters:dict progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSError *err = [self handleSuccessBlockWithResponse:responseObject];
        if (!err) {
            NSArray *json = responseObject[@"data"];
            NSArray *list = [MTLJSONAdapter modelsOfClass:[Collect class] fromJSONArray:json error:nil];
            handler(list,list.count < [self size],nil);
        } else {
            handler(nil,NO, err);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        handler(nil,NO, [self handleFailureBlockWithError:error]);
    }];
}

@end
