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
@property (strong, nonatomic) NSMutableArray *events;
@property (strong, nonatomic) GeocodingManager *missGeocodingManager;
@property (strong, nonatomic) LocationManager *missLocationManager;
@property (strong, nonatomic) Annotation *selectedAnnotation;
@property (assign, nonatomic) float zoomMultiplier;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.missLocationManager = [[LocationManager alloc]init];
    self.missLocationManager.delegate = self;
    
    self.missGeocodingManager = [[GeocodingManager alloc]init];
    self.missGeocodingManager.delegate = self;
    
    /////////////////////////////////////////
    // The following should be deleted once the APIs are in place
    //
    //
    self.events = [[NSMutableArray alloc]init];
    //
    ////////////////////////////////////////////
    
    self.zoomMultiplier = 1;
}

#pragma mark - Creating the Map Methods

-(void)hasCurrentCoordinate:(CLLocationCoordinate2D)mostRecentCoordinate
{
    self.currentCoordinate = mostRecentCoordinate;
    //
    //self.eventAPIManager = [[APIManager alloc]initWithNewCoordinates:self.currentCoordinate];
    //self.eventAPIManager.delegate = self;
    //
    [self createMapRegionAndSpanWithCoordinate:self.currentCoordinate];
    //
    //[self.eventAPIManager connectToAFGEAndTellDelegates];
    
    
    ///
    ////
    ////Delete the below method call
    ////
    /////
    [self createEvents];
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
        .latitudeDelta = (0.02 * self.zoomMultiplier),
        .longitudeDelta = (0.02 * self.zoomMultiplier)
    };
    
    MKCoordinateRegion currentRegion =
    {
        currentCoordinate,
        currentSpan
    };

    mapViewOutlet.region = currentRegion;
}

-(void)createEvents
{
    /////////////////////////////////////////
    // The following should be deleted once the APIs are in place
    //
    Event *event1 = [[Event alloc]initWithLatitude:38.897234 andLongitude:-77.010646 andTitle:@"Pauls Super Awesome Event" andSubTitle:@"This is where Paul will be demoing all the features"];
    [self.events addObject:event1];
    
    Event *event2 = [[Event alloc]initWithLatitude:38.893596 andLongitude:-77.014576 andTitle:@"Pizza Party" andSubTitle:@"Prices so low we are giving it away"];
    [self.events addObject:event2];
    
    Event *event3 = [[Event alloc]initWithLatitude:38.902055 andLongitude:-77.015362 andTitle:@"Silent Dance Party" andSubTitle:@"Shhhhhh"];
    [self.events addObject:event3];
    
    for (Event *currentEvent in self.events)
    {
        [self createAnnotationFromEvent:currentEvent];
    }
    
    
    ////////////////////////////////////////////
}

- (IBAction)zoomButtonPressed:(id)sender
{
    self.zoomMultiplier*=2;
    if (self.zoomMultiplier < 16000)
    {
        [self createMapRegionAndSpanWithCoordinate:self.currentCoordinate];
    }
    else
    {
        self.zoomMultiplier = 8000;
    }
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
    self.zoomMultiplier = 1;
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
                                                 andSubTitle:event.subtitle
                                              andDescription:event.description];
    self.selectedAnnotation = self.myAnnotation;
    [mapViewOutlet addAnnotation:self.myAnnotation];
}

-(MKAnnotationView *)mapView:(MKMapView *)mapView
           viewForAnnotation:(id<MKAnnotation>)annotation
{
    UIButton *detailButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    MKAnnotationView *myAnnotationView = [mapView dequeueReusableAnnotationViewWithIdentifier:@"myAnnotation"];
    if([annotation isKindOfClass: [MKUserLocation class]])
    {
        return nil;
    }
    
    if (myAnnotationView == nil) {
        myAnnotationView = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"myAnnotation"];
    }

    myAnnotationView.canShowCallout = YES;
    
    myAnnotationView.rightCalloutAccessoryView = detailButton;
    
    return myAnnotationView;
}

-(void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view
{
    if ([view.annotation isKindOfClass: [MKUserLocation class]])
        return;
    
    self.myAnnotation = view.annotation;
    
    NSLog(@"annotation selected: %@", self.myAnnotation);
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"PushForEventDetails"])
    {
        EventDetailsViewController *edvc = [segue destinationViewController];
        edvc.segueString = @"hello";
    }
    
}

-(void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

}

@end
