//
//  SheQuViewController.m
//  CPAER
//
//  Created by 朱智红 on 2017/9/6.
//  Copyright © 2017年 zhuzh. All rights reserved.
//

#import "SheQuViewController.h"

@interface SheQuViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *headScrollV;

@end

@implementation SheQuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _typeFlag = 201;//默认是第一个
    [self P_refreshHeadScrollView];
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
//头部Btn点击事件（类型切换）
- (IBAction)typeBtnClick:(UIButton *)sender {
    if (_typeFlag != sender.tag) {
        _typeFlag = sender.tag;
        [self P_refreshHeadScrollView];
    }
}

//刷新头部选中标签
- (void)P_refreshHeadScrollView{
    NSArray *selectHeadImgNameArr = @[@"kemu1", @"kemu2", @"kemu3", @"kemu4", @"kemu5", @"kemu6",];
    NSArray *unSelectHeadImgNameArr =@[@"kemu1_1", @"kemu2_1", @"kemu3_1", @"kemu4_1", @"kemu5_1", @"kemu6_1",];
    for (int i = 201; i <= 206; i++) {
        UIView *tempView = [_headScrollV viewWithTag:i].superview;
        UIImageView *typeImgV = [tempView viewWithTag:101];//图片
        [typeImgV setImage:[UIImage imageNamed:i == _typeFlag ? [selectHeadImgNameArr objectAtIndex:i-201] : [unSelectHeadImgNameArr objectAtIndex:i-201] ]];
        UILabel *titleLab = [tempView viewWithTag:102];//名称
        titleLab.textColor = [UIColor colorWithHexString:i == _typeFlag ? @"00ccff" : @"999999"];
        UIView *bottomLineV = [tempView viewWithTag:103];//底部线条
        bottomLineV.backgroundColor = [UIColor colorWithHexString:i == _typeFlag ? @"00ccff" : @"eeeeee"];
    }
}

@end
