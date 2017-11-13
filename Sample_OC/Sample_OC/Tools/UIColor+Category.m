//
//  UIColor+Category.m
//  Sample
//
//  Created by Yijie Guo on 1/7/16.
//  Copyright © 2016 self. All rights reserved.
//

#import "UIColor+Category.h"

@implementation UIColor (Category)

+ (UIColor *)colorWithHexValue:(NSUInteger)hexValue {
    NSUInteger a = ((hexValue >> 24) & 0x000000FF);
    float fa = ((0 == a) ? 1.0f : (a * 1.0f) / 255.0f);
    
    return [UIColor colorWithHexValue:hexValue alpha:fa];
}
+ (UIColor *)colorWithHexValue:(NSUInteger)hexValue alpha:(CGFloat)alpha {
    NSUInteger r = ((hexValue >> 16) & 0x000000FF);
    NSUInteger g = ((hexValue >> 8) & 0x000000FF);
    NSUInteger b = ((hexValue >> 0) & 0x000000FF);
    
    float fr = (r * 1.0f) / 255.0f;
    float fg = (g * 1.0f) / 255.0f;
    float fb = (b * 1.0f) / 255.0f;
    
    return [UIColor colorWithRed:fr green:fg blue:fb alpha:alpha];
}

@end
