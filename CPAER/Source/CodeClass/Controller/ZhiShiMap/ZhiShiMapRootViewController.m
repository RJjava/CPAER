//
//  ZhiShiMapRootViewController.m
//  CPAER
//
//  Created by 朱智红 on 2017/7/25.
//  Copyright © 2017年 zhuzh. All rights reserved.
//

#import "ZhiShiMapRootViewController.h"

@interface ZhiShiMapRootViewController ()

@end

@implementation ZhiShiMapRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
//返回Btn
- (IBAction)leftBtnClick:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
@end
