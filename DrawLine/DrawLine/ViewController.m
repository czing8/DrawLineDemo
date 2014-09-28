//
//  ViewController.m
//  DrawLine
//
//  Created by Vols on 14-9-28.
//  Copyright (c) 2014年 Vols. All rights reserved.
//

#import "ViewController.h"

#import "DrawingBoard.h"
#import "DrawToolsView.h"

#define ToolViewY (IS_IOS7 ? 20 :0)
#define IS_IOS7 [[[UIDevice currentDevice] systemVersion] floatValue] >=7.0f

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view = [[UIView alloc] initWithFrame:[UIScreen mainScreen].applicationFrame];
    
    DrawingBoard *myView = [[DrawingBoard alloc] initWithFrame:CGRectMake(0,ToolViewY, self.view.bounds.size.width, self.view.bounds.size.height)];
    
    [self.view addSubview:myView];
    
    DrawToolsView *drawTools = [[DrawToolsView alloc] initWithFrame:CGRectMake(0, ToolViewY, self.view.bounds.size.width, 44) brushColor:^(UIColor *color) {
        myView.lineColor = color;
    } brushColor:^(float width) {
        myView.lineWidth = width;
    }];
    
    [self.view addSubview:drawTools];
    
    
    self.view.backgroundColor = [UIColor orangeColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
