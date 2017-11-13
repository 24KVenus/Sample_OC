//
//  UIButtonSample.m
//  Sample
//
//  Created by 郭 奕杰 on 16/8/8.
//  Copyright © 2016年 self. All rights reserved.
//

#import "UIButtonSample.h"

@implementation UIButtonSample

- (void)addButton:(UIButton *)button inView:(UIView *)view withFrame:(CGRect)frame cornerRadius:(CGFloat)radius borderColor:(CGColorRef)color borderWidth:(CGFloat)width title:(NSString *)title forState:(UIControlState)state  target:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents {
    
    if (button == nil) {
        button = [UIButton buttonWithType:UIButtonTypeSystem];
    }
    [view addSubview:button];
    button.frame = frame;
    [button setTitle:title forState:state];
    button.layer.cornerRadius = radius;
    button.layer.borderColor = color;
    button.layer.borderWidth = width;
    button.layer.masksToBounds = YES;
    [button addTarget:target action:action forControlEvents:controlEvents];
}


- (void)addButton:(UIButton *)button inView:(UIView *)view withFrame:(CGRect)frame backgroundImage:(UIImage *)bgImage image:(UIImage *)image forState:(UIControlState)state  target:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents {
    
    if (button == nil) {
        button = [UIButton buttonWithType:UIButtonTypeSystem];
    }
    [view addSubview:button];
    button.frame = frame;
    if (bgImage != nil) {
        [button setBackgroundImage:bgImage forState:state];
    }
    if (image != nil) {
        [button setImage:image forState:state];
    }
    [button addTarget:target action:action forControlEvents:controlEvents];
}

@end
