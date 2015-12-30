//
//  RootTabBarController.m
//  CD1505Weibo
//
//  Created by 千锋 on 15/12/29.
//  Copyright (c) 2015年 QianFeng. All rights reserved.
//

#import "RootTabBarController.h"
#import "HomeTableViewController.h"
#import "MassageTableViewController.h"
#import "DiscoveryTableViewController.h"
#import "PersonalTableViewController.h"
#import "WBTabBar.h"
#import <PopMenu.h>


@interface RootTabBarController (){
    
}

//自定义TabBar
@property(nonatomic,strong) WBTabBar * wbTabBar;
@property(nonatomic,strong)PopMenu * popMenu;


@end

@implementation RootTabBarController

-(PopMenu *)popMenu
{
    if (_popMenu == nil) {
        NSMutableArray * items = @[].mutableCopy;
        NSArray * titles = @[@"文字",
                             @"相册",
                             @"微博",
                             @"签到",
                             @"点评",
                             @"更多"];
        NSArray * imageNames = @[@"tabbar_compose_idea",
                                @"tabbar_compose_photo",
                                @"tabbar_compose_weibo",
                                @"tabbar_compose_lbs",
                                @"tabbar_compose_review",
                                @"tabbar_compose_more"];
        
        for (int index; index < titles.count; index++) {
            MenuItem * item = [[MenuItem alloc]initWithTitle:titles[index] iconName:imageNames[index] glowColor:[UIColor magentaColor]];
            [items addObject:item];
        }
        _popMenu = [[PopMenu alloc]initWithFrame:[UIScreen mainScreen].bounds items:items];
        _popMenu.didSelectedItemCompletion = ^(MenuItem * selectedItem)
        {
            NSLog(@"点了%@",selectedItem.title);
            
        };
    }
    return _popMenu;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor blueColor];
    // Do any additional setup after loading the view.
    
    //添加自定义TabBar
    [self addCustonTabBar];
    
    //添加ViewControllers
    [self addViewControlers];
    
}

-(void)addCustonTabBar
{
    
    //隐藏系统自带
    self.tabBar.hidden = YES;
    
    self.wbTabBar = [[WBTabBar alloc]initWithFrame:CGRectMake(0, ScreenHeight - 49,ScreenWidth, 49)];
    
//    self.wbTabBar.delegate = self;
    
    __weak typeof(self) weakSelf = self;
    self.wbTabBar.passBlock = ^(NSInteger index){
      
        weakSelf.selectedIndex =index;
    };
    
    self.wbTabBar.plusButtonBlock = ^(WBTabBarButton * sender)
    {
        [weakSelf.popMenu showMenuAtView:weakSelf.view];
    };
    
    
    [self.view addSubview:self.wbTabBar];
    
    
    self.wbTabBar.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"tabbar_background"]];

}

/**
 *  添加视图控制器
 */
-(void)addViewControlers
{

    NSArray * vcNameArray = @[@"HomeTableViewController",
                              @"MassageTableViewController",
                              @"DiscoveryTableViewController",
                              @"PersonalTableViewController"];
    
    NSArray * vcTitleArray = @[@"首页",@"消息",@"发现",@"我"];
    
    //普通状态
    NSArray * norImageArray = @[@"tabbar_home",
                                @"tabbar_message_center",
                                @"tabbar_discover",
                                @"tabbar_profile"];
    
    //高亮
    NSArray * hlImageArray = @[@"tabbar_home_highlighted",
                            @"tabbar_message_center_highlighted",
                               @"tabbar_discover_highlighted",
                               @"tabbar_profile_highlighted"];
    
    //选中
    NSArray * selImageArray = @[@"tabbar_home_selected",
                            @"tabbar_message_center_selected",
                                @"tabbar_discover_selected",
                                @"tabbar_profile_selected"];
    
    for (NSString * vcName in vcNameArray) {
        Class vcClass = NSClassFromString(vcName);
        NSInteger index = [vcNameArray indexOfObject:vcName];
        UITableViewController * vc = [[vcClass alloc]init];
        vc.title = vcTitleArray[index];
        

        //标题图片

        vc.tabBarItem.image = [[UIImage imageNamed: norImageArray[index]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        vc.tabBarItem.selectedImage = [[UIImage imageNamed: selImageArray[index]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
        
        //修改文字颜色
        NSDictionary * norAttribute = @{NSFontAttributeName:[UIFont systemFontOfSize:14],NSForegroundColorAttributeName:[UIColor lightGrayColor]};
        
        NSDictionary * selAttribute = @{NSFontAttributeName:[UIFont systemFontOfSize:14],NSForegroundColorAttributeName:[UIColor orangeColor]};
        
        [vc.tabBarItem setTitleTextAttributes:norAttribute forState:UIControlStateNormal];
        
        [vc.tabBarItem setTitleTextAttributes:selAttribute forState:UIControlStateSelected];
        
        UINavigationController * navc = [[UINavigationController alloc]initWithRootViewController:vc];
        [self addChildViewController:navc];
        
        self.wbTabBar.tabBarItem = vc.tabBarItem;

    }
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark -WBTabBarDelegate
-(void)passIndex:(NSInteger)index
{
    self.selectedIndex = index;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
