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
    __weak IBOutlet UISearchBar *searchBarOutlet;
}

@property (strong, nonatomic) APIManager *eventAPIManager;
@property (strong, nonatomic) Annotation *myAnnotation;
@property (assign, nonatomic) CLLocationCoordinate2D currentCoordinate;
@property (strong, nonatomic) GeocodingManager *missGeocodingManager;
@property (strong, nonatomic) LocationManager *missLocationManager;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.missLocationManager = [[LocationManager alloc]init];
    self.missGeocodingManager = [[GeocodingManager alloc]init];
    
    self.missLocationManager.delegate = self;
    
    self.missGeocodingManager.delegate = self;
    
}

#pragma mark - Creating the Map Methods

-(void)hasCurrentCoordinate:(CLLocationCoordinate2D)mostRecentCoordinate
{
    self.currentCoordinate = mostRecentCoordinate;
    self.eventAPIManager = [[APIManager alloc]initWithNewCoordinates:self.currentCoordinate];
    self.eventAPIManager.delegate = self;
    [self createMapRegionAndSpanWithCoordinate:self.currentCoordinate];
    [self.eventAPIManager connectToAFGEAndTellDelegates];
    
}

-(void)hasReceivedSearchCoordinates:(CLPlacemark *)placemark
{
    [self createMapRegionAndSpanWithCoordinate:placemark.location.coordinate];
}

-(void)hasReceivedNearbyEvents:(NSMutableArray *)nearbyEvents
{
    for (int i = 0; i < nearbyEvents.count; i++)
    {
        [self createAnnotationFromEvent: [nearbyEvents objectAtIndex:i]];
    }
}

-(void)createMapRegionAndSpanWithCoordinate:(CLLocationCoordinate2D)mostRecentCoordinate
{
    CLLocationCoordinate2D currentCoordinate =
    {
        .latitude = mostRecentCoordinate.latitude,
        .longitude = mostRecentCoordinate.longitude
    };
    
    
    MKCoordinateSpan currentSpan =
    {
        .latitudeDelta = 0.2f,
        .longitudeDelta = 0.2f
    };
    
    MKCoordinateRegion currentRegion =
    {
        currentCoordinate,
        currentSpan
    };

    mapViewOutlet.region = currentRegion;
}

#pragma mark - Search Bar Methods

- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar
{
    NSLog(@"started editing");
    return YES;
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [searchBar resignFirstResponder];
    
    NSLog(@"return button pressed");
    
}


- (BOOL)searchBarShouldEndEditing:(UISearchBar *)searchBar
{
    [self.missGeocodingManager convertToPlacemarksFromString:searchBar.text];
    NSLog(@"search bar should end editing");
    return YES;
    
}

#pragma mark - Annotation Methods

-(void)createAnnotationFromEvent:(Event*)event
{
    self.myAnnotation = [[Annotation alloc] initWithLatitude:event.latitude
                                                andLongitude:event.longitude
                                                    andTitle:event.title
                                                 andSubTitle:event.subtitle];
    [mapViewOutlet addAnnotation:self.myAnnotation];
}

-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation
{
    MKAnnotationView *myAnnotationView = [mapView dequeueReusableAnnotationViewWithIdentifier:@"myAnnotation"];
    
    if (myAnnotationView == nil) {
        myAnnotationView = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"myAnnotation"];
    }

    return myAnnotationView;
}

-(void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view
{
    
}

-(void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

}

@end
