//
//  OfferDetailsViewController.m
//  DJCafe
//
//  Created by Appmonkeyz on 11/24/15.
//  Copyright © 2015 Appmonkeyz. All rights reserved.
//

#import "OfferDetailsViewController.h"

@interface OfferDetailsViewController ()
@property (weak, nonatomic) IBOutlet UILabel *lblOfferDescription;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;


@end

@implementation OfferDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.selectedRow;
    self.lblOfferDescription.text = self.offerDescription;
    [self.imageView setImage:[UIImage imageNamed:self.imageName]];
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
