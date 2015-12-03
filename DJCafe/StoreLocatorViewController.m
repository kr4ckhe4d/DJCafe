//
//  StoreLocatorViewController.m
//  DJCafe
//
//  Created by Appmonkeyz on 11/24/15.
//  Copyright © 2015 Appmonkeyz. All rights reserved.
//

#import "StoreLocatorViewController.h"
#import "DetailedMapViewController.h"


@interface StoreLocatorViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
NSArray *locationNames;
NSArray *locationLatitudes;
NSArray *locationLongitudes;

@implementation StoreLocatorViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    locationNames = @[
                      @"Rajagiriya",
                      @"Galle Road",
                      @"High Level Road"
                      
                      ];
    locationLatitudes = @[
                         @"6.910305",
                         @"6.903709",
                         @"6.870567"
                         ];
    
    locationLongitudes = @[
                          @"79.888654",
                          @"79.851964",
                          @"79.886227"
                          ];
    
    
    // Do any additional setup after loading the view.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSUInteger number = [locationNames count];
    return number;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    NSString *storeName = [locationNames objectAtIndex:indexPath.row];
    cell.textLabel.text=storeName;
    
    UIImage *myImage = [UIImage imageNamed:@"3"];//get the image for thumbnail
    [cell.imageView setImage:myImage];//set the thumbnail
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self performSegueWithIdentifier:@"DETAILED_MAP" sender:self];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    DetailedMapViewController *detailedMapViewController = (DetailedMapViewController *)segue.destinationViewController;
    
    detailedMapViewController.storeLocation=[locationNames objectAtIndex:indexPath.row];
    detailedMapViewController.storeLatitude=[locationLatitudes objectAtIndex:indexPath.row];
    detailedMapViewController.storeLongitude=[locationLongitudes objectAtIndex:indexPath.row];
    
    [self.tableView reloadData];
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
