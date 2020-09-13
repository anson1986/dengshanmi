//
//  DSKnowledgeViewController.m
//  DengShanFans
//
//  Created by bifen on 2020/7/8.
//  Copyright © 2020 obj. All rights reserved.
//

#import "DSKnowledgeViewController.h"
#import "BaseBriefView.h"

@interface DSKnowledgeViewController ()

@property (nonatomic, strong) BaseBriefView *briefView;

@property (nonatomic, strong) NSDictionary *contentDict;

@end

@implementation DSKnowledgeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.p_title = @"登山迷小知识";
    self.backItem.hidden = YES;
    [self setupBgView];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
}

- (void)setupBgView {
    self.briefView = [[BaseBriefView alloc] init];
    [self.view addSubview:self.briefView];
    [self.briefView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    [self.briefView showView];
    self.briefView.showDict = self.contentDict;
}

- (NSDictionary *)contentDict { if (!_contentDict) {
    _contentDict = @{@"img":@"knowledge",@"content":@"登山是指在特定要求下，运动员徒手或使用专门装备，从低海拔地形向高海拔山峰进行攀登的一项体育活动。登山运动可分为登山探险（也称高山探险）、竞技攀登（包括攀岩、攀冰等）和健身性登山。登山设备要适应登山运动的环境条件，在设计、选材、用料、制作上要尽量使其轻便、坚固、高效，并能一物多用。经常出外进行登山野营活动对人体有很大的好处，从医学角度来说，它对人的视力、心肺功能、四肢协调能力、体内多余脂肪的消耗、延缓人体衰老等五个方面有直接的益处。\n\n登山装备\n（1）宿营装备。包括帐篷、炊具、寝具和各种燃料等。\n（2）技术装备。包括登山绳、氧气装备、侧量仪器、高度计、干湿度计、钢锥、登山铁锁、升降器、挂梯、滑车、雪铲等。 　\n（3）个人装备。包括登山服装、登山鞋、高山靴、头盔、电筒、手套、防护眼镜等。其特点是：轻便易携，坚固耐用，便于拆卸，一物多用。\n\n登山饮食\n登山饮食是活动过程中不可或缺的一环，良好的营养不仅可以提供足够的能量补充体力，更可以令人产生refresh感，尤其在烹调过程中与同伴的互动，互相讨论今天行程的种种并展望明天的行程，更能促进彼此的情谊。\n\n炉具\n液态瓦斯（包括甲烷,乙烷,丙烷,丁烷等等。）\n燃料用油\n\n酒精\n\n结论\n对于初次购买炉具的人,建议购买瓦斯炉,原因是体积小,安全性高,维修容易,可以当个人炉具,也可以当作团体装备的紧急炉具,唯一的缺点是火力比汽化炉稍小,燃料的花费上比汽化炉贵了许多.汽化炉的火力较大,但需填充燃料,使用上需要较高技巧,维修及保养也较为麻烦.　　炉具最好以4 ~ 6人为炊煮单位。"};
}
    return _contentDict;

}

@end
