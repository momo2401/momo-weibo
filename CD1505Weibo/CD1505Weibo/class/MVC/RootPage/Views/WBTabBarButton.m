//
//  WBTabBarButton.m
//  CD1505Weibo
//
//  Created by 千锋 on 15/12/29.
//  Copyright (c) 2015年 QianFeng. All rights reserved.
//

#import "WBTabBarButton.h"

@implementation WBTabBarButton



- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _ratio = 0.6;
        self.imageView.contentMode = UIViewContentModeScaleAspectFit;
        
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        
        self.titleLabel.font = [UIFont systemFontOfSize:14];
    }
    return self;
}


-(void)setRatio:(CGFloat)ratio
{
    if (ratio <= 0 || ratio > 1) {
        NSException * expre = [NSException exceptionWithName:@"异常提示" reason:@"参数范围不在0~1之间" userInfo:nil];
        
        @throw expre;
    }else
    {
    _ratio = ratio;
    }
}

-(void)setTabBarItem:(UITabBarItem *)tabBarItem
{
    
    _tabBarItem = tabBarItem;
    
    [self setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    
    [self setTitleColor:[UIColor orangeColor] forState:UIControlStateSelected];
    
    
    [self setTitle:tabBarItem.title forState:UIControlStateNormal];
    
    [self setImage:tabBarItem.image forState:UIControlStateNormal];
    [self setImage:tabBarItem.selectedImage forState:UIControlStateSelected];
}


/**生成按钮内部图片的位置(fram)*/
-(CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imgX = 0;
    CGFloat imgY = 0;
    CGFloat imgW = CGRectGetWidth(contentRect);
    CGFloat imgH = CGRectGetHeight(contentRect) * _ratio;
    
    return CGRectMake(imgX, imgY, imgW, imgH);
}


//生成按钮内部titleLabel位置(fram)
-(CGRect)titleRectForContentRect:(CGRect)contentRect
{
    
    static int i = 0;
    CGFloat titleX = 0;
    CGFloat titleY = CGRectGetHeight(contentRect) * _ratio;
    CGFloat titleW = CGRectGetWidth(contentRect);
    CGFloat titleH = CGRectGetHeight(contentRect) * (1 - self.ratio);
    
    return CGRectMake(titleX, titleY, titleW, titleH);
    
}


//拦截高亮状态响应，让他什么也不干
-(void)setHighlighted:(BOOL)highlighted
{
    
    
    
    
}



@end
