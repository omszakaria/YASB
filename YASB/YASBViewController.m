//
//  ViewController.m
//  YASB
//
//  Created by iD Student on 6/28/13.
//  Copyright (c) 2013 Omar Zakaria. All rights reserved.
//

#import "YASBViewController.h"

@interface YASBViewController ()

@end

@implementation YASBViewController

@synthesize webView, addressBar;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // set navbar items
    self.navigationItem.title = @"YASB";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleBordered target:self action:@selector(goBack:)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Forward" style:UIBarButtonItemStyleBordered target:self action:@selector(goForward:)];
    self.navigationController.navigationBarHidden = NO;
    
    NSString *address =@"http://www.google.com";
    NSURL *url = [NSURL URLWithString: address];
    NSURLRequest *request = [NSURLRequest requestWithURL: url];

    [webView loadRequest: request];
    [addressBar setText: address];
}

-(IBAction)goAddress:(id)sender{
    NSURL *url = [NSURL URLWithString:[addressBar text]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
  
    [webView loadRequest:request];
    [addressBar resignFirstResponder];
}

-(IBAction)goBack:(id)sender{
    [webView goBack];
}

-(IBAction)goForward:(id)sender{
    [webView goForward];
}

-(BOOL)webView: (UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType: (UIWebViewNavigationType)navigationType{
    if (navigationType == UIWebViewNavigationTypeLinkClicked) {
        NSURL *url = [request URL];
        if ([[url scheme] isEqualToString:@"http"]){
            [addressBar setText: [url absoluteString]];
            [self goAddress:nil];
        }
        return NO;
    }
    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
