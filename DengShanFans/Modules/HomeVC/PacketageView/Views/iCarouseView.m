//
//  iCarouseView.m
//  XGameLover
//
//  Created by bifen on 2020/7/7.
//  Copyright © 2020 sport. All rights reserved.
//

#import "iCarouseView.h"
#import "iCarousel.h"
#import "XMTimer.h"

@interface iCarouseView ()<iCarouselDataSource,iCarouselDelegate>

@property (nonatomic, strong) iCarousel *carouselView;

@property (nonatomic, strong) XMTimer *timer;

@end

@implementation iCarouseView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self == [super initWithFrame:frame]) {
    }
    
    return self;
}

- (void)showView {
    self.backgroundColor = [UIColor whiteColor];
    [self carouselView];
}

#pragma mark -- getter
- (iCarousel *)carouselView {
    if (!_carouselView) {
        _carouselView = [iCarousel new];
        _carouselView.type = iCarouselTypeCoverFlow;
        _carouselView.bounces = NO;
        _carouselView.pagingEnabled = YES;
        _carouselView.dataSource = self;
        _carouselView.delegate = self;
        [self addSubview:_carouselView];
        [_carouselView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.trailing.equalTo(self);
            make.top.equalTo(self).offset(12);
            make.bottom.equalTo(self).offset(-12);
        }];
    }
    return _carouselView;
}

#pragma mark -- Method
- (void)reloadData {
    [self.carouselView reloadData];
}

- (void)setAutoScroll:(BOOL)autoScroll {
    [self.timer pause];
    
    if (self.carouselView.numberOfItems > 0) {
        if (autoScroll) {
//            @weakify(self)
            self.timer = [[XMTimer timerWithTimeInterval:3 block:^(XMTimer * _Nonnull timer) {
//                strongify_Or_Return(self)
                NSInteger idx = self.carouselView.currentItemIndex + 1;
                [self.carouselView scrollToItemAtIndex:idx animated:YES];
            }] fire];
        } else {
            [self.timer pause];
        }
    }
}

#pragma mark - iCarouselDataSource
- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel {
    return self.listArray.count;
}

- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(nullable UIView *)view {

    if ([view isKindOfClass:[UIImageView class]]) {
        ((UIImageView *)view).image = [UIImage imageNamed:self.listArray[index]];
        return view;
    }
    UIImageView *imageView = [UIImageView new];
    imageView.frame = CGRectMake(0, 0, WindowWidth - 24.0, 240);
    imageView.backgroundColor = UIColor.greenColor;
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    imageView.layer.cornerRadius = 5.0;
    imageView.layer.masksToBounds = YES;
//    imageView.my_thumbnailSize = imageView.frame.size;
//    imageView.my_imageURL = [NSURL URLWithString:model.mediaUrl];
    imageView.image = [UIImage imageNamed:self.listArray[index]];
    return imageView;
}


@end
