//
//  XKNotificationCenter.h
//  test
//
//  Created by ALLen、 LAS on 2019/2/16.
//  Copyright © 2019年 ALLen、 LAS. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol XKNotificationCenterDelegate <NSObject>

/**
 *  接收消息(异步)
 *
 *  @param name      消息类型
 *  @param observer   监听消息的对象
 *  @param parameters   发送的参数
 */
- (void)xk_ReceivedNotificationName:(NSString*)name observer:(id)observer parameters:(id _Nullable)parameters;

@end


//消息中心(代理传递消息)
@interface XKNotificationCenter : NSObject

/**
 *  添加监听者
 *
 *  @param delegate   监听对象
 *  @param name      消息类型
 */
+ (void)xk_AddNotificationObserver:(id<XKNotificationCenterDelegate>)delegate name:(NSString *)name;

/**
 *  发送消息(异步)
 *
 *  @param name         消息类型
 *  @param parameters   发送的参数
 */
+ (void)xk_PostNotification:(NSString *)name parameters:(id _Nullable)parameters;

@end

NS_ASSUME_NONNULL_END
