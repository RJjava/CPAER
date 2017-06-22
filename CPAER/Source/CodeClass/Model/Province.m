//
//  Province.m
//  CPAER
//
//  Created by 刘赞 on 2017/6/22.
//  Copyright © 2017年 zhuzh. All rights reserved.
//

#import "Province.h"

@implementation Province

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"provinceId":@"provinceId",
             @"provinceName":@"provinceName",
             @"provinceEn":@"provinceEn"
             };
}

@end
