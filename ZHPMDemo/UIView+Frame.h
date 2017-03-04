//
//  UIView+Frame.h
//  IOS-Categories
//
//  Created by Jakey on 14/12/15.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Frame)
// shortcuts for frame properties
@property (nonatomic, assign) CGPoint origin;
@property (nonatomic, assign) CGSize size;

// shortcuts for positions
@property (nonatomic, assign, readonly) CGPoint innerCenter; /** width/2 , height/2 */
@property (nonatomic, assign, readonly) CGFloat halfWidth; /** width/2 , height/2 */
@property (nonatomic, assign, readonly) CGFloat halfHeight; /** width/2 , height/2 */

@property (nonatomic) CGFloat centerX;
@property (nonatomic) CGFloat centerY;

@property (nonatomic) CGFloat top;
@property (nonatomic) CGFloat bottom;
@property (nonatomic) CGFloat right;
@property (nonatomic) CGFloat left;

@property (nonatomic) CGFloat width;
@property (nonatomic) CGFloat height;

@property (nonatomic, copy) UIView *(^x)(CGFloat);
@property (nonatomic, copy) UIView *(^y)(CGFloat);
@property (nonatomic, copy) UIView *(^r)(CGFloat);
@property (nonatomic, copy) UIView *(^b)(CGFloat);
@property (nonatomic, copy) UIView *(^w)(CGFloat);
@property (nonatomic, copy) UIView *(^h)(CGFloat);

@property (nonatomic, copy) UIView *(^xy)(CGFloat, CGFloat);
@property (nonatomic, copy) UIView *(^wh)(CGFloat, CGFloat);
@property (nonatomic, copy) UIView *(^_frame)(CGFloat,CGFloat,CGFloat,CGFloat);

@property (nonatomic, copy) UIView *(^cy)(CGFloat);
@property (nonatomic, copy) UIView *(^cx)(CGFloat);
@property (nonatomic, copy) UIView *(^c)(CGPoint);

@property (nonatomic, copy) UIView *(^sizeFit)();

@property (nonatomic, copy) UIView *(^cornerRadius)(CGFloat);
@property (nonatomic, copy) UIView *(^cornerRadiusHalfHeight)();

- (UIView *)topSuperView;


@end
