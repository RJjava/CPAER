//
//  BaseViewController.m
//  LiveRoom
//
//  Created by John Men on 16/3/29.
//  Copyright © 2016年 StockStar. All rights reserved.
//

#import "BaseViewController.h"
#import "AppDelegate.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    //去掉底部线条
//    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
//    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor whiteColor]}];
//
//    self.view.backgroundColor = [self backgroundColor];
//    
//    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
//    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
//    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"backward"] style:UIBarButtonItemStylePlain target:nil action:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (UIColor *)backgroundColor
{
    return [UIColor redColor];
}

#pragma mark -

- (void)showMsg:(NSString *)msg
{
    [self ss_showMsg:msg];
}

- (void)showMsg:(NSString *)msg completionBlock:(void (^)())block
{
    [self ss_showMsg:msg completionBlock:block];
}

- (void)showMsg:(NSString *)msg afterDelay:(CGFloat)delay completionBlock:(void (^)())block
{
    [self ss_showMsg:msg afterDelay:delay completionBlock:block];
}

- (UIWindow *)window
{
    return [[UIApplication sharedApplication].delegate window];
}


#pragma mark - Spinner

- (void)showSpinner
{
    [self ss_showSpinner];
}

- (void)hideSpinner
{
    [self ss_hideSpinner];
}

#pragma mark - 隐藏tabbar
- (void)hideTabBar {
    if (self.tabBarController.tabBar.hidden == YES) {
        return;
    }
    UIView *contentView;
    if ( [[self.tabBarController.view.subviews objectAtIndex:0] isKindOfClass:[UITabBar class]] )
        contentView = [self.tabBarController.view.subviews objectAtIndex:1];
    else
        contentView = [self.tabBarController.view.subviews objectAtIndex:0];
    contentView.frame = CGRectMake(contentView.bounds.origin.x,  contentView.bounds.origin.y,  contentView.bounds.size.width, contentView.bounds.size.height + self.tabBarController.tabBar.frame.size.height);
    self.tabBarController.tabBar.hidden = YES;
    
}

#pragma mark - 显示tabbar
- (void)showTabBar{
    if (self.tabBarController.tabBar.hidden == NO)
    {
        return;
    }
    UIView *contentView;
    if ([[self.tabBarController.view.subviews objectAtIndex:0] isKindOfClass:[UITabBar class]])
        
        contentView = [self.tabBarController.view.subviews objectAtIndex:1];
    
    else
        
        contentView = [self.tabBarController.view.subviews objectAtIndex:0];
    contentView.frame = CGRectMake(contentView.bounds.origin.x, contentView.bounds.origin.y,  contentView.bounds.size.width, contentView.bounds.size.height - self.tabBarController.tabBar.frame.size.height);
    self.tabBarController.tabBar.hidden = NO;
    
}

@end
