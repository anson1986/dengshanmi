//
//  BaseTabBarController.m
//  XGameLover
//
//  Created by bifen on 2020/7/6.
//  Copyright © 2020 sport. All rights reserved.
//

#import "BaseTabBarController.h"

@interface BaseTabBarController ()

@end

@implementation BaseTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupDatas];
    [self setupControllers];
    [self tabBarBaseStyle];
    [self tabBarItems];
}

- (void)tabBarBaseStyle {
    [self.tabBar setTintColor:MainColor];
    [[UITabBar appearance] setBackgroundImage:[self imageColor:MainColor]];
}

- (void)tabBarItems {
    for (int i=0; i < self.viewControllers.count; i ++) {
        UITabBarItem *item = [[UITabBarItem alloc] init];
        UIImage *itemImg = [self imageForView:[self tabBarUnselectLabel:self.items[i]]];
        UIImage *itemImg_selected = [self imageForView:[self tabBarSelectLabel:self.items[i]]];
        UIImage * normalImg = [itemImg imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        UIImage * selectImage = [itemImg_selected imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        item.image = normalImg;
        item.selectedImage = selectImage;
        item.imageInsets = UIEdgeInsetsMake(5, 0, -6, 0);
        self.viewControllers[i].tabBarItem = item;
    }
}

- (void)setupControllers {
    //子类重写
}

- (void)setupDatas {
    //子类重写
}

- (UIImage*)imageColor:(UIColor*) color
{
    CGRect rect=CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

- (UILabel *)tabBarUnselectLabel:(NSString *)string
{
    UILabel *temptext = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 50,BottomBarHeight)];
    temptext.text = string;
    temptext.textColor = [UIColor whiteColor];
    temptext.font = [UIFont boldSystemFontOfSize:17];
    temptext.textAlignment = 1;
    
    return temptext;
}

- (UIView *)tabBarSelectLabel:(NSString *)string
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50,BottomBarHeight)];
    UILabel *temptext = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 50,view.frame.size.height)];
    temptext.text = string;
    temptext.textColor = [UIColor whiteColor];
    temptext.font = [UIFont boldSystemFontOfSize:20];
    temptext.textAlignment = 1;
    [view addSubview:temptext];
    
    UIImageView *lineView = [[UIImageView alloc] initWithFrame:CGRectMake(10, view.frame.size.height - 3, 30, 3)];
    lineView.backgroundColor = [UIColor whiteColor];
    [view addSubview:lineView];
    
    return view;
}

- (UIImage *)imageForView:(UIView *)view{
    
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, NO, 0);
    
    if ([view respondsToSelector:@selector(drawViewHierarchyInRect:afterScreenUpdates:)]) {
        
        [view drawViewHierarchyInRect:view.bounds afterScreenUpdates:YES];
    }else{
        [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    }
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

@end
