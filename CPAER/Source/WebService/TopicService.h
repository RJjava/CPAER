//
//  TopicService.h
//  CPAER
//
//  Created by 刘赞 on 2017/7/11.
//  Copyright © 2017年 zhuzh. All rights reserved.
//


typedef enum : NSUInteger {
    disHot,
    hot,
} isHot;

@interface TopicService : BaseHttpClient

+ (instancetype)sharedService;

- (void)getTopicListWithIsHot:(isHot)isHot GroupId:(NSString *)groupId Handler:(completionObjectHandler)handler;

@end
