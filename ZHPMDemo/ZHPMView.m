//
//  ZHPMView.m
//  ZHPMDemo
//
//  Created by zhuhoulin on 2017/3/4.
//  Copyright © 2017年 zhuhoulin. All rights reserved.
//

#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#import "ZHPMView.h"
#import "UIView+Frame.h"

@interface ZHPMView()

@property (nonatomic, strong) UIImageView *ivTrumpet;
@property (nonatomic, strong) UILabel *lbText;
@property (nonatomic, assign) BOOL isStop;

@end

@implementation ZHPMView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.alpha = 0;
        self.userInteractionEnabled = YES;
        self.backgroundColor = UIColorFromRGB(0xFFFFF7F7);
        self.layer.masksToBounds = YES;
        [self setup];
    }
    return self;
}

- (void)setup {
    
    [self addSubview:self.ivTrumpet];
    [self addSubview:self.lbText];
    
    CGFloat margin = 10;
    self.ivTrumpet.left = margin;
    self.lbText.left = self.ivTrumpet.right + 5;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.ivTrumpet.centerY = self.lbText.centerY = self.height * 0.5;
}

- (void)show {
    [UIView animateWithDuration:0.25 animations:^{
        self.alpha = 1;
    } completion:^(BOOL finished) {
    }];
}

- (void)animtion{
    if (self.isStop) return;
    [UIView animateWithDuration:10 delay:2 options:UIViewAnimationOptionCurveLinear animations:^{
        self.lbText.left = -self.lbText.width;
    } completion:^(BOOL finished) {
        self.lbText.left = [UIScreen mainScreen].bounds.size.width;
        [self animtion];
    }];
}

- (void)disMiss {
    [UIView animateWithDuration:0.25 animations:^{
        self.alpha = 0;
    } completion:^(BOOL finished) {
        self.isStop = YES;
    }];
}

//*****************************************************************
// MARK: - setter
//*****************************************************************

- (void)setText:(NSString *)text {
    _text = text;
    self.lbText.text = text;
    [self.lbText sizeToFit];
    if ([UIScreen mainScreen].bounds.size.width >= self.lbText.width + self.ivTrumpet.width + 20) {
        self.isStop = YES;
        self.lbText.left = self.ivTrumpet.right + 5;
    }
    else {
        self.isStop = NO;
        self.lbText.left = [UIScreen mainScreen].bounds.size.width;
        [self animtion];
    }
}

//*****************************************************************
// MARK: - getter
//*****************************************************************
- (UIImageView *)ivTrumpet {
    if (!_ivTrumpet) {
        _ivTrumpet = [UIImageView new];
        _ivTrumpet.image = [UIImage imageNamed:@"team_notice-1"];
        [_ivTrumpet sizeToFit];
        _ivTrumpet.userInteractionEnabled = YES;
    }
    return _ivTrumpet;
}

- (UILabel *)lbText {
    if (!_lbText) {
        _lbText = [UILabel new];
        _lbText.textColor = [UIColor blackColor];
        _lbText.font = [UIFont systemFontOfSize:15];
        _lbText.textAlignment = NSTextAlignmentRight;
    }
    return _lbText;
}
@end
