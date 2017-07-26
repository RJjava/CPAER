//
//  ExamService.m
//  CPAER
//
//  Created by 刘赞 on 2017/7/13.
//  Copyright © 2017年 zhuzh. All rights reserved.
//

#import "ExamService.h"

@implementation ExamService

+ (instancetype)sharedService {
    static id service = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        service = [[self class] new];
    });
    return service;
}


@end
