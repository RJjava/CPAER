//
//  UIViewController+Utils.m
//  WXCJInvestAdviser
//
//  Created by John Men on 16/9/1.
//  Copyright © 2016年 stockstar. All rights reserved.
//

#import "UIViewController+Utils.h"
#import "AppDelegate.h"
#import "MBProgressHUD.h"

@implementation UIViewController (Utils)

- (void)ss_showMsg:(NSString *)msg
{
    [self ss_showMsg:msg completionBlock:nil];
}

- (void)ss_showMsg:(NSString *)msg completionBlock:(void (^)())block
{
    [self ss_showMsg:msg afterDelay:1.f completionBlock:nil];
}

- (void)ss_showMsg:(NSString *)msg afterDelay:(CGFloat)delay completionBlock:(void (^)())block {
    if (!msg || [msg isEqualToString:@""]) {
        return;
    }
    UIView *containerView = [self window];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:containerView animated:YES];
    hud.mode = MBProgressHUDModeText;
    // Looks a bit nicer if we make it square.
    hud.square = NO;//YES;
    hud.bezelView.color = [UIColor colorWithRed:0.0/255.0 green:0.0/255.0 blue:0.0/255.0 alpha:0.6];
    //    hud.label.textColor = [UIColor whiteColor];
    //    hud.label.text = msg;
    hud.detailsLabel.textColor = [UIColor whiteColor];
    hud.detailsLabel.text = msg;
    hud.detailsLabel.font = [UIFont systemFontOfSize:15];
    
    [hud hideAnimated:YES afterDelay:delay];
    hud.completionBlock = block;
}

#pragma mark - Spinner

- (void)ss_showSpinner
{
    MBProgressHUD *v = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    v.bezelView.color = [UIColor colorWithRed:0.0/255.0 green:0.0/255.0 blue:0.0/255.0 alpha:0.6];
}

- (void)ss_hideSpinner
{
    [MBProgressHUD hideHUDForView:self.view animated:YES];
}

#pragma mark - 

- (UIWindow *)window
{
    NSArray *windows = [UIApplication sharedApplication].windows;
    if (windows.count > 1) {
        return windows[1];
    }
    return [windows firstObject];
}

@end
