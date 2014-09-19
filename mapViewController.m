//
//  mapViewController.m
//  MapViews
//
//  Created by Paradigm on 9/11/14.
//  Copyright (c) 2014 paradigmcreatives. All rights reserved.
//

#import "mapViewController.h"

@interface mapViewController ()

@end

@implementation mapViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self LoadMapView];
    [self CoreLocation];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)LoadMapView
{
    _mapView = [[MKMapView alloc] initWithFrame:self.view.bounds];
    _mapView.mapType = MKMapTypeSatellite;
    [self.view addSubview:_mapView];
}
-(void)CoreLocation
{   if([CLLocationManager locationServicesEnabled])
    {
     _locationManager = [[CLLocationManager alloc] init];
     _locationManager.delegate=self;
     [_locationManager startUpdatingLocation];
    }
    else
    {
        NSLog(@"if condition failed");
    }
}
-(void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    float  latitude=newLocation.coordinate.latitude;
    float  longitude=newLocation.coordinate.longitude;
      NSLog(@"the lattitude %f",latitude);
      NSLog(@"the longitude %f",longitude);
    CLLocationCoordinate2D coordinate;
    coordinate.latitude = (double)newLocation.coordinate.latitude;
    coordinate.longitude = (double)newLocation.coordinate.longitude;
    Anotation *anotation = [[Anotation alloc] initWithTitle:@"Mumbai" AndCoordinate:coordinate];
    [_mapView addAnnotation:anotation];

       _geoCoder = [[CLGeocoder alloc]init];
   
    [_geoCoder reverseGeocodeLocation:[[CLLocation alloc]initWithLatitude:latitude longitude:longitude] completionHandler:^(NSArray *placemarks, NSError *error) {
        
        CLPlacemark *placemark=[placemarks objectAtIndex:0];
        NSLog(@"Place %@",[placemarks objectAtIndex:0]);
        NSLog(@"Place Name %@",placemark.country);
        NSLog(@"Place Name %@",placemark.region);
        


        
    }];
    //[_locationManager stopUpdatingLocation];

    

     }
@end
