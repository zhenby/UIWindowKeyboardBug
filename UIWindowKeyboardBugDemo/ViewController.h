//
//  ViewController.h
//  UIWindowBugDemo
//
//  Created by zhenby on 13-4-28.
//  Copyright (c) 2013年 zhenby. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WebViewController;
@class FixedBugWebViewController;

@interface ViewController : UIViewController
{
    UIWindow *windowHighLevel_;
    WebViewController *webViewController_;
    FixedBugWebViewController *webViewControllerFixedBug_;
}

@property(assign, nonatomic) IBOutlet UITextField *textField;
@property(assign, nonatomic) IBOutlet UIButton *buttonUIWindowBug;

@end
