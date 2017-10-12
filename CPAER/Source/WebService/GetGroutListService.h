//
//  GetGroutListService.h
//  CPAER
//
//  Created by 朱智红 on 2017/8/25.
//  Copyright © 2017年 zhuzh. All rights reserved.
//

#import "BaseHttpClient.h"

@interface GetGroutListService : BaseHttpClient

+ (instancetype)sharedService;

- (void)getGroupListBySubjectId:(NSString *)subjectId groupId:(NSString *)groupId isRecommend:(NSString *)isRecommend Handler:(completionObjectHandler)handler;

@end
