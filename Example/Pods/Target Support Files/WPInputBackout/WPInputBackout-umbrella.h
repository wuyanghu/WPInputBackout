#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "UITextView+WPBackout.h"
#import "WPTextViewBackoutManager.h"
#import "WPTextViewChangeModel.h"

FOUNDATION_EXPORT double WPInputBackoutVersionNumber;
FOUNDATION_EXPORT const unsigned char WPInputBackoutVersionString[];

