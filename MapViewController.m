//
//  MapViewController.m
//  MapKitSample
//
//  Created by paradigm creatives on 9/11/14.
//  Copyright (c) 2014 Paradigm Creatives. All rights reserved.
//

#import "MapViewController.h"
#import "MyAnnotation.h"
@interface MapViewController ()

@end

@implementation MapViewController

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
    [self createMap];
    [self locationManager];
    //[self testdata];
     // Do any additional setup after loading the view from its nib.
}

-(void)createMap{
    self.mapview=[[MKMapView alloc]initWithFrame:self.view.bounds];
    _mapview.mapType=MKMapTypeStandard;
    
    _mapview.showsUserLocation = YES;
    
        [self.view addSubview:_mapview];

}
-(void)locationManager
{
    
    
    self.locationmanager=[[CLLocationManager alloc]init];
    self.locationmanager.delegate=self;
    [self.locationmanager startUpdatingLocation];
 }

- (void)locationManager:(CLLocationManager *)manager
    didUpdateToLocation:(CLLocation *)newLocation
           fromLocation:(CLLocation *)oldLocation
{
 NSLog(@"latitude----%f",newLocation.coordinate.latitude);
 NSLog(@"longitude----%f",newLocation.coordinate.longitude);
    CLLocationCoordinate2D location;
    location.latitude = (double)newLocation.coordinate.latitude;
    location.longitude = (double)newLocation.coordinate.longitude;
    MyAnnotation *newAnnotation = [[MyAnnotation alloc]
                                    initWithTitle:@"Apple Head quaters" andCoordinate:location];
    [_mapview addAnnotation:newAnnotation];
    self.geocoder=[[CLGeocoder alloc]init];
    [self.geocoder reverseGeocodeLocation:newLocation completionHandler:^(NSArray *placemarks, NSError *error) {
       
           CLPlacemark *placemark=[placemarks objectAtIndex:0];
        NSLog(@"placemark %@",placemark.region);
        NSLog(@"placemark %@",placemark.country);  // Give Country Name
        NSLog(@"placemark %@",placemark.locality); // Extract the city name
        NSLog(@"location %@",placemark.name);
        NSLog(@"location %@",placemark.ocean);
        NSLog(@"location %@",placemark.postalCode);
        NSLog(@"location %@",placemark.subLocality);
        
    }];
    [self.locationmanager stopUpdatingLocation];

    }

//-(void)testdata
//{
//    CLGeocoder *ceo = [[CLGeocoder alloc]init];
//    CLLocation *loc = [[CLLocation alloc]initWithLatitude:17.8017 longitude:83.3533]; //insert your coordinates
//    
//    [ceo reverseGeocodeLocation: loc completionHandler:
//     ^(NSArray *placemarks, NSError *error) {
//         CLPlacemark *placemark = [placemarks objectAtIndex:0];
//         NSLog(@"placemark %@",placemark);
//         //String to hold address
//         NSString *locatedAt = [[placemark.addressDictionary valueForKey:@"FormattedAddressLines"] componentsJoinedByString:@", "];
//         NSLog(@"addressDictionary %@", placemark.addressDictionary);
//         
//         NSLog(@"placemark %@",placemark.region);
//         NSLog(@"placemark %@",placemark.country);  // Give Country Name
//         NSLog(@"placemark %@",placemark.locality); // Extract the city name
//         NSLog(@"location %@",placemark.name);
//         NSLog(@"location %@",placemark.ocean);
//         NSLog(@"location %@",placemark.postalCode);
//         NSLog(@"location %@",placemark.subLocality);
//         
//         NSLog(@"location %@",placemark.location);
//         //Print the location to console
//         NSLog(@"I am currently at %@",locatedAt);
//         
//         
//         }
//     ];
//}

  - (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
