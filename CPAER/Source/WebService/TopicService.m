//
//  TopicService.m
//  CPAER
//
//  Created by 刘赞 on 2017/7/11.
//  Copyright © 2017年 zhuzh. All rights reserved.
//

#import "TopicService.h"

@implementation TopicService

+ (instancetype)sharedService {
    static id service = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        service = [[self class] new];
    });
    return service;
}

- (void)getTopicListWithIsHot:(isHot)isHot GroupId:(NSString *)groupId Handler:(completionObjectHandler)handler {
//    [self cancelAllRequest];//自己注释掉了
    NSString *url = [NSString stringWithFormat:@"%@%@",URL_API,URL_TopicList];
    NSDictionary *dict = [[NSDictionary alloc] init];
    if (isHot) {
        dict = @{
//                 @"isHot":@(isHot),
                 @"isHot":@"1",
                 @"groupId":groupId
                 };
    }else{
        dict = @{
                 @"userId":[[NSUserDefaults standardUserDefaults] valueForKey:@"userId"]
                 };
    }
  
    [self POST:url parameters:dict progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSError *err = [self handleSuccessBlockWithResponse:responseObject];
        if (!err) {
            //自己添加
            handler(responseObject,nil);
        } else {
            handler(nil,err);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        handler(nil,[self handleFailureBlockWithError:error]);
    }];
}

@end
