//
//  SupportTopic.h
//  CPAER
//
//  Created by 朱智红 on 2017/8/22.
//  Copyright © 2017年 zhuzh. All rights reserved.
//

#import "UserIdHttpClicent.h"

@interface SupportTopic : UserIdHttpClicent

+ (instancetype)sharedService;

- (void)supportTopicWithIsSupport:(BOOL)isSupport topicId:(NSString *)topicId Handler:(completionObjectHandler)handler;

@end
