//
//  BaseViewController.h
//  LiveRoom
//
//  Created by John Men on 16/3/29.
//  Copyright © 2016年 StockStar. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "ViewConstants.h"
#import "MBProgressHUD.h"
//#import "SuccessViewManager.h"
//#import "PrintLog.h"
#import "UIViewController+Utils.h"

@interface BaseViewController : UIViewController

- (UIColor *)backgroundColor;


- (void)showMsg:(NSString *)msg;
- (void)showMsg:(NSString *)msg completionBlock:(void (^)())block;
- (void)showMsg:(NSString *)msg afterDelay:(CGFloat)delay completionBlock:(void (^)())block;


- (void)showSpinner;
- (void)hideSpinner;

- (void)hideTabBar;
- (void)showTabBar;

@end
