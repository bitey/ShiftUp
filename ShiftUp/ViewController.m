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
    self.missLocationManager.delegate = self;
    self.myAnnotation = [[Annotation alloc]init];
}

-(void)locationManager:(CLLocationManager *)manager
       didFailWithError:(NSError *)error
{
    if (error) {
        NSLog(@"There was an error with Location Manager. Here is the error: %@", error);
    }
}

#pragma mark - Annotation Methods

-(void)createMapRegionAndSpanWithCoordinate:(CLLocationCoordinate2D)mostRecentCoordinate
{
    CLLocationCoordinate2D currentCoordinate =
    {
        .latitude = mostRecentCoordinate.latitude,
        .longitude = mostRecentCoordinate.longitude
    };
    
    
    MKCoordinateSpan currentSpan =
    {
        .latitudeDelta = 0.002f,
        .longitudeDelta = 0.002f
    };
    
    MKCoordinateRegion currentRegion =
    {
        currentCoordinate,
        currentSpan
    };

    mapViewOutlet.region = currentRegion;
}

-(void)createAnnotationAndAddToMapView
{
    self.myAnnotation.title = @"Test Annotation";
    self.myAnnotation.coordinate = self.missLocationManager.mostRecentCoordinate;
    self.myAnnotation.subtitle = @"This is a test, this is only a test";
    
    [mapViewOutlet addAnnotation:self.myAnnotation];
}

//-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation
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
