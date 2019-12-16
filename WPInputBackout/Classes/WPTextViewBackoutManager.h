//
//  TextViewCaretaker.h
//  DesignPatternDemo
//
//  Created by wupeng on 2019/10/24.
//  Copyright © 2019 wupeng. All rights reserved.
//

#import <Foundation/Foundation.h>
@class WPTextViewChangeModel;
NS_ASSUME_NONNULL_BEGIN

@interface WPTextViewBackoutManager : NSObject
@property (nonatomic,strong) NSMutableArray<WPTextViewChangeModel*> * changeModelArray;
- (void)textChangeWithChangeModel:(WPTextViewChangeModel *)model;
- (WPTextViewChangeModel *)restoreChangeModel;
@end

NS_ASSUME_NONNULL_END
