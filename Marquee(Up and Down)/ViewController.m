//
//  ViewController.m
//  Marquee(Up and Down)
//
//  Created by 花花 on 2017/8/15.
//  Copyright © 2017年 花花. All rights reserved.
//

#import "ViewController.h"
#import "MarqueeView.h"
@interface ViewController ()

@property (nonatomic, strong) MarqueeView *marqueeView;
@end

@implementation ViewController

#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.marqueeView];
    
}

#pragma Lazy Methods
- (MarqueeView *)marqueeView{

    if (!_marqueeView) {
        MarqueeView *marqueeView =[[MarqueeView alloc]initWithFrame:CGRectMake(10, 20, 400, 30) withTitle:@[@"1.我觉得封装好好玩",@"2.经常玩玩可以锻炼自己的技术耶",@"3.所以要经常经常玩玩，这样才能更加完美",@"4.你说对不对",@"end"]];
        marqueeView.titleColor = [UIColor blueColor];
        marqueeView.titleFont = [UIFont systemFontOfSize:16];
        marqueeView.backgroundColor = [UIColor yellowColor];
        __weak MarqueeView *marquee = marqueeView;
        marqueeView.handlerTitleClickCallBack = ^(NSInteger index){
            
            NSLog(@"%@----%zd",marquee.titleArr[index-1],index);
        };
        _marqueeView = marqueeView;
    }
    return _marqueeView;

}

@end
