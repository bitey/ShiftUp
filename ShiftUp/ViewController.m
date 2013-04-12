//
//  ViewController.m
//  ShiftUp
//
//  Created by StopBitingMe on 4/10/13.
//  Copyright (c) 2013 AFGE. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self startLocationUpdates];
    
    CLLocationCoordinate2D mmCoordinate =
    {
        .latitude = 41.894032f,
        .longitude = -87.634742f
    };
    
    //mmCoordinate.latitude = 41.894032f;
    //mmCoordinate.longitude = -87.634742f;
    
    
    MKCoordinateSpan span =
    {
        .latitudeDelta = 0.002f,
        .longitudeDelta = 0.002f
    };


}

#pragma mark - Location Manager Methods

- (void)locationManager:(CLLocationManager *)manager
	 didUpdateLocations:(NSArray *)locations
{
    
}

- (void)locationManager:(CLLocationManager *)manager
       didFailWithError:(NSError *)error
{
    if (error) {
        NSLog(@"There was an error with Location Manager. Here is the error: %@", error);
    }
}

-(void)startUpdatingLocation
{

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
