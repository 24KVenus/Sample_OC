//
//  UIManager.h
//  VegetarianBoard
//
//  Created by 郭 奕杰 on 2016/10/26.
//  Copyright © 2016年 CCHT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UIManager : NSObject
#pragma mark - UIButton
//创建UIButton
+ (void)addButton:(UIButton *)button inView:(UIView *)view withFrame:(CGRect)frame backgroundImage:(UIImage *)bgImage image:(UIImage *)image  forState:(UIControlState)state target:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents;
//创建UIButton
+ (void)addButton:(UIButton *)button inView:(UIView *)view withFrame:(CGRect)frame backgroundColor:(UIColor *)bgColor cornerRadius:(CGFloat)radius borderColor:(CGColorRef)color borderWidth:(CGFloat)width title:(NSString *)title titleColor:(UIColor *)tColor forState:(UIControlState)state target:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents;
//创建UIButton
+ (void)addButton:(UIButton *)button inView:(UIView *)view withFrame:(CGRect)frame target:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents;





//生成纯色的图片
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;
@end

