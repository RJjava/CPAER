//
//  Question.h
//  CPAER
//
//  Created by 刘赞 on 2017/6/22.
//  Copyright © 2017年 zhuzh. All rights reserved.
//

#import <Mantle/Mantle.h>
#import "Answer.h"

@interface Question : MTLModel<MTLJSONSerializing>

@property (nonatomic, copy, readonly)NSString *questionTitle;

@property (nonatomic, copy, readonly)NSString *questionContent;

@property (nonatomic, readonly)NSInteger questionId;

@property (nonatomic, readonly)NSInteger status;

@property (nonatomic, readonly)NSInteger userId;

@property (nonatomic, readonly)NSInteger integralAmount;

@property (nonatomic, strong, readonly) NSArray *answerList;

@property (nonatomic, readonly) NSDate *publishAt;

@end
