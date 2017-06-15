//
//  TodayViewController.m
//  lyiOS 10 Widget
//
//  Created by 卢杨 on 17/3月/3.
//  Copyright © 2017年 卢杨. All rights reserved.
//
#import "ViewController.h"

#import "TodayViewController.h"
#import <NotificationCenter/NotificationCenter.h>

@interface TodayViewController () <NCWidgetProviding>

@end

@implementation TodayViewController
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.extensionContext.widgetLargestAvailableDisplayMode = NCWidgetDisplayModeExpanded;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(10, 10, 50, 50)];
    [btn setImage:[UIImage imageNamed:@"image0"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
//    UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(10, btn.bottom + 5, 50, 20)];
//    lable.text = @"ssssss";
//    lable.textColor = [UIColor whiteColor];
//    lable.font= [UIFont systemFontOfSize:15];
//    [self.view addSubview:lable];
 }

- (void)btn{
    [self openURLContainingAPP ];
}

- (void)openURLContainingAPP{
    //通过extensionContext借助host app调起app wpfWidgetTest://action=richScan
    [self.extensionContext openURL:[NSURL URLWithString:@"wpfWidgetTest://action=richScan"] completionHandler:^(BOOL success) {
        NSLog(@"open url result:%d",success);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)widgetActiveDisplayModeDidChange:(NCWidgetDisplayMode)activeDisplayMode withMaximumSize:(CGSize)maxSize {
    if (activeDisplayMode == NCWidgetDisplayModeCompact) {
        self.preferredContentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, 110);
    } else {
        self.preferredContentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, 300);
    }
}
- (void)widgetPerformUpdateWithCompletionHandler:(void (^)(NCUpdateResult))completionHandler {
    // Perform any setup necessary in order to update the view.
    // If an error is encountered, use NCUpdateResultFailed
    // If there's no update required, use NCUpdateResultNoData
    // If there's an update, use NCUpdateResultNewData
    
    completionHandler(NCUpdateResultNewData);
}

@end
