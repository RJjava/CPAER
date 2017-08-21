//
//  LoginService.h
//  RealmTest
//
//  Created by 刘赞 on 2017/5/13.
//  Copyright © 2017年 stockstar. All rights reserved.
//

#import "BaseHttpClient.h"

@interface LoginService : BaseHttpClient

+ (instancetype)sharedService;

- (void)loginWithMobile:(NSString *)mobile PassWord:(NSString *)password Handler:(completionObjectHandler)handler;

@end
