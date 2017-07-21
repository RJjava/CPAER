//
//  KuaiJiTableViewController.h
//  CPAER
//
//  Created by 朱智红 on 2017/6/27.
//  Copyright © 2017年 zhuzh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KuaiJiTableViewController : UITableViewController

//标识是哪个页面出现的
/*
 1,个人详情页
 2,我的书签
 */
@property (assign, nonatomic) NSInteger tagFlag;

@end
