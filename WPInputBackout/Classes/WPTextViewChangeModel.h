//
//  TextViewChangeModel.h
//  DesignPatternDemo
//
//  Created by wupeng on 2019/10/24.
//  Copyright © 2019 wupeng. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WPTextViewChangeModel : NSObject
@property (nonatomic,copy,readonly) NSString * lastText;//变化前的文本
- (id)initWithLastText:(NSString *)lastText;
@end

NS_ASSUME_NONNULL_END
