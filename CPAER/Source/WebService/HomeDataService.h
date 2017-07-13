//
//  HomeDataService.h
//  CPAER
//
//  Created by 刘赞 on 2017/7/11.
//  Copyright © 2017年 zhuzh. All rights reserved.
//

#import "UserIdHttpClicent.h"

@interface HomeDataService : UserIdHttpClicent

+ (instancetype)sharedService;

- (void)getFirstPageDataWith:(completionObjectHandler)handler;

@end
