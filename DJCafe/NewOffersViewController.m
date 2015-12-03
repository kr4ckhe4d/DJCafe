//
//  NewOffersViewController.m
//  DJCafe
//
//  Created by Appmonkeyz on 11/24/15.
//  Copyright © 2015 Appmonkeyz. All rights reserved.
//

#import "NewOffersViewController.h"
#import "OfferDetailsViewController.h"

@interface NewOffersViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
NSArray *newOffersList;
NSArray *offerDetails;
NSArray *imageNames;
NSArray *offerDescriptions;
@implementation NewOffersViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"New Offers";
    newOffersList = @[
                      @"Free Delivery",
                      @"Pay For 3"
                      ];
    offerDetails = @[
                     @"2 days ago",
                     @"today"
                     ];
    offerDescriptions = @[
                          @"Free delivery for customers within 10KM from our cafe",
                          @"Buy a meal for 4 for the price for 3"
                          ];
    imageNames = @[@"offer1",
                   @"offer2"
                   ];
    
    // Do any additional setup after loading the view.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    NSUInteger number = [newOffersList count];
    
    return number;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    NSString *offerName = [newOffersList objectAtIndex:indexPath.row];
    cell.textLabel.text=offerName;
    
    NSString *offerSubtitle = [offerDetails objectAtIndex:indexPath.row];
    cell.detailTextLabel.text=offerSubtitle;
    
    NSString *rowNumber = [NSString stringWithFormat:@"free%ld",(long)indexPath.row];
    UIImage *cellImage = [UIImage imageNamed:rowNumber];
    [cell.imageView setImage:cellImage];
    
    return cell;
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
        [self performSegueWithIdentifier:@"OFFER_DETAILS" sender:self];//perform the segue
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender { //preparation for the segue
    
    if([segue.identifier isEqualToString:@"OFFER_DETAILS"]){
        
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];//get the indexPath of the selected row
        
        OfferDetailsViewController *offerDetailsViewController = (OfferDetailsViewController *)segue.destinationViewController;//create an object of the next view
        
        offerDetailsViewController.selectedRow=[newOffersList objectAtIndex:indexPath.row];//set the values of the next view
        offerDetailsViewController.imageName=[imageNames objectAtIndex:indexPath.row];//set the values of the next view
        offerDetailsViewController.offerDescription=[offerDescriptions objectAtIndex:indexPath.row];//set the values of the next view
    }
    [self.tableView reloadData];
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
