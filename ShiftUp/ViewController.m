//
//  ViewController.m
//  ShiftUp
//
//  Created by StopBitingMe on 4/10/13.
//  Copyright (c) 2013 AFGE. All rights reserved.
//

#import "ViewController.h"
#import "LocationManager.h"
#import "Annotation.h"

@interface ViewController ()
{
    __weak IBOutlet MKMapView *mapViewOutlet;
}

@property (strong, nonatomic) Annotation *myAnnotation;
@property (strong, nonatomic) LocationManager *missLocationManager;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.missLocationManager = [[LocationManager alloc]init];
    self.myAnnotation = [[Annotation alloc]init];
//    self.mrLocationManager = [[CLLocationManager alloc]init];
//    self.mrLocationManager.delegate = self;
//    [self.mrLocationManager startUpdatingLocation];
//    self.mrLocationManager.desiredAccuracy = kCLLocationAccuracyBest;

    
    
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


-(void)locationManager:(CLLocationManager *)manager
	 didUpdateLocations:(NSArray *)locations
{
    [self updatePersonalCoordinates: ((CLLocation*)[locations lastObject]).coordinate];
}

-(void)updatePersonalCoordinates:(CLLocationCoordinate2D)newCoordinate
{
    NSLog(@"updating coordinate with latitude: %f and longitude: %f", newCoordinate.latitude, newCoordinate.longitude);
}


-(void)updateMapViewWithNewCenter:(CLLocationCoordinate2D)newCoordinate
{
    
}

-(void)locationManager:(CLLocationManager *)manager
       didFailWithError:(NSError *)error
{
    if (error) {
        NSLog(@"There was an error with Location Manager. Here is the error: %@", error);
    }
}

#pragma mark - Annotation Methods

//- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation
//{
//    
//}

-(void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view
{
    
}

-(void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

}

@end
