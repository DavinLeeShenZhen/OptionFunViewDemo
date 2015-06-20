//
//  OptionFunView.m
//  ViewControllerTest
//
//  Created by 李大鹏 on 15/6/5.
//  Copyright (c) 2015年 lisaiqiang. All rights reserved.
//

#import "OptionFunView.h"
#import "OptionFunButtonView.h"

#define kFunButtonWidth 22
#define kFunButtonHeight 30

@interface OptionFunView()<OptionFunButtonViewDataSource, OptionFunButtonViewDelegate>

@property (nonatomic, strong) OptionFunButtonView *buttonView;

@property (nonatomic, strong) UIButton *showButton;

@end

@implementation OptionFunView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.buttonView = [[OptionFunButtonView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width - kFunButtonWidth, frame.size.height)];
        
        self.buttonView.delegate = self;
        self.buttonView.dataSource = self;
        self.isButtonShow = NO;
        [self addSubview:_buttonView];
        
        UIButton *showButton = [[UIButton alloc] initWithFrame:CGRectMake(frame.size.width - kFunButtonWidth, 0, kFunButtonWidth, kFunButtonHeight)];
        [showButton setImage:[UIImage imageNamed:@"OptionFunView_icon@2x"] forState:UIControlStateNormal];
        [showButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [showButton addTarget:self action:@selector(showButtonClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:showButton];
        self.showButton = showButton;
        
    }
    
    return self;
}

- (void)setButtonFont:(UIFont *)buttonFont
{
    _buttonFont = buttonFont;
    
    self.buttonView.titleFont = buttonFont;
    
}

- (void)showButtonClick
{
    if (_isButtonShow) {
        [self hidenButtons];
    } else {
        [self showButtons];
    }
    self.isButtonShow = !_isButtonShow;
}

- (NSInteger)numberOfTabs
{
    return _funTitles.count;
}

- (NSString *)OptionFunButtonView:(OptionFunButtonView *)OptionFunButtonView titlesForTabIndex:(NSInteger)index
{
    return [_funTitles objectAtIndex:index];
}

- (void)OptionFunButtonView:(OptionFunButtonView *)OptionFunButtonView didSelectIndex:(NSUInteger)index
{
    if ([self.delegate respondsToSelector:@selector(OptionFunView:didSelectButtonAtIndex:)]) {
        [self.delegate OptionFunView:self didSelectButtonAtIndex:index];
    }
    
    [self showButtonClick];
    
}

- (void)showButtons
{
    [self.buttonView show];
    
}

- (void)hidenButtons
{
    [self.buttonView hiden];
}

@end
