//
//  RegisterService.h
//  RealmTest
//
//  Created by 刘赞 on 2017/5/13.
//  Copyright © 2017年 stockstar. All rights reserved.
//

#import "BaseHttpClient.h"

@interface RegisterService : BaseHttpClient

+ (instancetype)sharedService;

- (void)registerWithMobile:(NSString *)mobile IdentifyCode:(NSString *)code PassWord:(NSString *)password UserType:(NSString *) usertype Handler:(completionObjectHandler)handler;

@end
