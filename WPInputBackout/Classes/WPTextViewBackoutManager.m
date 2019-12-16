//
//  TextViewCaretaker.m
//  DesignPatternDemo
//
//  Created by wupeng on 2019/10/24.
//  Copyright © 2019 wupeng. All rights reserved.
//

#import "WPTextViewBackoutManager.h"
#import "WPTextViewChangeModel.h"

@implementation WPTextViewBackoutManager

- (void)textChangeWithChangeModel:(WPTextViewChangeModel *)model{
    if (model) {
        WPTextViewChangeModel * lastModel = self.changeModelArray.lastObject;
        if (lastModel && [lastModel.lastText isEqualToString:model.lastText]) {
            return;
        }
        [self.changeModelArray addObject:model];
    }
}

- (WPTextViewChangeModel *)restoreChangeModel{
    if (self.changeModelArray.count>1) {//第一个是原来数据，不能删除
        [self.changeModelArray removeLastObject];//至少有一个
    }
    WPTextViewChangeModel * lastModel = self.changeModelArray.lastObject;
    return lastModel;
}
//第一个记录的是原始的数据
- (NSMutableArray<WPTextViewChangeModel *> *)changeModelArray{
    if (!_changeModelArray) {
        _changeModelArray = [[NSMutableArray alloc] init];
    }
    return _changeModelArray;
}

@end
