//
//  ViewController.m
//  UIWindowBugDemo
//
//  Created by zhenby on 13-4-28.
//  Copyright (c) 2013年 zhenby. All rights reserved.
//

#import "ViewController.h"
#import "WebViewController.h"
#import "FixedBugWebViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize textField;
@synthesize buttonUIWindowBug;

- (void)dealloc
{
    [webViewController_ release];
    webViewController_ = nil;
    
    [webViewControllerFixedBug_ release];
    webViewControllerFixedBug_ = nil;
    
    [windowHighLevel_ release];
    windowHighLevel_ = nil;
    
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self.textField becomeFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Action handle
- (IBAction)onFixedBugButtonClick:(id)sender
{
    [self.textField resignFirstResponder];
    
    if (!windowHighLevel_)
    {
        windowHighLevel_ = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        // set the window level higher than UIWindowLevelNormal
        windowHighLevel_.windowLevel = UIWindowLevelNormal + 7;
    }
    
    if (!webViewControllerFixedBug_)
    {
        webViewControllerFixedBug_ = [[FixedBugWebViewController alloc] init];
        windowHighLevel_.rootViewController = webViewControllerFixedBug_;
    }
    
    // make sure be the key window
    [windowHighLevel_ makeKeyAndVisible];
}

- (IBAction)onBugButtonClick:(id)sender
{
    [self.textField resignFirstResponder];
    
    if (!windowHighLevel_)
    {
        windowHighLevel_ = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        // set the window level higher than UIWindowLevelNormal
        windowHighLevel_.windowLevel = UIWindowLevelNormal + 7;
    }
    
    if (!webViewController_)
    {
        webViewController_ = [[WebViewController alloc] init];
        windowHighLevel_.rootViewController = webViewController_;
    }
    
    // make sure be the key window
    [windowHighLevel_ makeKeyAndVisible];
}


@end
