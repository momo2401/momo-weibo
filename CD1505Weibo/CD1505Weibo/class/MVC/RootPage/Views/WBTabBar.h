//
//  WBTabBar.h
//  CD1505Weibo
//
//  Created by 千锋 on 15/12/29.
//  Copyright (c) 2015年 QianFeng. All rights reserved.
//

#import <UIKit/UIKit.h>


@class WBTabBarButton;


//@protocol WBTabBarDelegate <NSObject>

//-(void)passIndex:(NSInteger)index;

//@end

typedef void(^WBTabBarBlock)(NSInteger);

typedef void (^PlusButtonBlock)(WBTabBarButton *);

@interface WBTabBar : UIView

/**
 *  用来传递title image等信息
 */
@property(nonatomic,strong)UITabBarItem * tabBarItem;

//@property(nonatomic,weak)id <WBTabBarDelegate>delegate;

@property(nonatomic,copy)WBTabBarBlock passBlock;

@property(nonatomic,copy)PlusButtonBlock plusButtonBlock;



@end
