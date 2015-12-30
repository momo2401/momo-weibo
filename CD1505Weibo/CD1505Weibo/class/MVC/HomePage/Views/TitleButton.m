//
//  TitleButton.m
//  CD1505Weibo
//
//  Created by 七七的移动城堡 on 15/12/30.
//  Copyright (c) 2015年 QianFeng. All rights reserved.
//

#import "TitleButton.h"

@implementation TitleButton


-(instancetype)initWithFrame:(CGRect)frame
{
    
    self = [super initWithFrame:frame];
    if (self) {
        _titleRatio = 0.8;
        
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.imageView.contentMode = UIViewContentModeCenter;
    }
    return self;
}


-(CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageX = _titleRatio * CGRectGetWidth(contentRect);
    CGFloat imageY = 0;
    CGFloat imageW = (1 - _titleRatio) * CGRectGetWidth(contentRect);
    CGFloat imageH = CGRectGetHeight(contentRect);
    
    
    return CGRectMake(imageX, imageY, imageW, imageH);
}


-(CGRect)titleRectForContentRect:(CGRect)contentRect
{
    
    CGFloat titleX = 0;
    CGFloat titleY = 0;
    CGFloat titleW = CGRectGetWidth(contentRect) * _titleRatio;
    CGFloat titleH = CGRectGetHeight(contentRect);
    
    return CGRectMake(titleX, titleY, titleW, titleH);
    
}

@end
