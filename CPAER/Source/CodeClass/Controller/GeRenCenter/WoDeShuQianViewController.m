//
//  WoDeShuQianViewController.m
//  CPAER
//
//  Created by 朱智红 on 2017/7/5.
//  Copyright © 2017年 zhuzh. All rights reserved.
//

#import "WoDeShuQianViewController.h"
#import "CAPSPageMenu.h"

@interface WoDeShuQianViewController ()
@property (nonatomic) CAPSPageMenu *pageMenu;
@property (weak, nonatomic) IBOutlet UIView *myView;

@end

@implementation WoDeShuQianViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    KuaiJiTableViewController *kuaiJiVC = [[KuaiJiTableViewController alloc] initWithNibName:@"KuaiJiTableViewController" bundle:nil];
    kuaiJiVC.tagFlag = 2;
    kuaiJiVC.title = @"会计";
    ShenJiTableViewController *shenJiVC = [[ShenJiTableViewController alloc] initWithNibName:@"ShenJiTableViewController" bundle:nil];
    shenJiVC.tagFlag = 2;
    shenJiVC.title = @"审计";
    CaiGuanTableViewController *caiGuanVC = [[CaiGuanTableViewController alloc] initWithNibName:@"CaiGuanTableViewController" bundle:nil];
    caiGuanVC.tagFlag = 2;
    caiGuanVC.title = @"财管";
    ShuiFaTableViewController *shuiFaVC = [[ShuiFaTableViewController alloc] initWithNibName:@"ShuiFaTableViewController" bundle:nil];
    shuiFaVC.tagFlag = 2;
    shuiFaVC.title = @"税法";
    JingJiFaTableViewController *jingJiFaVC = [[JingJiFaTableViewController alloc] initWithNibName:@"JingJiFaTableViewController" bundle:nil];
    jingJiFaVC.tagFlag = 2;
    jingJiFaVC.title = @"经济法";
    ZhanLueTableViewController *zhanLueVC = [[ZhanLueTableViewController alloc] initWithNibName:@"ZhanLueTableViewController" bundle:nil];
    zhanLueVC.tagFlag = 2;
    zhanLueVC.title = @"战略";
    
    NSArray *controllerArray = @[kuaiJiVC, shenJiVC, caiGuanVC, shuiFaVC, jingJiFaVC, zhanLueVC];
    NSDictionary *parameters = @{
                                 //头部背景色
                                 CAPSPageMenuOptionScrollMenuBackgroundColor: [UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:255.0/255.0 alpha:1.0],
                                 //未知？？？
                                 //                                 CAPSPageMenuOptionViewBackgroundColor: [UIColor colorWithRed:20.0/255.0 green:20.0/255.0 blue:20.0/255.0 alpha:1.0],
                                 //头部选中标签底部线条颜色
                                 CAPSPageMenuOptionSelectionIndicatorColor: Color_BaseColor,
                                 //头部整个底部线条的颜色
                                 CAPSPageMenuOptionBottomMenuHairlineColor: [UIColor colorWithRed:238.0/255.0 green:238.0/255.0 blue:238.0/255.0 alpha:1.0],
                                 //未知？？？
                                 //                                 CAPSPageMenuOptionMenuItemSeparatorColor: [UIColor redColor],
                                 //头部选中标签的颜色
                                 CAPSPageMenuOptionSelectedMenuItemLabelColor: Color_BaseColor,
                                 //头部选未中标签的颜色
                                 CAPSPageMenuOptionUnselectedMenuItemLabelColor: [UIColor colorWithRed:153.0/255.0 green:153.0/255.0 blue:153.0/255.0 alpha:1.0],
                                 //                                 CAPSPageMenuOptionUseMenuLikeSegmentedControl: [UIColor redColor],
                                 
                                 //头部标签字体大小
                                 CAPSPageMenuOptionMenuItemFont: [UIFont fontWithName:@"HelveticaNeue" size:13.0 * PxWidth7P],
                                 //头部高度
                                 CAPSPageMenuOptionMenuHeight: @(40.0 * PxWidth7P),
                                 //相邻选中标签底部横线的距离
                                 CAPSPageMenuOptionMenuItemWidth: @(90.0 * PxWidth7P),
                                 CAPSPageMenuOptionCenterMenuItems: @(YES)
                                 };
    _pageMenu = [[CAPSPageMenu alloc] initWithViewControllers:controllerArray frame:CGRectMake(0.0, 0.0, self.view.frame.size.width, self.view.frame.size.height) options:parameters];
    [_myView addSubview:_pageMenu.view];
    [_pageMenu.view setFrame:_myView.bounds];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    [super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    [super viewWillDisappear:animated];
}
//返回Btn
- (IBAction)leftBtnClick:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
