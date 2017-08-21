//
//  LCTabBarController.h
//  LuoChang
//
//  Created by Rick on 15/4/29.
//  Copyright (c) 2015年 Rick. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LCTabbar.h"

@interface LCTabBarController : UITabBarController
@property(nonatomic,strong) UIView *mytabbar;
@property(nonatomic,strong) UIView *cameraView;
@property(nonatomic,strong) UIButton *cameraBtn;

//字体添加
-(void)changeNav:(NSInteger)from to:(NSInteger)to;

@end
