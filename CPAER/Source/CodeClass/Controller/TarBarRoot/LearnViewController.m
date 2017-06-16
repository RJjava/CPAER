//
//  LearnViewController.m
//  CPAER
//
//  Created by 姜云亭 on 2017/5/14.
//  Copyright © 2017年 zhuzh. All rights reserved.
//

#import "LearnViewController.h"
#import "LoginViewController.h"

@interface LearnViewController ()

@end

@implementation LearnViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated{
//    [self presentLoginVC];
}
/**
 跳转登陆页面
 */
- (void)presentLoginVC{
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    LoginViewController *loginVC = [storyBoard instantiateViewControllerWithIdentifier:@"LoginVC"];
    [self presentViewController:loginVC animated:NO completion:nil];
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
