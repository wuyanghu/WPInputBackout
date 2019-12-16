//
//  UITextView+WPBackout.m
//  DesignPatternDemo
//
//  Created by wupeng on 2019/12/15.
//  Copyright © 2019 wupeng. All rights reserved.
//

#import "UITextView+WPBackout.h"
#import "WPTextViewBackoutManager.h"
#import "WPTextViewChangeModel.h"
#import <objc/runtime.h>

@implementation UITextView (WPBackout)

- (void)setWpBackoutManager:(WPTextViewBackoutManager *)wpBackoutManager{
    objc_setAssociatedObject(self, @selector(setWpBackoutManager:), wpBackoutManager, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (WPTextViewBackoutManager *)wpBackoutManager{
    WPTextViewBackoutManager * caretabker = objc_getAssociatedObject(self, @selector(setWpBackoutManager:));
    if (!caretabker) {
        caretabker = [WPTextViewBackoutManager new];
        [self setWpBackoutManager:caretabker];
        
        [self wpAddNotification];
    }
    return caretabker;
}

- (void)wpAddNotification{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textViewBackoutBeginEditing:) name:UITextViewTextDidBeginEditingNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textViewBackoutDidChange:) name:UITextViewTextDidChangeNotification object:nil];
}

- (void)wpAddBackoutToolBar{
    
    UIToolbar *toolBar = [UIToolbar new];
    [toolBar sizeToFit];
    
    UIBarButtonItem * backoutItem = [[UIBarButtonItem alloc]initWithTitle:@"撤销" style:UIBarButtonItemStyleDone target:self action:@selector(wpTextViewBackoutAction)];
    UIBarButtonItem *spaceItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    UIBarButtonItem *doneItem = [[UIBarButtonItem alloc]initWithTitle:@"完成" style:UIBarButtonItemStyleDone target:self action:@selector(doneAction)];
    
    toolBar.items = @[backoutItem,spaceItem, doneItem];
    self.inputAccessoryView = toolBar;
}


#pragma mark - action

- (void)wpTextViewBackoutAction{
    WPTextViewChangeModel * preChangeModel = [self.wpBackoutManager restoreChangeModel];
    if (preChangeModel) {
        self.text = preChangeModel.lastText;
    }
}

- (void)doneAction{
    [self resignFirstResponder];
}

#pragma mark - NSNotification

- (void)textViewBackoutBeginEditing:(NSNotification *)notification{
    if (self.wpBackoutManager.changeModelArray.count == 0) {
        WPTextViewChangeModel * changeModel = [[WPTextViewChangeModel alloc] initWithLastText:self.text];
        [self.wpBackoutManager textChangeWithChangeModel:changeModel];
    }
}

- (void)textViewBackoutDidChange:(NSNotification *)notification{
    NSString *lang = self.textInputMode.primaryLanguage; // 键盘输入模式
    if([lang isEqualToString:@"zh-Hans"]) { //简体中文输入，包括简体拼音，健体五笔，简体手写
        UITextRange *selectedRange = [self markedTextRange];
        //获取高亮部分
        UITextPosition *position = [self positionFromPosition:selectedRange.start offset:0];
        //没有高亮选择的字，则对已输入的文字进行字数统计和限制
        if(!position) {
            WPTextViewChangeModel * changeModel = [[WPTextViewChangeModel alloc] initWithLastText:self.text];
            [self.wpBackoutManager textChangeWithChangeModel:changeModel];
        } else{ //有高亮选择的字符串，则暂不对文字进行统计和限制
        }
    } else{ //中文输入法以外的直接对其统计限制即可，不考虑其他语种情况
        WPTextViewChangeModel * changeModel = [[WPTextViewChangeModel alloc] initWithLastText:self.text];
        [self.wpBackoutManager textChangeWithChangeModel:changeModel];
    }
}

#pragma mark - dealloc

- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end



