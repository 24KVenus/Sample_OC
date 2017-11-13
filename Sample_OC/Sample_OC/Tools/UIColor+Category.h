//
//  UIColor+Category.h
//  Sample
//
//  Created by Yijie Guo on 1/7/16.
//  Copyright © 2016 self. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Category)

//十六进制颜色
+ (UIColor *)colorWithHexValue:(NSUInteger)hexValue;
+ (UIColor *)colorWithHexValue:(NSUInteger)hexValue alpha:(CGFloat)alpha;
@end
