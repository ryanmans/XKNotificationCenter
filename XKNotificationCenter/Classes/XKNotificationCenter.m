//
//  XKNotificationCenter.m
//  test
//
//  Created by ALLen、 LAS on 2019/2/16.
//  Copyright © 2019年 ALLen、 LAS. All rights reserved.
//

#import "XKNotificationCenter.h"

//消息对象集合
static NSMutableDictionary *_allObserverTask;

@interface XKNotificationObserver : NSObject
@property (nonatomic,weak,readonly)id observer;
@end

@implementation XKNotificationObserver

+ (XKNotificationObserver*)xk_NotificationObserver:(id)observer{
    return [[XKNotificationObserver alloc] initWithObserver:observer];
}

- (instancetype)initWithObserver:(id)observer
{
    self = [super init];
    if (self) {
        _observer = observer;
    }
    return self;
}
@end

@implementation XKNotificationCenter

//存储着所有的请求task数组
+ (NSMutableDictionary *)allObserverTask {
    if (!_allObserverTask) {
        _allObserverTask = [[NSMutableDictionary alloc] init];
    }
    return _allObserverTask;
}

//添加消息监听对象
+ (void)xk_AddNotificationObserver:(id<XKNotificationCenterDelegate>)delegate name:(NSString *)name{
    XKNotificationObserver * observer = [XKNotificationObserver xk_NotificationObserver:delegate];
    NSMutableArray * groups = [self allObserverTask][name];
    if (!groups) {
        groups = [NSMutableArray new];
        [[self allObserverTask] setObject:groups forKey:name];
    }
    [groups addObject:observer];
}

//发送消息
+ (void)xk_PostNotification:(NSString *)name parameters:(id)parameters{

    if ([NSThread isMainThread]) {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            [self xk_PostNotification:name parameters:parameters];
        });
        return;
    }
    
    NSMutableArray * groups = [self allObserverTask][name];
    [groups enumerateObjectsUsingBlock:^(XKNotificationObserver *  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        id<XKNotificationCenterDelegate>delegate = obj.observer;
        [delegate xk_ReceivedNotificationName:name observer:obj.observer parameters:parameters];
    }];
}
@end
