//
//  ViewController.m
//  OptionFunViewDemo
//
//  Created by 李大鹏 on 15/6/19.
//  Copyright (c) 2015年 idap. All rights reserved.
//

#import "ViewController.h"

#import "OptionFunView.h"

@interface ViewController ()<OptionFunViewDelegate>

@property (nonatomic, strong) NSArray *funtitles;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    OptionFunView *funView = [[OptionFunView alloc] initWithFrame:CGRectMake(100, 100, 150, 30)];
    
    
    funView.funTitles = @[@"同意", @"拒绝"];
    self.funtitles = funView.funTitles;
    
    funView.delegate = self;
    
    [self.view addSubview:funView];
    
    
}

- (void)OptionFunView:(OptionFunView *)OptionFunView didSelectButtonAtIndex:(NSUInteger)index
{
    
    NSLog(@"您点击了============%@", _funtitles[index]);
    
}

@end
