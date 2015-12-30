//
//  DropControl.m
//  CD1505Weibo
//
//  Created by 七七的移动城堡 on 15/12/30.
//  Copyright (c) 2015年 QianFeng. All rights reserved.
//

#import "DropControl.h"

@interface DropControl ()

//weak用来存储父视图
@property(nonatomic,weak)UIView * sView;

@end


@implementation DropControl


/**
 *  Description
 *
 *  @param frame 内部显示出来的选项位置
 *  @param view  DropView加载的父视图
 *
 *  @return
 */
-(instancetype)initWithInsideViewFrame:(CGRect)frame inView:(UIView *)view
{
    
    self = [super init];
    if (self) {
        self.sView = view;
        self.frame = [UIScreen mainScreen].bounds;
        self.backgroundColor = [UIColor redColor];
        [self addTarget:self action:@selector(disMiss) forControlEvents:UIControlEventTouchDown];
    }
    
    return self;
}

-(void)show
{
    [self.sView addSubview:self];
    
}

-(void)disMiss
{
    [self removeFromSuperview];
}

@end
