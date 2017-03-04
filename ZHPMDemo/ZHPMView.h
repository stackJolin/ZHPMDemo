//
//  ZHPMView.h
//  ZHPMDemo
//
//  Created by zhuhoulin on 2017/3/4.
//  Copyright © 2017年 zhuhoulin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZHPMView : UIView

/** 赋值的时候展示动画-setter方法 */
@property (nonatomic, copy) NSString *text;

/** 展示跑马动画view */
- (void)show;
/** 移除跑马动画view */
- (void)disMiss;

@end
