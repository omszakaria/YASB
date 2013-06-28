//
//  ViewController.h
//  YASB
//
//  Created by iD Student on 6/28/13.
//  Copyright (c) 2013 Omar Zakaria. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YASBViewController : UIViewController <UIWebViewDelegate>

@property(strong, nonatomic) IBOutlet UIWebView *webView;
@property(strong, nonatomic) IBOutlet UITextField *addressBar;

-(IBAction)goAddress: (id)sender;
-(IBAction)goBack: (id) sender;
-(IBAction)goForward: (id) sender;

@end
