//
//  RecommendFollowService.m
//  CPAER
//
//  Created by 朱智红 on 2017/8/24.
//  Copyright © 2017年 zhuzh. All rights reserved.
//

#import "RecommendFollowService.h"

@implementation RecommendFollowService

+ (instancetype)sharedService
{
    static id service = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        service = [[self class] new];
    });
    return service;
}

- (void)getRecommendFollowListBySearchCondit:(NSString *)searchCondit
                              followUserType:(NSString *)followUserType
                                     curPage:(NSString *)curPage
                                     maxLine:(NSString *)maxLine
                                     Handler:(completionObjectHandler)handler{
    [self cancelAllRequest];
    NSString *url = [NSString stringWithFormat:@"%@%@",URL_API,URL_FollowList];
    NSDictionary *dict;
    if (searchCondit == nil || [searchCondit isEqualToString:@""]) {//搜索Id为空
        dict = @{
                 @"followType":@"1",
                 @"followUserType":followUserType,
                 @"curPage":curPage,
                 @"maxLine":maxLine
                 };
    }else{
        dict = @{
                 @"followType":@"1",
                 @"searchCondit":searchCondit,
                 @"followUserType":followUserType,
                 @"curPage":curPage,
                 @"maxLine":maxLine
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
