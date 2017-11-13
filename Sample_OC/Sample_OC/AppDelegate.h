//
//  AppDelegate.h
//  Sample_OC
//
//  Created by 郭 奕杰 on 2017/11/13.
//  Copyright © 2017年 GYJ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

