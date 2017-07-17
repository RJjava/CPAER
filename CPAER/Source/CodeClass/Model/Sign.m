//
//  Sign.m
//  CPAER
//
//  Created by 刘赞 on 2017/7/17.
//  Copyright © 2017年 zhuzh. All rights reserved.
//

#import "Sign.h"

@implementation SignIn

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"signId":@"id",
             @"userId":@"userId",
             @"signinDayIndex":@"signinDayIndex",
             @"awardAmount":@"awardAmount",
             @"signinDesc":@"signinDesc",
             @"createTime":@"createTime"
             };
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

@implementation Sign

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"isSignin":@"isSignin",
             @"signinDayIndex":@"signinDayIndex",
             @"integralAwardAmount":@"integralAwardAmount",
             @"avaIntegralAmount":@"avaIntegralAmount",
             @"list":@"data"
             };
}

+(NSValueTransformer *)listJSONTransformer {
    return [MTLJSONAdapter arrayTransformerWithModelClass:SignIn.class];
}

@end
