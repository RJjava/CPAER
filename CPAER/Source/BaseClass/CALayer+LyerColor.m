//
//  CALayer+LyerColor.m
//  CPAER
//
//  Created by 朱智红 on 2017/7/20.
//  Copyright © 2017年 zhuzh. All rights reserved.
//

#import "CALayer+LyerColor.h"

@implementation CALayer (LyerColor)

-(void)setBorderUIColor:(UIColor*)color
{
    self.borderColor = color.CGColor;
}

-(UIColor*)borderUIColor
{
    return [UIColor colorWithCGColor:self.borderColor];
}

//- (void)setBorderColorFromUIColor:(UIColor *)color{
//    self.borderColor = color.CGColor;
//}

@end
