//
//  UserSubjectService.h
//  CPAER
//
//  Created by 刘赞 on 2017/7/13.
//  Copyright © 2017年 zhuzh. All rights reserved.
//

#import "UserIdHttpClicent.h"

@interface UserSubjectService : UserIdHttpClicent

+ (instancetype)sharedService;

- (void)getUserSubjectWithHandler:(completionArrayHandler)handler;

- (void)getCharpterWithSubjectId:(NSInteger)subjectId Handler:(completionArrayHandler)handler;

- (void)getKnowPointWithCharpterId:(NSInteger)charpterId Handler:(completionArrayHandler)handler;

- (void)getKnowPointDetailWithKnowpointId:(NSInteger)knowpointId Handler:(completionArrayHandler)handler;

@end
