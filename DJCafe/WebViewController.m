//
//  WebViewController.m
//  DJCafe
//
//  Created by Appmonkeyz on 11/26/15.
//  Copyright © 2015 Appmonkeyz. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation WebViewController

- (void)viewDidLoad {
    [self.view addSubview:self.webView];
    [super viewDidLoad];
    NSURL *urlforWebView=[NSURL URLWithString:self.webLink];
    NSURLRequest *urlRequest=[NSURLRequest requestWithURL:urlforWebView];
    [self.webView loadRequest:urlRequest];
    // Do any additional setup after loading the view.
    
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

@end
