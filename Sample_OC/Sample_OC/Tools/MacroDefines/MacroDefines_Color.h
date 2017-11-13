//
//  MacroDefines_Color.h
//  Sample
//
//  Created by Yijie Guo on 1/7/16.
//  Copyright © 2016 self. All rights reserved.
//

#ifndef MacroDefines_Color_h
#define MacroDefines_Color_h

#undef COLOR_RGB
#define COLOR_RGB(r, g, b) [UIColor colorWithRed:r / 255.0f green:g / 255.0f blue:b / 255.0f alpha:1]

#undef COLOR_RGBA
#define COLOR_RGBA(r, g, b, a) [UIColor colorWithRed:r / 255.0f green:g / 255.0f blue:b / 255.0f alpha:a / 255.0f]

#undef COLOR_HEX_RGB 
#define COLOR_HEX_RGB(hexValue) [UIColor colorWithHexValue:hexValue]

#undef COLOR_HEX_RGBA
#define COLOR_HEX_RGBA(hexValue, a) [UIColor colorWithHexValue:hexValue alpha:a]


//用于测试的颜色
#undef kColor_TestColor_R
#define kColor_TestColor_R [UIColor colorWithRed:1 green:0 blue:0 alpha:.5]
#undef kColor_TestColor_B
#define kColor_TestColor_B [UIColor colorWithRed:0 green:0 blue:1 alpha:.5]
#undef kColor_TestColor_G
#define kColor_TestColor_G [UIColor colorWithRed:0 green:1 blue:0 alpha:.5]


#undef kColor_White
#define kColor_White [UIColor whiteColor]// 1.0 white
#undef kColor_BlackColor
#define kColor_BlackColor [UIColor blackColor]// 0.0 white
#undef kColor_DarkGrayColor
#define kColor_DarkGrayColor [UIColor darkGrayColor]// 0.333 white
#undef kColor_LightGrayColor
#define kColor_LightGrayColor [UIColor lightGrayColor]// 0.667 white
#undef kColor_GrayColor
#define kColor_GrayColor [UIColor grayColor]// 0.5 white
#undef kColor_RedColor
#define kColor_RedColor [UIColor redColor]// 1.0, 0.0, 0.0 RGB
#undef kColor_GreenColor
#define kColor_GreenColor [UIColor greenColor]// 0.0, 1.0, 0.0 RGB
#undef kColor_BlueColor
#define kColor_BlueColor [UIColor blueColor]// 0.0, 0.0, 1.0 RGB
#undef kColor_CyanColor
#define kColor_CyanColor [UIColor cyanColor] // 0.0, 1.0, 1.0 RGB
#undef kColor_YellowColor
#define kColor_YellowColor [UIColor yellowColor]// 1.0, 1.0, 0.0 RGB
#undef kColor_MagentaColor
#define kColor_MagentaColor [UIColor magentaColor]// 1.0, 0.0, 1.0 RGB
#undef kColor_OrangeColor
#define kColor_OrangeColor [UIColor orangeColor]// 1.0, 0.5, 0.0 RGB
#undef kColor_PurpleColor
#define kColor_PurpleColor [UIColor purpleColor]// 0.5, 0.0, 0.5 RGB
#undef kColor_BrownColor
#define kColor_BrownColor [UIColor brownColor]// 0.6, 0.4, 0.2 RGB
#undef kColor_ClearColor
#define kColor_ClearColor [UIColor clearColor]// 0.0 white, 0.0 alpha

#endif /* MacroDefines_Color_h */
