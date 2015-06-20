 //
//  OptionFunButtonView.h
//  QieyouVisitor
//
//  Created by 李大鹏 on 15/4/4.
//  Copyright (c) 2015年 lisaiqiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol OptionFunButtonViewDataSource;
@protocol OptionFunButtonViewDelegate;

@interface OptionFunButtonView : UIView

@property (weak) id <OptionFunButtonViewDataSource> dataSource;
@property (weak) id <OptionFunButtonViewDelegate> delegate;

@property (nonatomic, strong) UIFont *titleFont;

- (void)reloadData;
- (void)show;
- (void)hiden;

@end

@protocol OptionFunButtonViewDataSource <NSObject>

@required
- (NSInteger)numberOfTabs;

- (NSString *)OptionFunButtonView:(OptionFunButtonView *)OptionFunButtonView titlesForTabIndex:(NSInteger)index;

@end

@protocol OptionFunButtonViewDelegate <NSObject>

@optional

- (void)OptionFunButtonView:(OptionFunButtonView *)OptionFunButtonView didSelectIndex:(NSUInteger)index;

@end