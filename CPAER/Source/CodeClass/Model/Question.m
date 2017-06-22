//
//  Question.m
//  CPAER
//
//  Created by 刘赞 on 2017/6/22.
//  Copyright © 2017年 zhuzh. All rights reserved.
//

#import "Question.h"

@implementation Question

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"questionTitle":@"questionTitle",
             @"questionContent":@"questionContent",
             @"questionId":@"questionId",
             @"integralAmount":@"integralAmount",
             @"status":@"status",
             @"userId":@"userId",
             @"answerList":@"answerList",
             @"publishAt":@"createTime"
             };
}

+ (NSValueTransformer *)answerListJSONTransformer {
    return [MTLJSONAdapter arrayTransformerWithModelClass:Answer.class];
}

+ (NSDateFormatter *)dateFormatter {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //    dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"];
    dateFormatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    return dateFormatter;
}

+ (NSValueTransformer *)publishAtJSONTransformer {
    return [MTLValueTransformer transformerUsingForwardBlock:^id(NSString *dateString, BOOL *success, NSError *__autoreleasing *error) {
        return [self.dateFormatter dateFromString:dateString];
    } reverseBlock:^id(NSDate *date, BOOL *success, NSError *__autoreleasing *error) {
        return [self.dateFormatter stringFromDate:date];
    }];
}

@end
