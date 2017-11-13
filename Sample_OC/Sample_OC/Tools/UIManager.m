//
//  UIManager.m
//  VegetarianBoard
//
//  Created by 郭 奕杰 on 2016/10/26.
//  Copyright © 2016年 CCHT. All rights reserved.
//

#import "UIManager.h"

@implementation UIManager
#pragma mark - UIButton
//创建UIButton
+ (void)addButton:(UIButton *)button inView:(UIView *)view withFrame:(CGRect)frame backgroundImage:(UIImage *)bgImage image:(UIImage *)image  forState:(UIControlState)state target:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents {
    
    if (button == nil) {
        button = [UIButton buttonWithType:UIButtonTypeSystem];
    }
    [view addSubview:button];
    if (!CGRectEqualToRect(frame, CGRectNull)) {
        button.frame = frame;
    }
    if (bgImage != nil) {
        [button setBackgroundImage:bgImage forState:state];
    }
    if (image != nil) {
        [button setImage:image forState:state];
    }
    [button addTarget:target action:action forControlEvents:controlEvents];
}

//创建UIButton
+ (void)addButton:(UIButton *)button inView:(UIView *)view withFrame:(CGRect)frame backgroundColor:(UIColor *)bgColor cornerRadius:(CGFloat)radius borderColor:(CGColorRef)color borderWidth:(CGFloat)width title:(NSString *)title titleColor:(UIColor *)tColor forState:(UIControlState)state  target:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents {
//    MYLog(@"UIManager addButton");
    if (button == nil) {
        button = [UIButton buttonWithType:UIButtonTypeSystem];
    }
    [view addSubview:button];
    if (!CGRectEqualToRect(frame, CGRectNull)) {
        button.frame = frame;
    }
    if (bgColor != nil) {
        button.backgroundColor = bgColor;
    }
    if (title != nil) {
        [button setTitle:title forState:state];
    }
    if (tColor != nil) {
        [button setTitleColor:tColor forState:state];
    }
    
    button.layer.cornerRadius = radius;
    button.layer.borderColor = color;
    button.layer.borderWidth = width;
    button.layer.masksToBounds = YES;
    [button addTarget:target action:action forControlEvents:controlEvents];
}

//创建UIButton
+ (void)addButton:(UIButton *)button inView:(UIView *)view withFrame:(CGRect)frame target:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents {
    //    MYLog(@"UIManager addButton");
    if (button == nil) {
        button = [UIButton buttonWithType:UIButtonTypeSystem];
    }
    [view addSubview:button];
    if (!CGRectEqualToRect(frame, CGRectNull)) {
        button.frame = frame;
    }
    button.layer.masksToBounds = YES;
    [button addTarget:target action:action forControlEvents:controlEvents];
}

#pragma mark - UILabel
//创建UIButton
+ (UILabel *)addLabel:(UILabel *)label withFrame:(CGRect)frame text:(NSString *)text {
    //    MYLog(@"UIManager addButton");
    if (label == nil) {
        label = [[UILabel alloc] init];
    }
    
    if (!CGRectEqualToRect(frame, CGRectNull)) {
        label.frame = frame;
//        [view addSubview:label];
        label.text = text;
    }
    return label;
}

//创建UILabel
+ (UILabel *)addLabel:(UILabel *)label withFrame:(CGRect)frame text:(NSString *)text texAlignment:(NSTextAlignment)texAlignment {
    //    MYLog(@"UIManager addButton");
    if (label == nil) {
        label = [[UILabel alloc] init];
    }
    
    if (!CGRectEqualToRect(frame, CGRectNull)) {
        label.frame = frame;
        //        [view addSubview:label];
        label.text = text;
        label.textAlignment = texAlignment;
    }
    return label;
}


//创建UILabel
//+ (UILabel *)addLabel:(UILabel *)label withFrame:(CGRect)frame text:(NSString *)text texAlignment:(NSTextAlignment)texAlignment {
//    //    MYLog(@"UIManager addButton");
//    if (label == nil) {
//        label = [[UILabel alloc] init];
//    }
//    
//    if (!CGRectEqualToRect(frame, CGRectNull)) {
//        label.frame = frame;
//        //        [view addSubview:label];
//        label.text = text;
//        label.textAlignment = texAlignment;
//    }
//    return label;
//}



//[_userName setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"]

//生成纯色的图片
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size {
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}
@end
