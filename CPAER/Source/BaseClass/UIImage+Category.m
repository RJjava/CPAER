//
//  UIImage+Category.m
//  RealmTest
//
//  Created by 刘赞 on 2017/5/8.
//  Copyright © 2017年 stockstar. All rights reserved.
//

#import "UIImage+Category.h"

@implementation UIImage (Category)

+ (UIImage *)IMGCompressed:(UIImage *)image targetNewSize:(CGSize)newSize {
    UIGraphicsBeginImageContext(newSize);
    [image drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}
@end
