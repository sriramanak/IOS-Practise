//
//  MapViewController.h
//  MapKitSample
//
//  Created by paradigm creatives on 9/11/14.
//  Copyright (c) 2014 Paradigm Creatives. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface MapViewController : UIViewController<CLLocationManagerDelegate>
@property(nonatomic,strong) MKMapView *mapview;
@property(nonatomic,strong) CLLocationManager *locationmanager;
@property(nonatomic,strong) CLGeocoder *geocoder;

@end
