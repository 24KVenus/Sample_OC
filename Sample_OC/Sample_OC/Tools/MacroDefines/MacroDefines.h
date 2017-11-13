//
//  MacroDefines.h
//  Sample
//
//  Created by Yijie Guo on 1/7/16.
//  Copyright © 2016 self. All rights reserved.
//

#ifndef MacroDefines_h
#define MacroDefines_h

//#ifdef DEBUG
//#define MYLog(...) NSLog(__VA_ARGS__)
//#else
//#define MYLog(...)
//#endif


#ifdef DEBUG
#define  MYLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)
#else
#define MYLog(...)
#endif



#undef kSCREEN
#define kSCREEN [UIScreen mainScreen].bounds.size
#undef kHEIGHT_RATIO
#define kHEIGHT_RATIO [UIScreen mainScreen].bounds.size.height / 568 * .5
#undef kWIDTH_RATIO
#define kWIDTH_RATIO [UIScreen mainScreen].bounds.size.width / 320 * .5

#undef kProperty_NONATOMIC_STRONG
#define kProperty_NONATOMIC_STRONG(Class, Name) @property (nonatomic, strong) Class *Name;
#undef kProperty_NONATOMIC_WEAK
#define kProperty_NONATOMIC_WEAK(Class, Name) @property (nonatomic, weak) Class *Name;
#undef kProperty_NONATOMIC_COPY
#define kProperty_NONATOMIC_COPY(Class, Name) @property (nonatomic, copy) Class *Name;
#undef kProperty_NONATOMIC_ASSIGN
#define kProperty_NONATOMIC_ASSIGN(Class, Name) @property (nonatomic, assign) Class Name;
#undef kProperty_NONATOMIC_WEAK_ID_DELEGATE
#define kProperty_NONATOMIC_WEAK_ID_DELEGATE(DelegateName) @property (nonatomic, weak) id<DelegateName> delegate;
#endif /* MacroDefines_h */
