//
//  OptionFunView.h
//  ViewControllerTest
//
//  Created by 李大鹏 on 15/6/5.
//  Copyright (c) 2015年 lisaiqiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol OptionFunViewDelegate;

@interface OptionFunView : UIView

@property (nonatomic, strong) NSArray *funTitles;
@property (nonatomic, assign) BOOL isButtonShow;
@property (nonatomic, strong) UIFont *buttonFont;

@property (nonatomic, weak) id <OptionFunViewDelegate> delegate;

- (void)showButtons;
- (void)hidenButtons;

@end

@protocol OptionFunViewDelegate <NSObject>

@optional

- (void)OptionFunView:(OptionFunView *)OptionFunView didSelectButtonAtIndex:(NSUInteger)index;

@end
