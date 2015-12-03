//
//  DetailedMapViewController.m
//  DJCafe
//
//  Created by Appmonkeyz on 11/26/15.
//  Copyright © 2015 Appmonkeyz. All rights reserved.
//

#import "DetailedMapViewController.h"
#import <MapKit/MapKit.h>
#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface DetailedMapViewController () <MKMapViewDelegate,CLLocationManagerDelegate>
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (strong,nonatomic) CLLocationManager *locationManager;

@end

@implementation DetailedMapViewController
@synthesize mapView;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title=self.storeLocation;
    self.mapView.delegate=self;
    self.locationManager.delegate=self;
    self.locationManager = [[CLLocationManager alloc] init];
    [self.locationManager requestWhenInUseAuthorization];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation{
    
    CLLocationCoordinate2D myCoordinate;
    myCoordinate.latitude = [self.storeLatitude floatValue];
    myCoordinate.longitude = [self.storeLongitude floatValue];
    
    MKPointAnnotation *annotationPoint = [[MKPointAnnotation alloc] init];
    [annotationPoint setCoordinate:myCoordinate];
    annotationPoint.title = self.storeLocation;
    [self.mapView addAnnotation:annotationPoint];
    
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(myCoordinate, 100, 100); //zoom in to the region
    [self.locationManager startUpdatingLocation];
    [self.mapView setRegion:[self.mapView regionThatFits:region] animated:YES];
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
