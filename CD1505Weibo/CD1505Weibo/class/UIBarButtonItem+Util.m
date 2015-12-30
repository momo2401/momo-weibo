//
//  UIBarButtonItem+Util.m
//  CD1505Weibo
//
//  Created by 七七的移动城堡 on 15/12/30.
//  Copyright (c) 2015年 QianFeng. All rights reserved.
//

#import "UIBarButtonItem+Util.h"

@implementation UIBarButtonItem (Util)

//传入图片名称，创建UIBarButtonItem

+(instancetype)generateBarButtonItemWithNormalImageName:(NSString *)norImageName highlightedImageName:(NSString *)hlimageName
{
    
    //1.创建按钮
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:norImageName] forState:UIControlStateNormal];
    
    [button setImage:[UIImage imageNamed:hlimageName] forState:UIControlStateHighlighted];
    
    CGSize imgSize = button.currentImage.size;
    button.frame = CGRectMake(0, 0, imgSize.width, imgSize.height);
    
    //2.创建 UIBarButtonItem对象并返回
    UIBarButtonItem * item = [[UIBarButtonItem alloc]initWithCustomView:button];
    
    return item;

}

@end
