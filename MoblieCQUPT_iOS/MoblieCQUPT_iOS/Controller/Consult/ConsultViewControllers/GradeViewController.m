//
//  GradeViewController.m
//  MoblieCQUPT_iOS
//
//  Created by RainyTunes on 8/25/15.
//  Copyright (c) 2015 Orange-W. All rights reserved.
//

#import "GradeViewController.h"
#import "We.h"

@interface GradeViewController ()

@end

@implementation GradeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self initNavigationBar:@"成绩查询"];
    
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 100, [We getScreenWidth], [We getScreenHeight] - 100)];
    [scrollView setContentSize:CGSizeMake([We getScreenWidth] + 300, [We getScreenHeight] - 100)];
    UIWebView *webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, [We getScreenWidth] + 300, [We getScreenHeight] - 100)];
    [webView loadHTMLString:self.delegate.htmlString baseURL:[NSURL fileURLWithPath: [[NSBundle mainBundle] resourcePath] isDirectory: YES]];
    [scrollView addSubview:webView];
    [self.view addSubview:scrollView];
    
//    UIWebView *webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 100, [We getScreenWidth], [We getScreenHeight] - 100)];
//    [webView loadHTMLString:self.delegate.htmlString baseURL:[NSURL fileURLWithPath: [[NSBundle mainBundle] resourcePath] isDirectory: YES]];
//    [self.view addSubview:webView];
    // Do any additional setup after loading the view.
}

- (void)initNavigationBar:(NSString *)title{
    UINavigationBar *navigaionBar = [[UINavigationBar alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 64)];
    UINavigationItem *navigationItem  = [[UINavigationItem alloc]initWithTitle:nil];
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(clickBack)];
    [navigaionBar pushNavigationItem:navigationItem animated:YES];
    [navigaionBar setBackgroundColor:COLOR_NAVIGATIONBAR];
    [navigaionBar setTintColor:COLOR_MAINCOLOR];
    
    navigaionBar.layer.shadowColor = [UIColor blackColor].CGColor;
    navigaionBar.layer.shadowOffset = CGSizeMake(2.0f, 2.0f);//有个毛线用啊
    navigaionBar.layer.shadowOpacity = 0.1f;
    navigaionBar.layer.shadowRadius = 1.0f;
    
    [navigationItem setLeftBarButtonItem:leftButton];
    [navigationItem setTitle:title];
    [self.view addSubview:navigaionBar];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)clickBack {
	[self dismissViewControllerAnimated:YES completion:nil];
}

@end
