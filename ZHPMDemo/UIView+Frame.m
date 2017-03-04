//
//  UIView+Frame.m
//  IOS-Categories
//
//  Created by Jakey on 14/12/15.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import "UIView+Frame.h"

@implementation UIView (Frame)
#pragma mark - Shortcuts for the coords

- (CGFloat)top
{
    return self.frame.origin.y;
}

- (void)setTop:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)right
{
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setRight:(CGFloat)right
{
    CGRect frame = self.frame;
    frame.origin.x = right - self.frame.size.width;
    self.frame = frame;
}

- (CGFloat)bottom
{
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setBottom:(CGFloat)bottom
{
    CGRect frame = self.frame;
    frame.origin.y = bottom - self.frame.size.height;
    self.frame = frame;
}

- (CGFloat)left
{
    return self.frame.origin.x;
}

- (void)setLeft:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)width
{
    return self.frame.size.width;
}

- (void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)height
{
    return self.frame.size.height;
}

- (void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

#pragma mark - Shortcuts for frame properties

- (CGPoint)origin {
    return self.frame.origin;
}

- (void)setOrigin:(CGPoint)origin {
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (CGSize)size {
    return self.frame.size;
}

- (void)setSize:(CGSize)size {
    if ( isnan( size.width ) || isnan(size.height) ) {
        return;
    }
    CGRect frame = self.frame;
    
    if (isnan(frame.origin.x) || isnan(frame.origin.y)) {
        return;
    }
    
    frame.size = size;
    self.frame = frame;
}
#pragma mark - Shortcuts for positions

- (CGPoint)innerCenter {
    return CGPointMake(self.width/2, self.height/2);
}

- (CGFloat)halfHeight {
    return self.height * .5;
}

- (CGFloat)halfWidth {
    return self.width * .5;
}


- (CGFloat)centerX {
    return self.center.x;
}

- (void)setCenterX:(CGFloat)centerX {
    self.center = CGPointMake(centerX, self.center.y);
}

- (CGFloat)centerY {
    return self.center.y;
}

- (void)setCenterY:(CGFloat)centerY {
    self.center = CGPointMake(self.center.x, centerY);
}

- (UIView *)topSuperView
{
    UIView *topSuperView = self.superview;
    
    if (topSuperView == nil) {
        topSuperView = self;
    } else {
        while (topSuperView.superview) {
            topSuperView = topSuperView.superview;
        }
    }
    
    return topSuperView;
}

//*****************************************************************
// MARK: - 链式
//*****************************************************************

#define getter_ls_float(x, ...) \
- (UIView *(^)(CGFloat))x { \
    return ^(CGFloat value) { \
        __VA_ARGS__\
        return self; \
    }; \
} \

#define getter_ls(x, t1, t2, ...) \
- (UIView *(^)(t1, t2))x { \
    return ^(t1 v1, t2 v2) { \
        __VA_ARGS__\
        return self; \
    }; \
} \

getter_ls_float(x, {
    self.left = value;
})

getter_ls_float(y, {
    self.top = value;
})

getter_ls_float(r, {
    self.right = value;
})

getter_ls_float(b, {
    self.bottom = value;
})

getter_ls_float(w, {
    self.width = value;
})

getter_ls_float(h, {
    self.height = value;
})

- (UIView *(^)(CGPoint))c {
    return ^(CGPoint p) {
        self.center = p;
        return self;
    };
}

getter_ls_float(cx, {
    self.centerX = value;
})

getter_ls_float(cy, {
    self.centerY = value;
})

getter_ls(wh, CGFloat, CGFloat, {
    self.size = CGSizeMake(v1, v2);
})

getter_ls(xy, CGFloat, CGFloat, {
    self.origin = CGPointMake(v1, v2);
})

- (UIView *(^)(CGFloat, CGFloat, CGFloat, CGFloat))_frame {
    return ^(CGFloat x, CGFloat y, CGFloat w, CGFloat h) {
        self.frame = CGRectMake(x, y, w, h);
        return self;
    };
}

- (UIView *(^)())sizeFit {
    return ^() {
        if ([self respondsToSelector:@selector(sizeToFit)]) {
            [self sizeToFit];
        }
        return self;
    };
}

- (UIView *(^)())cornerRadiusHalfHeight {
    return ^() {
        self.layer.cornerRadius = self.halfHeight;
        return self;
    };
}

- (UIView *(^)(CGFloat))cornerRadius {
    return ^(CGFloat radius) {
        self.layer.cornerRadius = radius;
        return self;
    };
}
@end
