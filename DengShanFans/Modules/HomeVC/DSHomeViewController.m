//
//  DSHomeViewController.m
//  DengShanFans
//
//  Created by bifen on 2020/7/8.
//  Copyright © 2020 obj. All rights reserved.
//

#import "DSHomeViewController.h"
#import "iCarouseView.h"
#import "HYHomeModel.h"
#import "DSHomeDetailController.h"

@interface DSHomeViewController ()
@property (nonatomic, strong) iCarouseView *icarouseView;
@property (nonatomic, strong) NSMutableArray *listArray;
@property (nonatomic, strong) NSMutableArray *detialList;
@end

@implementation DSHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.p_title = @"首 页";
    self.backItem.hidden = YES;
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupBgView];
}
- (void)setupBgView {
    self.detialList = [[NSMutableArray alloc] init];
    self.icarouseView = [[iCarouseView alloc] init];
    [self.view addSubview:self.icarouseView];
    [self.icarouseView mas_makeConstraints:^(MASConstraintMaker *make) { make.left.top.right.equalTo(self.view).offset(0);
        make.height.mas_offset(240);
    }];
    [self.icarouseView showView];
    self.icarouseView.listArray = self.listArray;
    [self.icarouseView reloadData];
    self.icarouseView.autoScroll = YES;
    
    CGFloat width = (WindowWidth - 15*2 - 10*3)/4;
    NSArray *titles = @[@"泰山",@"华山",@"衡山",@"恒山",@"嵩山",@"武夷山",@"峨眉山",@"贺兰山"];
    NSArray *descs = @[@"泰山，又名岱山、岱宗、岱岳、东岳、泰岳，为五岳之一，位于山东省中部，绵亘于泰安、济南、淄博三市之间，总面积2.42万公顷。主峰玉皇顶海拔1532.7米。\n\n泰山被古人视为“直通帝座”的天堂，成为百姓崇拜，帝王告祭的神山，有“泰山安，四海皆安”的说法。自秦始皇开始到清代，先后有13代帝王依次亲登泰山封禅或祭祀，另外有24代帝王遣官祭祀72次 [2-3]  。山体上留下了20余处古建筑群，2200余处碑碣石刻。",@"华山，古称“西岳”，雅称“太华山”，为五岳之一，位于陕西省渭南市华阴市，在省会西安以东120千米处。南接秦岭，北瞰黄渭，自古以来就有“奇险天下第一山”的说法。\n\n中华之“华”源于华山，由此，华山有了“华夏之根”之称 [3-4]  。华山是道教主流全真派圣地，为“第四洞天”，也是中国民间广泛崇奉的神祇，即西岳华山君神。共有72个半悬空洞，道观20余座，其中玉泉院、都龙庙、东道院、镇岳宫被列为全国重点道教宫观，有陈抟、郝大通、贺元希等著名的道教高人。",@"衡山（Mount Heng），又名南岳、寿岳、南山，为中国“五岳”之一，位于中国湖南省中部偏东南部，绵亘于衡阳、湘潭两盆地间,，主体部分位于衡阳市南岳区、衡山县和衡阳县东部。衡山的命名，据战国时期《甘石星经》记载，因其位于星座二十八宿的轸星之翼，“变应玑衡”，“铨德钧物”，犹如衡器，可称天地，故名衡山。\n\n衡山是中国著名的道教、佛教圣地，环山有寺、庙、庵、观200多处。衡山是上古时期君王唐尧、虞舜巡疆狩猎祭祀社稷，夏禹杀马祭天地求治洪方法之地。衡山山神是民间崇拜的火神祝融，他被黄帝委任镇守衡山，教民用火，化育万物，死后葬于衡山赤帝峰，被当地尊称南岳圣帝。道教“三十六洞天，七十二福地”，有四处位于衡山之中，佛祖释迦牟尼两颗真身舍利子藏于衡山南台寺金刚舍利塔中。",@"恒山，含狭义和广义两个概念。狭义的恒山，即所谓“北岳恒山”，亦名“太恒山”，古称玄武山、崞山，高是山，玄岳等，明末清初被确定为“五岳”之北岳恒山。位于山西省浑源县城南10公里处，主峰天峰岭海拔2016.8米 [1]  ，号称“人天北柱”、“绝塞名山”。广义的恒山，或称恒山山脉，是山西省大同市东南部、河北省张家口市南部，桑干河、滹沱河之间一系列山峰的总称，大致西南－东北走向延伸，东西长近300公里左右，南北宽80公里左右，最高峰为代县、应县边界处的馒头山，海拔2426米。\n\n恒山横亘于山西北部高原与冀中平原之间，因其险峻的自然山势和地理位置的特点，成为兵家必争之地。山间河谷处的倒马关、紫荆关、平型关、雁门关、宁武关虎踞为险，是塞外高原通向太原盆地、冀中平原之咽喉要冲。许多帝王、名将都在此打过仗，古代关隘、城堡、烽火台等众多古代战场遗迹保存了下来。",@"嵩山，古称“外方”，夏商时称“崇高”、“崇山”，西周时成称为 “岳山”，以嵩山为中央左岱（泰山）右华（华山），定嵩山为中岳，始称“中岳嵩山”。 [1]  嵩山位于河南省西部，地处登封市西北部，西邻古都洛阳，东临古都郑州，属伏牛山系 [2]  。介于东经112°56′07″～113°11′32″，北纬34°23′31″～34°35′53″。",@"武夷山，武夷山位于江西与福建西北部两省交界处，武夷山脉北段东南麓总面积999.75平方公里，是中国著名的风景旅游区和避暑胜地。属典型的丹霞地貌，是首批国家级重点风景名胜区之一。\n\n武夷山是三教名山。 [1]  自秦汉以来，武夷山就为羽流禅家栖息之地，留下了不少宫观、道院和庵堂故址。武夷山还曾是儒家学者倡道讲学之地。",@"峨眉山（Mount Emei）位于北纬30°附近，四川省西南部，四川盆地的西南边缘 [1]  ，是中国“四大佛教名山”之一，地势陡峭，风景秀丽，素有“峨眉天下秀”之称，山上的万佛顶最高，海拔3099米，高出峨眉平原2700多米。《峨眉郡志》云：“云鬘凝翠，鬒黛遥妆，真如螓首蛾眉，细而长，美而艳也，故名峨眉山。",@"贺兰山脉位于宁夏回族自治区与内蒙古自治区交界处，北起巴彦敖包，南至毛土坑敖包及青铜峡。山势雄伟，若群马奔腾。蒙古语称骏马为“贺兰”，故名贺兰山(此说疑有误，唐代韦蟾有诗云：“贺兰山下果园成”，蒙古人在13世纪才崛起，说源于蒙语只是通用说法）。"];
    for (int i = 0; i < 8; i ++) {
        UIImageView *imgView = [UIImageView new];
        imgView.tag = i + 9000;
        imgView.contentMode = UIViewContentModeScaleAspectFill;
//        imgView.layer.cornerRadius = width/2.0f;
        imgView.backgroundColor = [UIColor orangeColor];
        imgView.image = [UIImage imageNamed:[NSString stringWithFormat:@"deng_main_%ld.jpg",(long)i]];
        imgView.layer.masksToBounds = YES;
        imgView.userInteractionEnabled = YES;
        [self.view addSubview:imgView];
        
        [imgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.icarouseView.mas_bottom).offset(30 + i/4*(width + 50));
            make.left.equalTo(self.view).offset(15 + i%4*(width + 10));
            make.width.height.mas_offset(width);
        }];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesture:)];
        [imgView addGestureRecognizer:tap];
        
        UILabel *label = [UILabel new];
        label.textColor = RGBValue(0x233333);
        label.text = titles[i];
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont boldSystemFontOfSize:14];
        [self.view addSubview:label];
        
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(imgView.mas_bottom).offset(8);
            make.left.equalTo(self.view).offset(15 + i%4*(width + 10));
            make.width.mas_offset(width);
            make.height.mas_offset(21);
        }];
        
        HYHomeModel *model = [[HYHomeModel alloc] init];
        model.title = titles[i];
        model.iconImg = [NSString stringWithFormat:@"deng_main_%ld.jpg",(long)i];
        model.desc = descs[i];
        [self.detialList addObject:model];
    }
}

- (NSMutableArray *)listArray {
    if (!_listArray) {
    _listArray = @[@"ad_0",@"ad_1",@"ad_2",@"ad_3",@"ad_4"].mutableCopy;
    
}
    return _listArray; }


- (void)tapGesture:(UITapGestureRecognizer *)tap{
       NSInteger tag = tap.view.tag - 9000;
        DSHomeDetailController *detailVC = [[DSHomeDetailController alloc] init];
        detailVC.model = self.detialList[tag];
        detailVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:detailVC animated:YES];
}

@end
