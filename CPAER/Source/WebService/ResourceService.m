//
//  ResourceService.m
//  CPAER
//
//  Created by 刘赞 on 2017/6/21.
//  Copyright © 2017年 zhuzh. All rights reserved.
//

#import "ResourceService.h"

@implementation ResourceService

+ (instancetype)sharedService
{
    static id service = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        service = [[self class] new];
    });
    return service;
}

- (void)getDownResourceWithResourceTypeId:(resourceType)typeId
                                  Handler:(completionArrayHandler)handler {
    [self cancelAllRequest];
    NSString *url = [NSString stringWithFormat:@"%@%@",URL_API,URL_ResourceList];
    NSDictionary *dict = @{
                           @"uuid" : @"0c8297d7-6d3a-46da-b782-0df2434f88b1",
                           @"resourceTypeId":@(typeId),
                           };
    [self POST:url parameters:dict progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSError *err = [self handleSuccessBlockWithResponse:responseObject];
        if (!err) {
            NSArray *json = responseObject[@"data"];
            NSArray *list = [MTLJSONAdapter modelsOfClass:[Resource class] fromJSONArray:json error:nil];
            handler(list,nil);
        } else {
            handler(nil, err);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        handler(nil, [self handleFailureBlockWithError:error]);
    }];
}

- (void)updateDownWithDownloadResourceId:(NSInteger)resourceId
                              UpdateType:(updateType)type
                                 Handler:(completionHandler)handler {
    [self cancelAllRequest];
    NSString *url = [NSString stringWithFormat:@"%@%@",URL_API,URL_UpdateUserDown];
    NSDictionary *dict = @{
                           @"uuid" : @"0c8297d7-6d3a-46da-b782-0df2434f88b1",
                           @"userId":@"",
                           @"updateType":@(type),
                           @"downloadResourceId":@(resourceId)
                           };
    [self POST:url parameters:dict progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        handler([self handleSuccessBlockWithResponse:responseObject]);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        handler([self handleFailureBlockWithError:error]);
    }];
}

- (void)getUserDownloadWithResourceTypeId:(resourceType)typeId
                                  Handler:(completionArrayHandler)handler {
    [self cancelAllRequest];
    NSString *url = [NSString stringWithFormat:@"%@%@",URL_API,URL_UserDownList];
    NSDictionary *dict = @{
                           @"uuid" : @"0c8297d7-6d3a-46da-b782-0df2434f88b1",
                           @"userId":@"",
                           @"resourceTypeId":@(typeId),
                           };
    [self POST:url parameters:dict progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSError *err = [self handleSuccessBlockWithResponse:responseObject];
        if (!err) {
            NSArray *json = responseObject[@"data"];
            NSArray *list = [MTLJSONAdapter modelsOfClass:[Download class] fromJSONArray:json error:nil];
            handler(list,nil);
        } else {
            handler(nil, err);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        handler(nil, [self handleFailureBlockWithError:error]);
    }];
}
@end
