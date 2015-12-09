//
//  ViewController.m
//  DJCafe
//
//  Created by Appmonkeyz on 11/23/15.
//  Copyright © 2015 Appmonkeyz. All rights reserved.
//

#import "MainMenuViewController.h"



@interface MainMenuViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;


@end
NSArray *mainMenuItems;
int count = 1;
NSString *imageName;

@implementation MainMenuViewController



- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    NSUInteger number = [mainMenuItems count];
    return number;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
   
    NSString *rowNumber = [NSString stringWithFormat:@"%ld",(long)indexPath.row];//get the row number
    NSString *menuItem=[mainMenuItems objectAtIndex:indexPath.row];//get the item related to the row number
    UIImage *myImage = [UIImage imageNamed:rowNumber];//get the image for thumbnail
    
    [cell.imageView setImage:myImage];//set the thumbnail
    cell.textLabel.text=menuItem;
    cell.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0.2];//make the cell background transparent
    return cell;
    
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.title=@"D&J Cafe";//navbar title
    mainMenuItems = @[
                      @"New Offers",
                      @"Our Menu",
                      @"Online Reservation",
                      @"Store Locator",
                      @"About Us"
                      ];
    
    self.tableView.scrollEnabled=NO;//disable scrolling of the main menu table view
    [self.navigationController.navigationBar setTitleTextAttributes:@{
                                                                      NSForegroundColorAttributeName:[UIColor whiteColor]
                                                                      }];
    [self animateImages];
    //Do any additional setup after loading the view.
    //NSArray *animationFrames= [NSArray arrayWithObjects:
    //                                                  [UIImage imageNamed:@"home1"],
    //                                                  [UIImage imageNamed:@"home2"],
    //                                                  [UIImage imageNamed:@"home3"],
    //                                                  [UIImage imageNamed:@"Homepage"],nil];//choose the images set
    // self.imageView.animationImages=animationFrames;//add images to the image view
    // self.imageView.animationDuration=16;//set the transition time
    // [self.imageView startAnimating];//start the stransition
    // self.imageView.image = [UIImage imageNamed:@"home1"];
}

- (void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:YES];
  //  [self animateImages];
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    [self.tableView reloadData];
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if(indexPath.row==0){
        
        [self performSegueWithIdentifier:@"NEW_OFFERS" sender:self];
    }
    if (indexPath.row==1) {
        
        [self performSegueWithIdentifier:@"OUR_MENU" sender:self];
    }
    if (indexPath.row==2) {
        
        [self performSegueWithIdentifier:@"ORDER_ONLINE" sender:self];
    }
    if (indexPath.row==3) {
        
        [self performSegueWithIdentifier:@"STORE_LOCATOR" sender:self];
    }
    if (indexPath.row==4) {
        
        [self performSegueWithIdentifier:@"ABOUT_US" sender:self];
    }
}

-(void)animateImages {
    
    if (count < 4 && count >0) {
        
        count++;
        imageName = [NSString stringWithFormat:@"home%d",count];
        
    }
    else{
        
        count = 1;
        imageName = [NSString stringWithFormat:@"home%d",count];
        
    }
    
    [UIView animateWithDuration:2
                          delay:1
                        options:UIViewAnimationOptionCurveLinear
                     animations:^{
                         
                         self.imageView.image = [UIImage imageNamed:imageName];
                         self.imageView.alpha=1.0;
                         
                     }
                     completion:^(BOOL finished) {
                         
                         [self changeImages];
                         
                     }];
    
    
}


- (void)changeImages {
    
    [UIView animateWithDuration:2
                          delay:1
                        options:UIViewAnimationOptionCurveLinear
                     animations:^(void){
                         
                         self.imageView.alpha = 0.0;
                         
                     }
                     completion:^(BOOL finished) {
                         
                         [self animateImages];
                         
                     }];
    
}
@end
