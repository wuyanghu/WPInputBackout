//
//  TextViewChangeModel.m
//  DesignPatternDemo
//
//  Created by wupeng on 2019/10/24.
//  Copyright © 2019 wupeng. All rights reserved.
//

#import "WPTextViewChangeModel.h"

@implementation WPTextViewChangeModel

- (id)initWithLastText:(NSString *)lastText{
    self = [super init];
    if (self) {
        _lastText = lastText;
    }
    return self;
}

@end
