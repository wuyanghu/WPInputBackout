# WPInputBackout
# 给输入框增加撤销功能，手机版的ctrl+z
[![CI Status](https://img.shields.io/travis/823105162@qq.com/WPInputBackout.svg?style=flat)](https://travis-ci.org/823105162@qq.com/WPInputBackout)
[![Version](https://img.shields.io/cocoapods/v/WPInputBackout.svg?style=flat)](https://cocoapods.org/pods/WPInputBackout)
[![License](https://img.shields.io/cocoapods/l/WPInputBackout.svg?style=flat)](https://cocoapods.org/pods/WPInputBackout)
[![Platform](https://img.shields.io/cocoapods/p/WPInputBackout.svg?style=flat)](https://cocoapods.org/pods/WPInputBackout)

## Usage
1. 导入#import "UITextView+WPBackout.h"
2. [self.textView wpAddBackoutBar];
3. 也可以使用自定义按钮，这样需要响应- (void)wpTextViewBackoutAction事件。

## Requirements
iOS 7以上

## Installation

WPInputBackout is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'WPInputBackout'
```

## Author

823105162@qq.com

## License

WPInputBackout is available under the MIT license. See the LICENSE file for more info.
