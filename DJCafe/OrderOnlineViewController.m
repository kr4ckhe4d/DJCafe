//
//  OrderOnlineViewController.m
//  DJCafe
//
//  Created by Appmonkeyz on 11/24/15.
//  Copyright © 2015 Appmonkeyz. All rights reserved.
//

#import "OrderOnlineViewController.h"
#import "MagnetPopupPickerButton.h"
#import "ReservationDetailsViewController.h"

@interface OrderOnlineViewController ()
@property MagnetPopupPickerButton *button1;
@property (weak, nonatomic) IBOutlet UIButton *btnContinue;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property MagnetPopupPickerButton *button2;
@end
NSArray *collectionImages;
NSString *tableName;
@implementation OrderOnlineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"Online Reservation";
    self.btnContinue.layer.cornerRadius = 3;
    self.btnContinue.backgroundColor = [UIColor greenColor];
    
    NSArray *floorNumber = [NSArray arrayWithObjects:
                     [MagnetKeyValuePair keyValuePairWithKeyAndValue:@"test1" value:@"1st Floor"],
                     [MagnetKeyValuePair keyValuePairWithKeyAndValue:@"test2" value:@"2nd Floor"],
                     [MagnetKeyValuePair keyValuePairWithKeyAndValue:@"test3" value:@"3rd Floor"],
                     nil];
    
    NSArray *roomNumber = [NSArray arrayWithObjects:
                            [MagnetKeyValuePair keyValuePairWithKeyAndValue:@"test1" value:@"1st Room"],
                            [MagnetKeyValuePair keyValuePairWithKeyAndValue:@"test2" value:@"2nd Room"],
                            nil];
    
    
    
    
    self.button1 = [[MagnetPopupPickerButton alloc] initWithFrame:CGRectMake(self.view.bounds.size.width/2, self.navigationController.navigationBar.frame.size.height+20, self.view.bounds.size.width/2, 40)];
    self.button1.backgroundColor = [UIColor darkGrayColor];
    self.button1.popoverColor = [UIColor lightGrayColor];
    [self.button1 setTitle:@"Select Room" forState:UIControlStateNormal];
    [self.button1 setOptions:roomNumber keyNames:[MagnetKeyValuePair keyValuePairWithKeyAndValue:@"key" value:@"value"]];
    [self.view addSubview:self.button1];
    
    
    self.button2 = [[MagnetPopupPickerButton alloc] initWithFrame:CGRectMake(0, self.navigationController.navigationBar.frame.size.height+20, self.view.bounds.size.width/2, 40)];
    self.button2.backgroundColor = [UIColor darkGrayColor];
    self.button2.popoverColor = [UIColor lightGrayColor];
    [self.button2 setTitle:@"Select Floor" forState:UIControlStateNormal];
    [self.button2 setOptions:floorNumber keyNames:[MagnetKeyValuePair keyValuePairWithKeyAndValue:@"key" value:@"value"]];
    [self.view addSubview:self.button2];
    
    collectionImages = [NSArray arrayWithObjects:@"Table 1",@"Table 2",@"Table 3",@"Table 4",@"Table 5",@"Table 6", nil];
    self.collectionView.backgroundColor=[UIColor whiteColor];
    // Do any additional setup after loading the view.
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [self clearCellSelections];
   // NSLog(@"%@",[collectionImages objectAtIndex:indexPath.row]);
    UICollectionViewCell* cell = [collectionView  cellForItemAtIndexPath:indexPath];
    //collectionView.layer.borderColor = [UIColor blackColor].CGColor;
    
    
    cell.layer.borderColor = [UIColor blueColor].CGColor;
    tableName = [NSString stringWithFormat:@"%@", [collectionImages objectAtIndex:indexPath.row]];
    NSLog(@"%@",tableName);

}

- (void)clearCellSelections {
    NSInteger collectonViewCount = [self.collectionView numberOfItemsInSection:0];
    for (int i=0; i<=collectonViewCount; i++) {
        UICollectionViewCell* cell = [self.collectionView  cellForItemAtIndexPath:[NSIndexPath indexPathForItem:i inSection:0]];
        cell.layer.borderColor = [UIColor blackColor].CGColor;
    }
}

- (IBAction)btnTestPressed:(id)sender {
    if ([self.button1.titleLabel.text  isEqual: @"Select Room"] | [self.button2.titleLabel.text  isEqual: @"Select Floor"] | tableName == NULL) {
        UIAlertController * alert=   [UIAlertController
                                      alertControllerWithTitle:@"Incomplete Selection"
                                      message:@"Select a valid Floor, a Room and a Table"
                                      preferredStyle:UIAlertControllerStyleAlert];
        
        [self presentViewController:alert animated:YES completion:nil];
        
        UIAlertAction* ok = [UIAlertAction
                             actionWithTitle:@"OK"
                             style:UIAlertActionStyleDefault
                             handler:^(UIAlertAction * action)
                             {
                                 //Do some thing here
                                 [alert dismissViewControllerAnimated:YES completion:nil];
                                 
                             }];
        [alert addAction:ok];
    }
    else{
        [self performSegue];
    }
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
   // NSLog(@"%d",collectionImages.count);
    return collectionImages.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"Cell";
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    UIImageView *collectionImageView = (UIImageView *)[cell viewWithTag:100];
    collectionImageView.image = [UIImage imageNamed:[collectionImages objectAtIndex:indexPath.row]];
   // NSLog(@"%@",[collectionImages objectAtIndex:indexPath.row]);
    //cell.selected = YES;
    cell.layer.borderWidth = 1;
    cell.layer.borderColor = [UIColor blackColor].CGColor;
    return cell;
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    ReservationDetailsViewController *reservationDetailsController = (ReservationDetailsViewController * )segue.destinationViewController;
    reservationDetailsController.roomNumber=self.button1.titleLabel.text;
    reservationDetailsController.floorNumber=self.button2.titleLabel.text;
    reservationDetailsController.imageName = tableName;
}

-(void)performSegue{
    [self performSegueWithIdentifier:@"RESERVATION_DETAILS" sender:self];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.button1 resignFirstResponder];
    [self.button2 resignFirstResponder];
    if (![self.button1.titleLabel.text   isEqual: @"Select Room"] && ![self.button2.titleLabel.text  isEqual: @"Select Floor"] ){
        NSLog(@"hah");
    }
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
