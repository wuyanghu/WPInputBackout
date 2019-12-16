//
//  UITextView+WPBackout.h
//  DesignPatternDemo
//
//  Created by wupeng on 2019/12/15.
//  Copyright © 2019 wupeng. All rights reserved.
//


@import UIKit;
@class WPTextViewBackoutManager;
NS_ASSUME_NONNULL_BEGIN

@interface UITextView (WPBackout)
@property (nonatomic,strong) WPTextViewBackoutManager * wpBackoutManager;
- (void)wpAddBackoutBar;
- (void)wpTextViewBackoutAction;//自定义撤销按钮可调用此事件
@end

NS_ASSUME_NONNULL_END
