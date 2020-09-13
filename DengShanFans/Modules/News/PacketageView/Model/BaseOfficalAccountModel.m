//
//  BaseOfficalAccountModel.m
//  XGameLover
//
//  Created by bifen on 2020/7/6.
//  Copyright © 2020 sport. All rights reserved.
//

#import "BaseOfficalAccountModel.h"

@implementation BaseOfficalAccountModel

- (NSMutableArray *)detailArray {
    if (!_detailArray) {
        _detailArray = [[NSMutableArray alloc] init];
    }
    
    return _detailArray;
}

@end
