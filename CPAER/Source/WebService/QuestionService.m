//
//  QuestionService.m
//  CPAER
//
//  Created by 刘赞 on 2017/6/22.
//  Copyright © 2017年 zhuzh. All rights reserved.
//

#import "QuestionService.h"

@implementation QuestionService

+ (instancetype)sharedService {
    static id service = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        service = [[self class] new];
    });
    return service;
}

- (void)askWithQuestionType:(questionType)type
                      Title:(NSString *)title
                    Content:(NSString *)content
                inviteUsers:(NSString *)userId
                     Amount:(NSString *)amount
                    Handler:(completionHandler)handler {
    [self cancelAllRequest];
    NSString *url = [NSString stringWithFormat:@"%@%@",URL_API,URL_Ask];
    NSDictionary *dict = @{
                           @"questionTypeId":@(type),
                           @"questionTitle":title,
                           @"questionContent":content,
                           @"inviteUsers":userId,
                           @"integralAmount":amount,
                           };
    [self POST:url parameters:dict progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        handler([self handleSuccessBlockWithResponse:responseObject]);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        handler([self handleFailureBlockWithError:error]);
    }];
}

- (void)replyWithQuestionId:(NSInteger)questionId
                   ParentId:(NSInteger)parentId
              AnswerContent:(NSString *)content
                inviteUsers:(NSString *)userId
                    Handler:(completionHandler)handler {
    [self cancelAllRequest];
    NSString *url = [NSString stringWithFormat:@"%@%@",URL_API,URL_Reply];
    NSDictionary *dict = @{
                           @"questionId":@(questionId),
                           @"ParentId":@(parentId),
                           @"questionContent":content,
                           @"inviteUsers":userId,
                           @"answerContent":content,
                           };
    [self POST:url parameters:dict progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        handler([self handleSuccessBlockWithResponse:responseObject]);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        handler([self handleFailureBlockWithError:error]);
    }];
}

- (void)supportAnswerWithAnswerId:(NSInteger)answerId
                      SupportType:(supportType)type
                          Handler:(completionHandler)handler {
    [self cancelAllRequest];
    NSString *url = [NSString stringWithFormat:@"%@%@",URL_API,URL_Support];
    NSDictionary *dict = @{
                           @"answerId":@(answerId),
                           @"supportType":@(type),
                           };
    [self POST:url parameters:dict progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        handler([self handleSuccessBlockWithResponse:responseObject]);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        handler([self handleFailureBlockWithError:error]);
    }];
}

- (void)useAnswerWithQuestionId:(NSInteger)questionId
                       AnswerId:(NSInteger)answerId
                        Handler:(completionHandler)handler {
    [self cancelAllRequest];
    NSString *url = [NSString stringWithFormat:@"%@%@",URL_API,URL_UseUserAnswer];
    NSDictionary *dict = @{
                           @"questionId":@(questionId),
                           @"answerId":@(answerId),
                           };
    [self POST:url parameters:dict progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        handler([self handleSuccessBlockWithResponse:responseObject]);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        handler([self handleFailureBlockWithError:error]);
    }];
}

- (void)userQuestionListFrom:(NSInteger)skip
                     Handler:(completionInfiniteArrayHandler)handler {
    [self cancelAllRequest];
    NSString *url = [NSString stringWithFormat:@"%@%@",URL_API,URL_QuestionList];
    NSDictionary *dict = @{
                           @"curPage":@(skip),
                           @"maxLine":@([self size])
                           };
    [self POST:url parameters:dict progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSError *err = [self handleSuccessBlockWithResponse:responseObject];
        if (!err) {
            NSArray *json = responseObject[@"data"];
            NSArray *list = [MTLJSONAdapter modelsOfClass:[Question class] fromJSONArray:json error:nil];
            handler(list,list.count < [self size],nil);
        } else {
            handler(nil,NO, err);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        handler(nil,NO, [self handleFailureBlockWithError:error]);
    }];
}

@end
