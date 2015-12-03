//
//  MenuItemDetailViewController.m
//  DJCafe
//
//  Created by Appmonkeyz on 11/24/15.
//  Copyright © 2015 Appmonkeyz. All rights reserved.
//

#import "MenuItemDetailViewController.h"
#import "PhotoViewController.h"

@interface MenuItemDetailViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *lblFoodDescription;

@end

@implementation MenuItemDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.itemName;
    self.imageView.userInteractionEnabled=YES;
    self.lblFoodDescription.text = self.itemDescription;
    
    NSString *imageName = [NSString stringWithFormat:@"full%@",self.itemName];
    [self.imageView setImage:[UIImage imageNamed:imageName]];
    
    
    UITapGestureRecognizer* tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(Tapped:)];
    
    /* The number of fingers that must be on the screen */
    tapGestureRecognizer.numberOfTouchesRequired = 1;
    
    /* The total number of taps to be performed before the gesture is recognized */
    tapGestureRecognizer.numberOfTapsRequired = 1;
    
    [self.imageView addGestureRecognizer:tapGestureRecognizer];
    // Do any additional setup after loading the view.
}

-(void)Tapped:(UITapGestureRecognizer *)sender
{
    [self performSegueWithIdentifier:@"IMAGE_VIEW" sender:self];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    PhotoViewController *photoViewController = (PhotoViewController *)segue.destinationViewController;
    NSLog(@"%@",self.itemName);
    photoViewController.photoName = self.itemName;
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
