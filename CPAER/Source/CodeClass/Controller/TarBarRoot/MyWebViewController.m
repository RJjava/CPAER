//
//  MyWebViewController.m
//  CPAER
//
//  Created by 朱智红 on 2017/8/25.
//  Copyright © 2017年 zhuzh. All rights reserved.
//

#import "MyWebViewController.h"

@interface MyWebViewController ()<UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UIView *leftV;
@property (weak, nonatomic) IBOutlet UIImageView *leftImageV;//左侧图片
@property (weak, nonatomic) IBOutlet UIButton *leftBtn;//左侧Btn
@property (weak, nonatomic) IBOutlet UILabel *titleLab;//标题
@property (weak, nonatomic) IBOutlet UIImageView *rightImageV;//右侧图片
@property (weak, nonatomic) IBOutlet UIButton *rightBtn;//右侧Btn
@property (weak, nonatomic) IBOutlet UIWebView *webV;
@property (nonatomic,strong)MBProgressHUD *hud;//小菊花
@property (weak, nonatomic) IBOutlet UIView *rightV;

@end

@implementation MyWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [_leftImageV setImage:[UIImage imageNamed:_leftImageNameStr]];
    [_leftV setHidden:_isHideLeftV];
    _titleLab.text = _titleStr;
    [_rightImageV setImage:[UIImage imageNamed:_rightImageNameStr]];
    [_rightV setHidden:_isHideRightV];
    
    [self p_setupProgressHud];
    _webV.delegate = self;
    NSURL *urlTemp = [NSURL URLWithString:_urlStr];
    NSURLRequest * requestTemp = [NSURLRequest requestWithURL:urlTemp];
    [_webV loadRequest:requestTemp];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)viewWillAppear:(BOOL)animated{
    [self hideTabBar];
}
#pragma mark - UIWebView代理
-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    return YES;
}
- (void)webViewDidStartLoad:(UIWebView *)webView{
    
}
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    [_hud hideAnimated:YES];
}
//显示小菊花
- (void)p_setupProgressHud{
    _hud = [[MBProgressHUD alloc] initWithView:_webV];
    _hud.frame = _webV.bounds;
    _hud.minSize = CGSizeMake(100, 100);
    _hud.mode = MBProgressHUDModeIndeterminate;
    [_webV addSubview:_hud];
    [_hud showAnimated:YES];
}
//返回Btn
- (IBAction)leftBtnClick:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
//主页Btn
- (IBAction)rightBtnClick:(UIButton *)sender {
    [self showMsg:@"右侧Btn点击事件"];
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
