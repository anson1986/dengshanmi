//
//  XMTimer.h
//  XMTimer
//
//  Created by fly on 03/02/2020.
//  Copyright © 2020 seven. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/**
 XMTimer is a thread-safe timer based on GCD. It has similar API with `NSTimer`.
 XMTimer object differ from NSTimer in a few ways:
 
 * It use GCD to produce timer tick, and won't be affected by runLoop.
 * It always fire on main thread.
 * It's can be setting setControl, will follow the life cycle to release the timer.
 * It's always repeats, If want repeats isEqual false,please when the callback set timer pause.
 
 (1) setControl will manage the lifeCycle
    [[XMTimer timerWithTimeInterval:3 block:^(XMTimer * _Nonnull timer) {
    /// todo
    }].setFirstResponse(true).setControl(self) fire];
 (2) initialize a timer
    self.timer = [[XMTimer timerWithTimeInterval:3 block:^(XMTimer * _Nonnull timer) {
     /// todo
    }].setFirstResponse(true) fire];

 */

@interface XMTimer : NSObject

typedef void(^XMTimerBlock)(XMTimer * timer);

+ (XMTimer *)timerWithTimeInterval:(NSTimeInterval)interval
                             block:(XMTimerBlock)block;

- (XMTimer *(^)(BOOL firstResponse))setFirstResponse;
- (XMTimer *(^)(NSObject * control))setControl;

- (XMTimer *)fire;
- (void)pause;

- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;

@property (readonly) NSTimeInterval timeInterval;
@property (readonly, getter=isValid) BOOL valid;
/// callback executions times
@property (readonly) NSUInteger times;

@end

NS_ASSUME_NONNULL_END
