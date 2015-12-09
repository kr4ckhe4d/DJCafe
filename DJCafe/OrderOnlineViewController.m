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
@property (weak, nonatomic) IBOutlet UILabel *lblTest;
@property MagnetPopupPickerButton *button1;
@property (weak, nonatomic) IBOutlet UIButton *btnContinue;
@property MagnetPopupPickerButton *button2;
@end

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
                     [MagnetKeyValuePair keyValuePairWithKeyAndValue:@"test3" value:@"4th Floor"],
                     nil];
    
    NSArray *roomNumber = [NSArray arrayWithObjects:
                            [MagnetKeyValuePair keyValuePairWithKeyAndValue:@"test1" value:@"1st Room"],
                            [MagnetKeyValuePair keyValuePairWithKeyAndValue:@"test2" value:@"2nd Room"],
                            [MagnetKeyValuePair keyValuePairWithKeyAndValue:@"test3" value:@"3rd Room"],
                            nil];
    
    
    
    
    self.button1 = [[MagnetPopupPickerButton alloc] initWithFrame:CGRectMake(self.view.bounds.size.width/2, self.navigationController.navigationBar.frame.size.height+20, self.view.bounds.size.width/2, 30)];
    self.button1.backgroundColor = [UIColor darkGrayColor];
    self.button1.popoverColor = [UIColor lightGrayColor];
    [self.button1 setTitle:@"Select Room" forState:UIControlStateNormal];
    [self.button1 setOptions:roomNumber keyNames:[MagnetKeyValuePair keyValuePairWithKeyAndValue:@"key" value:@"value"]];
    [self.view addSubview:self.button1];
    
    
    self.button2 = [[MagnetPopupPickerButton alloc] initWithFrame:CGRectMake(0, self.navigationController.navigationBar.frame.size.height+20, self.view.bounds.size.width/2, 30)];
    self.button2.backgroundColor = [UIColor darkGrayColor];
    self.button2.popoverColor = [UIColor lightGrayColor];
    [self.button2 setTitle:@"Select Floor" forState:UIControlStateNormal];
    [self.button2 setOptions:floorNumber keyNames:[MagnetKeyValuePair keyValuePairWithKeyAndValue:@"key" value:@"value"]];
    [self.view addSubview:self.button2];
    // Do any additional setup after loading the view.
}
- (IBAction)btnTestPressed:(id)sender {
    self.lblTest.text = self.button1.titleLabel.text;
    if ([self.button1.titleLabel.text  isEqual: @"Select Room"] | [self.button2.titleLabel.text  isEqual: @"Select Floor"] ) {
        UIAlertController * alert=   [UIAlertController
                                      alertControllerWithTitle:@"Incomplete Selection"
                                      message:@"Select a valid Floor and a Room"
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

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    ReservationDetailsViewController *reservationDetailsController = (ReservationDetailsViewController * )segue.destinationViewController;
    reservationDetailsController.roomNumber=self.button1.titleLabel.text;
    reservationDetailsController.floorNumber=self.button2.titleLabel.text;
}

-(void)performSegue{
    [self performSegueWithIdentifier:@"RESERVATION_DETAILS" sender:self];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.button1 resignFirstResponder];
    [self.button2 resignFirstResponder];
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
