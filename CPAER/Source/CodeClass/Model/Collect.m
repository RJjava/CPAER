//
//  Collect.m
//  CPAER
//
//  Created by 刘赞 on 2017/6/21.
//  Copyright © 2017年 zhuzh. All rights reserved.
//

#import "Collect.h"

@implementation Collect

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"resourceId":@"id",
             @"resourceBigimgUrl":@"resourceBigimgUrl",
             @"resourceSmallimgUrl":@"resourceSmallimgUrl",
             @"resourceUrl":@"resourceUrl",
             @"resourceTitle":@"resourceTitle",
             @"publishAt":@"createTime"
             };
}

@end
