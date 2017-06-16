//
//  UIViewController+Utils.h
//  WXCJInvestAdviser
//
//  Created by John Men on 16/9/1.
//  Copyright © 2016年 stockstar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Utils)

- (void)ss_showMsg:(NSString *)msg;
- (void)ss_showMsg:(NSString *)msg completionBlock:(void (^)())block;
- (void)ss_showMsg:(NSString *)msg afterDelay:(CGFloat)delay completionBlock:(void (^)())block;


- (void)ss_showSpinner;
- (void)ss_hideSpinner;

@end
