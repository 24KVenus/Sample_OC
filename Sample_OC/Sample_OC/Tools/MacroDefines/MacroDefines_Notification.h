//
//  MacroDefines_Notification.h
//  Sample
//
//  Created by Yijie Guo on 1/7/16.
//  Copyright © 2016 self. All rights reserved.
//

#ifndef MacroDefines_Notification_h
#define MacroDefines_Notification_h



#undef kNotification_POST
#define kNotification_POST(Name, Object) [[NSNotificationCenter defaultCenter] postNotificationName:Name object:Object]

#undef kNotification_ADD
#define kNotification_ADD(Observer, Selector, Name, Object) [[NSNotificationCenter defaultCenter] addObserver:Observer selector:@selector(Selector) name:Name object:Object]

#undef kNotification_REMOVE
#define kNotification_REMOVE(Observer) [[NSNotificationCenter defaultCenter] removeObserver:Observer]



#endif /* MacroDefines_Notification_h */
