//
//  ViewController.h
//  ShiftUp
//
//  Created by StopBitingMe on 4/10/13.
//  Copyright (c) 2013 AFGE. All rights reserved.
//

#import "APIManager.h"
#import <CoreLocation/CoreLocation.h>
#import "Event.h"
#import "GeocodingManager.h"
#import "LocationManager.h"
#import <MapKit/MapKit.h>
#import <UIKit/UIKit.h>
#import "EventDetailsViewController.h"


@interface ViewController : UIViewController <MKMapViewDelegate, LocationManagerDelegate, APIManagerDelegate, GeocodingManagerDelegate, UISearchBarDelegate>

-(void)hasCurrentCoordinate:(CLLocationCoordinate2D)mostRecentCoordinate;

-(void)hasReceivedSearchCoordinates:(CLPlacemark *)placemark;

-(void)hasReceivedNearbyEvents:(NSMutableArray *)nearbyEvents;

-(void)createMapRegionAndSpanWithCoordinate:(CLLocationCoordinate2D)mostRecentCoordinate;

-(BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar;

-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar;

-(BOOL)searchBarShouldEndEditing:(UISearchBar *)searchBar;

-(void)createAnnotationFromEvent:(Event*)event;

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender;

-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation;

-(void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view;

@end
