//
//  iCarouseView.h
//  XGameLover
//
//  Created by bifen on 2020/7/7.
//  Copyright © 2020 sport. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface iCarouseView : UIView

@property (nonatomic, strong) NSMutableArray *listArray;

@property (nonatomic, assign) BOOL autoScroll;

- (void)showView;

- (void)reloadData;

@end

NS_ASSUME_NONNULL_END
