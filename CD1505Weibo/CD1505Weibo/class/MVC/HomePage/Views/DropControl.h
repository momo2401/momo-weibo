//
//  DropControl.h
//  CD1505Weibo
//
//  Created by 七七的移动城堡 on 15/12/30.
//  Copyright (c) 2015年 QianFeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DropControl : UIControl

-(instancetype)initWithInsideViewFrame:(CGRect)frame inView:(UIView *)view;

/**
 *  显示
 */

-(void)show;

/**
 *  消失
 */

-(void)disMiss;



@end
