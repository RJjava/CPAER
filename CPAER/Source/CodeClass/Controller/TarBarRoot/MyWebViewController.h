//
//  MyWebViewController.h
//  CPAER
//
//  Created by 朱智红 on 2017/8/25.
//  Copyright © 2017年 zhuzh. All rights reserved.
//

#import "BaseViewController.h"

@interface MyWebViewController : BaseViewController
@property (strong, nonatomic) NSString *leftImageNameStr;
@property (assign, nonatomic) BOOL isHideLeftV;
@property (strong, nonatomic) NSString *titleStr;
@property (strong, nonatomic) NSString *rightImageNameStr;
@property (assign, nonatomic) BOOL isHideRightV;
@property (strong, nonatomic) NSString *urlStr;

@end
