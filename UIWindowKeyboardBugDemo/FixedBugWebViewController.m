//
//  FixedBugWebViewController.m
//  UIWindowBugDemo
//
//  Created by zhenby on 13-5-2.
//  Copyright (c) 2013年 zhenby. All rights reserved.
//

#import "FixedBugWebViewController.h"

@interface FixedBugWebViewController ()

@end

@implementation FixedBugWebViewController

@synthesize webView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.google.com"]]];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    // Fix bug
    if ([[[UIDevice currentDevice] systemVersion] floatValue] < 6.0)
    {
        UITextField *textFieldFixKeyBoardBug = [[UITextField alloc] initWithFrame:self.view.bounds];
        [self.view addSubview:textFieldFixKeyBoardBug];
        
        [textFieldFixKeyBoardBug becomeFirstResponder];
        [textFieldFixKeyBoardBug resignFirstResponder];
        
        [textFieldFixKeyBoardBug removeFromSuperview];
        [textFieldFixKeyBoardBug release];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
