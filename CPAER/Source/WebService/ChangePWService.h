//
//  ChangePWService.h
//  CPAER
//
//  Created by 刘赞 on 2017/6/21.
//  Copyright © 2017年 zhuzh. All rights reserved.
//

#import "UserIdHttpClicent.h"

@interface ChangePWService : UserIdHttpClicent

+ (instancetype)sharedService;

- (void)updatePasswordWithOldPW:(NSString *)oldPW
                          NewPW:(NSString *)newPW
                        Handler:(completionHandler)handler;

- (void)forgetPasswordWithMobile:(NSString *)mobile
                    IdentifyCode:(NSString *)code
                           NewPW:(NSString *)newPW
                         Handler:(completionHandler)handler;

@end
