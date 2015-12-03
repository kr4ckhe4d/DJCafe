//
//  OurMenuViewController.m
//  DJCafe
//
//  Created by Appmonkeyz on 11/24/15.
//  Copyright © 2015 Appmonkeyz. All rights reserved.
//

#import "OurMenuViewController.h"
#import "MenuItemDetailViewController.h"

@interface OurMenuViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

NSDictionary *foodItems;
NSArray *sections;
NSDictionary *foodDescriptions;
NSDictionary *foodImageNames;

@implementation OurMenuViewController
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return sections.count;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return [sections objectAtIndex:section];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSString *title = [sections objectAtIndex:section];
    NSArray *foods = [foodItems objectForKey:title];
    return [foods count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    NSString *title = [sections objectAtIndex:indexPath.section];
    NSArray *foods =[foodItems objectForKey:title];
    NSString *food = [foods objectAtIndex:indexPath.row];
    cell.textLabel.text = food;
    
    UIImage *cellImage = [UIImage imageNamed:food];
    [cell.imageView setImage:cellImage];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self performSegueWithIdentifier:@"MENU_ITEM" sender:self];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"MENU_ITEM"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        MenuItemDetailViewController *menuItemDetailViewController =(MenuItemDetailViewController *)segue.destinationViewController;
        
        NSString *title = [sections objectAtIndex:indexPath.section];
        NSArray *foods =[foodItems objectForKey:title];
        NSString *food = [foods objectAtIndex:indexPath.row];
        
        NSString *foodDescription = [foodDescriptions objectForKey:food];
        menuItemDetailViewController.itemName = food;
        menuItemDetailViewController.itemDescription = foodDescription;
        
    }
    [self.tableView reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"Our Menu";
    
    foodItems = @{
                  @"Snacks" : @[@"Cheese Cubes", @"Yogurt", @"Nuts", @"Popcorn", @"Cereal"],
                  @"Dessert" : @[@"Fruit Pastry", @"Custard", @"Fruit Salad"],
                  @"Drinks" : @[@"Coke", @"Sprite", @"Fanta", @"Red Bull"]
                  };
    foodDescriptions = @{
                         @"Cheese Cubes" : @"Join us for lunch or to grab a cheese snack!",
                         @"Yogurt" : @"Enjoy our yogurt products in Strawberry, Blueberry and Vanilla flavors",
                         @"Fruit Pastry" : @"The pastries are tasty here!",
                         @"Custard" : @"Custard with fruits",
                         @"Fruit Salad" : @"Enjoy our fruit salads of your choice!",
                         @"Coke" : @"Coke 200ml",
                         @"Sprite" : @"Sprite 200ml",
                         @"Fanta" : @"Fanta 200ml",
                         @"Red Bull" : @"Red Bull 300ml Can",
                         @"Nuts" : @"Enjoy a variety of nuts for snacks",
                         @"Popcorn" : @"Popcorn 200g",
                         @"Cereal" : @"A variety of Cereal"
                         };
    
    sections=[[foodItems allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];//get all the keys of the foodItems array sorted and assign it to sections array
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
