//
//  Manager.m
//  ShopOfSupplyChain
//
//  Created by Yijie Guo on 2/16/16.
//  Copyright © 2016 self. All rights reserved.
//

#import "Manager.h"

@implementation Manager

#pragma mark - 显示提示信息
//使用UIAlertController显示提示信息
+ (void)showAlertMessage:(NSString *)message inViewController:(UIViewController *)viewController {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil];
    [alert addAction:cancel];
    [viewController presentViewController:alert animated:YES completion:nil];
}
//使用UIAlertView显示提示信息
+ (void)showAlertMessage:(NSString *)message {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:message delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}

#pragma mark - 判断是否有网络链接
+ (BOOL)isNetworkAvailable {
    //AppDelegate中saveReachability:方法将该值存储到UserDefaults中,在无法联网的情况时会弹出AlertView提示
    NSNumber *object = [[NSUserDefaults standardUserDefaults] objectForKey:kUDK_NetworkState];
    BOOL connectionState = [object boolValue];
    return connectionState;
}



//设置状态栏颜色
//- (UIStatusBarStyle)preferredStatusBarStyle {
//    return UIStatusBarStyleLightContent;
//}


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

//根据字符串的内容及字体计算宽度
+ (float)getWidthOfString:(NSString *)string font:(UIFont *)font{
    NSDictionary *attributes = @{NSFontAttributeName:font};
    CGSize size = [string boundingRectWithSize:CGSizeMake(640, 500) options:NSStringDrawingTruncatesLastVisibleLine attributes:attributes context:nil].size;
    return size.width;
}

@end
