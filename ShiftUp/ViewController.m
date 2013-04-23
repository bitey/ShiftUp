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
@property (strong, nonatomic) LocationManager *missLocationManager;
@property (strong, nonatomic) APIManager *eventAPIManager;
@property (assign, nonatomic) CLLocationCoordinate2D currentCoordinate;
@property (strong, nonatomic) Event *afgeEvent;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.missLocationManager = [[LocationManager alloc]init];
    self.missLocationManager.delegate = self;
    self.myAnnotation = [[Annotation alloc]init];
    
    
    //////////////////////////////////////////////////
    //
    //
    //Added for demo
    //
    //
//    self.afgeEvent = [[Event alloc]init];
//    self.afgeEvent.title = @"Paul's super Awesome Event";
//    CLLocationCoordinate2D eventCoordinate =
//    {
//        .latitude = 38.897234,
//        .longitude = -77.010646
//    };
//    self.afgeEvent.coordinate = eventCoordinate;
//    self.afgeEvent.subtitle = @"This is where Paul will be demoing all the features";
//    [self createAnnotationFromEvent:self.afgeEvent];
    
    
    
    
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

-(void)createAnnotationFromEvent:(Event*)event
{
    self.myAnnotation.title = event.title;
    self.myAnnotation.coordinate = event.coordinate;
    self.myAnnotation.subtitle = event.subtitle;
    
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

//-(void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view
//{
//    
//}

-(void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

}

@end
