//
//  mapViewController.h
//  MapViews
//
//  Created by Paradigm on 9/11/14.
//  Copyright (c) 2014 paradigmcreatives. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "Anotation.h"

@interface mapViewController : UIViewController<CLLocationManagerDelegate>
@property(strong,nonatomic) MKMapView *mapView;
@property(strong,nonatomic) CLLocationManager *locationManager;
@property(strong,nonatomic) CLGeocoder *geoCoder;

@end
