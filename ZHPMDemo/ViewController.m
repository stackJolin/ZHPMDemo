//
//  ViewController.m
//  ZHPMDemo
//
//  Created by zhuhoulin on 2017/3/4.
//  Copyright © 2017年 zhuhoulin. All rights reserved.
//

#import "ViewController.h"

#import "ZHPMView.h"

@interface ViewController ()

@property (nonatomic, strong) ZHPMView *pmView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.pmView.frame = CGRectMake(0, 20, [UIScreen mainScreen].bounds.size.width, 40);
    self.pmView.text = @"诸侯朱换地方的实例的书法家的零售价反倒是范德萨范德萨发发送到";
    
    [self.view addSubview:self.pmView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.pmView show];
}


//*****************************************************************
// MARK: - delegates
//*****************************************************************

- (ZHPMView *)pmView {
    if (!_pmView) {
        _pmView = [ZHPMView new];
    }
    return _pmView;
}
@end
