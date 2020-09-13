//
//  XMTimer.m
//  XMTimer
//
//  Created by fly on 03/02/2020.
//  Copyright © 2020 seven. All rights reserved.
//

#import "XMTimer.h"
#import <objc/runtime.h>

@interface XMTimer ()

@property (nonatomic, copy) XMTimerBlock block;
@property (nonatomic, assign) NSTimeInterval timeInterval;
@property (nonatomic, assign) BOOL valid;
@property (nonatomic, assign) NSUInteger times;
@property (nonatomic, assign) BOOL firstResponse;
@property (nonatomic, weak) NSObject * control;

@end

@implementation XMTimer {
    dispatch_source_t _source;
    dispatch_semaphore_t _lock;
}

+ (XMTimer *)timerWithTimeInterval:(NSTimeInterval)interval
                             block:(XMTimerBlock)block {
    NSAssert(block, @"timer block can't be nil");

    XMTimer * timer = [[XMTimer alloc] init];
    timer.timeInterval = interval;
    timer.block = block;
    return timer;
}

- (XMTimer *(^)(BOOL firstResponse))setFirstResponse {
    return ^XMTimer * (BOOL firstResponse) {
        self.firstResponse = firstResponse;
        return self;
    };
}

- (XMTimer *(^)(NSObject * control))setControl {
    return ^XMTimer * (NSObject * control) {
        NSAssert(control, @"timer control can't be nil");
        self.control = control;

        NSString * hashString = [NSString stringWithFormat:@"%ld",(long)self.hash];
        char * hashChar = (char *)[hashString UTF8String];
        objc_setAssociatedObject(control, hashChar, self, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        
        return self;
    };
}

- (XMTimer *)fire {
    _valid = YES;
    NSTimeInterval start = self.firstResponse ? 0 : self.timeInterval;
    
    __weak typeof(self) _self = self;
    _lock = dispatch_semaphore_create(1);
    _source = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_main_queue());
    dispatch_source_set_timer(_source, dispatch_time(DISPATCH_TIME_NOW, (start * NSEC_PER_SEC)), (_timeInterval * NSEC_PER_SEC), 0);
    dispatch_source_set_event_handler(_source, ^{[_self callback];});
    dispatch_resume(_source);

    self.firstResponse = false;
    return self;
}

- (void)pause {
    if (!_valid) return;
    dispatch_semaphore_wait(_lock, DISPATCH_TIME_FOREVER);
    dispatch_source_cancel(_source);
    _source = NULL;
    _valid = NO;
    dispatch_semaphore_signal(_lock);
}

- (void)callback {
    self.times ++;
    !_block ?: _block(self);
}

@end
