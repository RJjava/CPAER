//
//  Resource.m
//  CPAER
//
//  Created by 刘赞 on 2017/6/21.
//  Copyright © 2017年 zhuzh. All rights reserved.
//

#import "Resource.h"

@implementation Resource

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"resourceId":@"id",
             @"createUser":@"createUser",
             @"downloadTypeId":@"downloadTypeId",
             @"resourceBigimgUrl":@"resourceBigimgUrl",
             @"resourceSmallimgUrl":@"resourceSmallimgUrl",
             @"resourceUrl":@"resourceUrl",
             @"resourceTitle":@"resourceTitle",
             @"publishAt":@"createTime"
             };
}

@end
