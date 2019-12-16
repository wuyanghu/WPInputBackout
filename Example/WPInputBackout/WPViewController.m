//
//  WPViewController.m
//  WPInputBackout
//
//  Created by 823105162@qq.com on 12/16/2019.
//  Copyright (c) 2019 823105162@qq.com. All rights reserved.
//

#import "WPViewController.h"
#import "UITextView+WPBackout.h"

@interface WPViewController ()
@property (weak, nonatomic) IBOutlet UITextView *textView;
@end

@implementation WPViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.textView wpAddBackoutToolBar];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
