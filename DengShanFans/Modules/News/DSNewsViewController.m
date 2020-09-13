//
//  DSNewsViewController.m
//  DengShanFans
//
//  Created by bifen on 2020/7/8.
//  Copyright © 2020 obj. All rights reserved.
//

#import "DSNewsViewController.h"
#import "BaseWechatOfficialAccountView.h"
#import "BaseOfficalAccountModel.h"

@interface DSNewsViewController ()

@property (nonatomic, strong) BaseWechatOfficialAccountView *officialAccountView;
@property (nonatomic, strong) NSMutableArray *listArray;

@end

@implementation DSNewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.p_title = @"登山迷新闻";
    self.backItem.hidden = YES;
    [self setupBgView];
}

- (void)setupBgView {
self.officialAccountView = [[BaseWechatOfficialAccountView alloc] initWithFrame:CGRectZero];
[self.view addSubview:self.officialAccountView];
[self.officialAccountView mas_makeConstraints:^(MASConstraintMaker *make) {
make.edges.equalTo(self.view); }];
self.officialAccountView.listArray = self.listArray; [self.officialAccountView showView];
}

- (NSMutableArray *)listArray { if (!_listArray) {
_listArray = [[NSMutableArray alloc] init]; NSArray *respArray = @[
@{@"headImg":@"news_0",@"content":@[ @{@"icon":@"news_icon_0",@"desc":@"中国2020珠峰高程测量登山队员成功登顶"}, @{@"icon":@"news_icon_1",@"desc":@"日限20人.没外国客.收费高，金山登山团热不起"}, @{@"icon":@"news_icon_2",@"desc":@"登山失聯2日 屏安醫院副院長持續搜救中"}, ]},
@{@"headImg":@"news_1",@"content":@[ @{@"icon":@"news_icon_3",@"desc":@"登山经验不足或不习惯日本山的，建议让当地的登山导游带你去爬山。大町有在日本第一个设立的登山导游协会。"}, @{@"icon":@"news_icon_4",@"desc":@"香港茅山師傅自述最驚嚇經驗：在富士山最猛鬼旅館意外靈魂出竅"},
@{@"icon":@"news_icon_5",@"desc":@"一起爬山吗？不带秦昊的那种！"},
]}, ];
for (int i = 0; i < respArray.count; i++) {
BaseOfficalAccountModel *model = [[BaseOfficalAccountModel alloc]
init];
NSDictionary *tmpDict = respArray[i]; model.headImgView = tmpDict[@"headImg"]; model.detailArray = [tmpDict[@"content"] mutableCopy]; [_listArray addObject:model];
} }
return _listArray; }

@end
