//
//  ViewController.m
//  ShiftUp
//
//  Created by StopBitingMe on 4/10/13.
//  Copyright (c) 2013 AFGE. All rights reserved.
//

#import "ViewController.h"
#import "Annotation.h"

@interface ViewController ()
{
    __weak IBOutlet MKMapView *mapViewOutlet;
}
@property (strong, nonatomic) Annotation *myAnnotation;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.myAnnotation = [[Annotation alloc]init];
    self.mrLocationManager = [[CLLocationManager alloc]init];
    [self.mrLocationManager startUpdatingLocation];
    
    
    
    CLLocationCoordinate2D testCoordinate =
    {
        .latitude = 41.894032f,
        .longitude = -87.634742f
    };
    
    
    MKCoordinateSpan testSpan =
    {
        .latitudeDelta = 0.002f,
        .longitudeDelta = 0.002f
    };
    
    MKCoordinateRegion testRegion =
    {
        testCoordinate,
        testSpan
    };
    
    self.myAnnotation.title = @"Test Annotation";
    self.myAnnotation.coordinate = testCoordinate;
    self.myAnnotation.subtitle = @"This is a test, this is only a test";
    
    mapViewOutlet.region = testRegion;
    [mapViewOutlet addAnnotation:self.myAnnotation];
}

#pragma mark - Location Manager Methods

// if the location manager hasn't started, start it.
// tell the location manager to start monitoring for significant changes
-(void)startUpdatingLocation
{
    if (self.mrLocationManager == nil)
    {
        self.mrLocationManager = [[CLLocationManager alloc]init];
    }
    
    self.mrLocationManager.delegate = self;
    [self.mrLocationManager startMonitoringSignificantLocationChanges];
    self.mrLocationManager.desiredAccuracy = kCLLocationAccuracyBest;
}

//Method is from the CLLocationManager protocol
- (void)locationManager:(CLLocationManager *)manager
	 didUpdateLocations:(NSArray *)locations
{
    [self updatePersonalCoordinates: ((CLLocation*)[locations lastObject]).coordinate];
}

-(void)updatePersonalCoordinates:(CLLocationCoordinate2D)newCoordinate
{
    NSLog(@"updating coordinate with latitude: %f and longitude: %f", newCoordinate.latitude, newCoordinate.longitude);
}

//Method is from the CLLocationManager protocol
- (void)locationManager:(CLLocationManager *)manager
       didFailWithError:(NSError *)error
{
    if (error) {
        NSLog(@"There was an error with Location Manager. Here is the error: %@", error);
    }
}

#pragma mark - Annotation Methods

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation
{
    
}

- (void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view
{
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

}

@end
