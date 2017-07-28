//
//  UIColor+ColorChange.h
//  CPAER
//
//  Created by 朱智红 on 2017/7/27.
//  Copyright © 2017年 zhuzh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (ColorChange)

// 颜色转换：iOS中（以#开头）十六进制的颜色转换为UIColor(RGB)
+ (UIColor *) colorWithHexString: (NSString *)color;

@end
