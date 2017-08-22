//
//  SupportTopic.m
//  CPAER
//
//  Created by 朱智红 on 2017/8/22.
//  Copyright © 2017年 zhuzh. All rights reserved.
//

#import "SupportTopic.h"

@implementation SupportTopic

+ (instancetype)sharedService {
    static id service = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        service = [[self class] new];
    });
    return service;
}

- (void)supportTopicWithIsSupport:(BOOL)isSupport topicId:(NSString *)topicId Handler:(completionObjectHandler)handler{
    NSString *url = [NSString stringWithFormat:@"%@%@",URL_API,URL_GroupSupportTopic];
    NSDictionary *dict = @{
                           @"topicId":topicId,
                           @"supportType":isSupport?@"1":@"0"
                           };
    
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
