//
//  AboutUsViewController.m
//  DJCafe
//
//  Created by Appmonkeyz on 11/24/15.
//  Copyright © 2015 Appmonkeyz. All rights reserved.
//

#import "AboutUsViewController.h"
#import "WebViewController.h"

@interface AboutUsViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end
NSArray *contactOptions;
NSArray *contactLinks;
NSArray *contactURLs;

@implementation AboutUsViewController
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    NSString *contactOption = [contactOptions objectAtIndex:indexPath.row];
    cell.textLabel.text = contactOption;
    
    NSString *contactLink = [contactURLs objectAtIndex:indexPath.row];
    cell.detailTextLabel.text = contactLink;
    cell.detailTextLabel.numberOfLines=2;
    
    NSString *imageName = [NSString stringWithFormat:@"%@",contactOption];
    UIImage *cellImage = [UIImage imageNamed:imageName];
    [cell.imageView setImage:cellImage];
    
    return cell;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"About Us";
    [self.imageView setImage:[UIImage imageNamed:@"About Us"]];
    self.tableView.scrollEnabled=NO;
    
    contactOptions = @[
                       @"Our Website",
                       @"Facebook",
                       @"Twitter",
                       @"Call Us"
                       ];
    contactURLs = @[
                     @"appmonkeyz.com",
                     @"/appmonkeyz",
                     @"@AppmonkeyZ",
                     @"0112690896"
                     ];
    
    contactLinks = @[
                     @"http://www.appmonkeyz.com",
                     @"https://www.facebook.com/appmonkeyz",
                     @"https://twitter.com/AppmonkeyZ",
                     @"0112690896"
                     ];
    // Do any additional setup after loading the view.
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if ([[contactOptions objectAtIndex:indexPath.row] isEqualToString:@"Call Us"]) {
        NSString *phone = [contactLinks objectAtIndex:indexPath.row];
        NSString *phoneNumber = [[NSString alloc] initWithFormat:@"telprompt://%@",phone];
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:phoneNumber]];
    }
    else{
        [self performSegueWithIdentifier:@"WEB_VIEW" sender:self];
    }
    [self.tableView reloadData];
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    WebViewController *webViewController = (WebViewController *)segue.destinationViewController;
    webViewController.webLink = [contactLinks objectAtIndex:indexPath.row];
    
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
