//
//  HomeTableViewController.m
//  CD1505Weibo
//
//  Created by 千锋 on 15/12/29.
//  Copyright (c) 2015年 QianFeng. All rights reserved.
//

#import "HomeTableViewController.h"
#import "UIBarButtonItem+Util.h"
#import "TitleButton.h"
#import "DropControl.h"
@interface HomeTableViewController ()

@property(nonatomic,strong)DropControl * dropControl;

@end

@implementation HomeTableViewController


-(DropControl*)dropControl
{
    if (_dropControl == nil) {
        _dropControl = [[DropControl alloc]initWithInsideViewFrame:CGRectZero inView:self.tabBarController.view];
        
    }
    return _dropControl;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createNaviBarItem];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//定制导航栏
-(void)createNaviBarItem
{
    
    //类别写创建方法，更好的封装性
    　self.navigationItem.leftBarButtonItem = [UIBarButtonItem generateBarButtonItemWithNormalImageName:@"navigationbar_friendattention" highlightedImageName:@"navigationbar_friendattention_highlighted"];
    
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem generateBarButtonItemWithNormalImageName:@"navigationbar_icon_radar" highlightedImageName:@"navigationbar_icon_radar_highlighted"];
    
    TitleButton * titleButton = [TitleButton buttonWithType:UIButtonTypeCustom];
    
    [titleButton setImage:[UIImage imageNamed:@"navigationbar_arrow_down"] forState:UIControlStateNormal];
    [titleButton setImage:[UIImage imageNamed:@"navigationbar_arrow_up"] forState:UIControlStateNormal];
    
    titleButton.frame = CGRectMake(0, 0, 200, 30);
    
    self.navigationItem.titleView = titleButton;
    
    [titleButton addTarget:self action:@selector(titleBtnPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    
}


#pragma mark - title按钮点击

-(void)titleBtnPressed:(TitleButton *)sender
{

    
    sender.selected = !sender.selected;
    
    if (sender.selected) {
        [self.dropControl show];
    }else
    {
        [self.dropControl disMiss];
    }
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 0;
}





@end
