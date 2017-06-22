//
//  QuestionService.h
//  CPAER
//
//  Created by 刘赞 on 2017/6/22.
//  Copyright © 2017年 zhuzh. All rights reserved.
//

#import "UserIdHttpClicent.h"
#import "Question.h"

typedef NS_ENUM(NSInteger,questionType) {
    type1 = 1
};

typedef NS_ENUM(NSInteger,supportType) {
    NoSupport = 0,
    Support = 1
};

@interface QuestionService : UserIdHttpClicent

+ (instancetype)sharedService;

- (void)askWithQuestionType:(questionType)type
                      Title:(NSString *)title
                    Content:(NSString *)content
                inviteUsers:(NSString *)userId
                     Amount:(NSString *)amount
                    Handler:(completionHandler)handler;

- (void)replyWithQuestionId:(NSInteger)questionId
                   ParentId:(NSInteger)parentId
              AnswerContent:(NSString *)content
                inviteUsers:(NSString *)userId
                    Handler:(completionHandler)handler;

- (void)supportAnswerWithAnswerId:(NSInteger)answerId
                      SupportType:(supportType)type
                          Handler:(completionHandler)handler;

- (void)useAnswerWithQuestionId:(NSInteger)questionId
                       AnswerId:(NSInteger)answerId
                        Handler:(completionHandler)handler;

- (void)userQuestionListFrom:(NSInteger)skip
                     Handler:(completionInfiniteArrayHandler)handler;

@end
