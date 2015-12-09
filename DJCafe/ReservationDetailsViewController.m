//
//  ReservationDetailsViewController.m
//  DJCafe
//
//  Created by Nipuna H Herath on 12/9/15.
//  Copyright © 2015 Appmonkeyz. All rights reserved.
//

#import "ReservationDetailsViewController.h"

@interface ReservationDetailsViewController ()
@property (weak, nonatomic) IBOutlet UITextField *txtAdults;
@property (weak, nonatomic) IBOutlet UITextField *txtKids;
@property (weak, nonatomic) IBOutlet UILabel *lblKids;
@property (weak, nonatomic) IBOutlet UISwitch *swKidsYesNo;
@property (weak, nonatomic) IBOutlet UITextView *tfSpecialMentions;
@property (weak, nonatomic) IBOutlet UILabel *lblCurrentSelection;
@property (weak, nonatomic) IBOutlet UIButton *btnReserve;

@end
NSString *message;
@implementation ReservationDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.swKidsYesNo.on=NO;
    [self.lblKids setHidden:YES];
    [self.txtKids setHidden:YES];
    self.btnReserve.layer.cornerRadius = 3;
    self.btnReserve.backgroundColor = [UIColor greenColor];
    self.title = @"Reservation Details";
    self.tfSpecialMentions.layer.borderWidth = 0.5;
    self.tfSpecialMentions.layer.cornerRadius = 9;
    self.lblCurrentSelection.text = [NSString stringWithFormat:@"%@ %@",self.floorNumber,self.roomNumber];
    // Do any additional setup after loading the view.
}

- (IBAction)swToggle:(id)sender {
    if (self.swKidsYesNo.on == YES) {
        [self.lblKids setHidden:NO];
        [self.txtKids setHidden:NO];
    }
    else{
        [self.lblKids setHidden:YES];
        [self.txtKids setHidden:YES];
        self.txtKids.text=0;
    }
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [[self view] endEditing:YES];
}
- (IBAction)btnReserve:(id)sender {
    if (self.swKidsYesNo.on==NO) {
            message = [NSString stringWithFormat:@"Floor Number : %@\rRoom Number : %@\rAdults : %@\rSp.Mentions : %@\r",self.floorNumber,self.roomNumber,self.txtAdults.text,self.tfSpecialMentions.text];
    }
    else{
            message = [NSString stringWithFormat:@"Floor Number : %@\rRoom Number : %@\rAdults : %@\rKids : %@\rSp.Mentions : %@\r",self.floorNumber,self.roomNumber,self.txtAdults.text,self.txtKids.text,self.tfSpecialMentions.text];
    }
    
    UIAlertController * alert=   [UIAlertController
                                  alertControllerWithTitle:@"Reservation Confirmation"
                                  message:message
                                  preferredStyle:UIAlertControllerStyleAlert];
    
    [self presentViewController:alert animated:YES completion:nil];
    
    UIAlertAction* ok = [UIAlertAction
                         actionWithTitle:@"Confirm"
                         style:UIAlertActionStyleDefault
                         handler:^(UIAlertAction * action)
                         {
                             //Do some thing here
                             [alert dismissViewControllerAnimated:YES completion:nil];
                             
                         }];
    [alert addAction:ok];
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
