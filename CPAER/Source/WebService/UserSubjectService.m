//
//  UserSubjectService.m
//  CPAER
//
//  Created by 刘赞 on 2017/7/13.
//  Copyright © 2017年 zhuzh. All rights reserved.
//

#import "UserSubjectService.h"

@implementation UserSubjectService

+ (instancetype)sharedService {
    static id service = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        service = [[self class] new];
    });
    return service;
}

- (void)getUserSubjectWithHandler:(completionArrayHandler)handler {
    [self cancelAllRequest];
    NSString *url =[NSString stringWithFormat:@"%@%@",URL_API,URL_UserSubject];
    [self POST:url parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSError *err = [self handleSuccessBlockWithResponse:responseObject];
        if (!err) {
            NSDictionary *json = responseObject[@"data"][@"userSubjectList"];
        } else {
            handler(nil,err);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        handler(nil,[self handleFailureBlockWithError:error]);
    }];
}

- (void)getCharpterWithSubjectId:(NSInteger)subjectId Handler:(completionArrayHandler)handler {
    [self cancelAllRequest];
    NSString *url =[NSString stringWithFormat:@"%@%@",URL_API,URL_Charpter];
    [self POST:url parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSError *err = [self handleSuccessBlockWithResponse:responseObject];
        if (!err) {
            NSDictionary *json = responseObject[@"data"][@"charpterList"];
        } else {
            handler(nil,err);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        handler(nil,[self handleFailureBlockWithError:error]);
    }];
}


- (void)getKnowPointWithCharpterId:(NSInteger)charpterId Handler:(completionArrayHandler)handler {
    [self cancelAllRequest];
    NSString *url =[NSString stringWithFormat:@"%@%@",URL_API,URL_KnowPoint];
    [self POST:url parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSError *err = [self handleSuccessBlockWithResponse:responseObject];
        if (!err) {
            NSDictionary *json = responseObject[@"data"][@"knowPointList"];
        } else {
            handler(nil,err);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        handler(nil,[self handleFailureBlockWithError:error]);
    }];
}

- (void)getKnowPointDetailWithKnowpointId:(NSInteger)knowpointId Handler:(completionArrayHandler)handler {
    [self cancelAllRequest];
    NSString *url =[NSString stringWithFormat:@"%@%@",URL_API,URL_KnowPointDetail];
    [self POST:url parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSError *err = [self handleSuccessBlockWithResponse:responseObject];
        if (!err) {
            NSDictionary *json = responseObject[@"data"];
        } else {
            handler(nil,err);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        handler(nil,[self handleFailureBlockWithError:error]);
    }];
}

@end
